package thang.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;
import thang.dev.util.FacebookAccount;

@WebServlet(name = "Oauth2FacebookServlet", urlPatterns = {"/Oauth2FacebookServlet"})
public class Oauth2FacebookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy mã xác thực từ request
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("LoginServlet");
            return;
        }

        // Lấy access token từ Facebook
        FacebookLogin fbLogin = new FacebookLogin();
        String accessToken = fbLogin.getToken(code);

        // Lấy thông tin người dùng từ Facebook
        FacebookAccount fbAccount = fbLogin.getUserInfo(accessToken);

        // Kiểm tra xem tài khoản đã có trong DB chưa
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(fbAccount.getEmail());
        
        // Nếu tài khoản chưa tồn tại, tạo mới trong DB
        if (user == null) {
            user = new User();
            user.setEmail(fbAccount.getEmail());
            user.setPassword("12345678");
            user.setRole("user");
            userDao.insert(user);
        }

        // Lưu thông tin người dùng vào session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // Chuyển hướng về HomeServlet
        response.sendRedirect("HomeServlet");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "OAuth2 Facebook Login Servlet";
    }
}
