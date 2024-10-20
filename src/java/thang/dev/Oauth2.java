/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;
import thang.dev.util.GoogleAccount;

/**
 *
 * @author Bắp
 */
@WebServlet(name = "Oauth2", urlPatterns = {"/login"})
public class Oauth2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy mã xác thực từ request
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("LoginServlet");
            return;
        }

        // Lấy access token từ Google
        GoogleLogin googleLogin = new GoogleLogin();
        String accessToken = googleLogin.getToken(code);

        // Lấy thông tin người dùng từ Google
        GoogleAccount googleAccount = googleLogin.getUserInfo(accessToken);

        // Kiểm tra tài khoản có tồn tại trong DB không
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(googleAccount.getEmail());


        // Nếu tài khoản chưa tồn tại, lưu thông tin người dùng vào DB
        if (user == null) {
            user = new User();
            user.setEmail(googleAccount.getEmail());
            user.setPassword("12345678");
                        user.setRole("user");

            userDao.insert(user);
        }

        // Lưu thông tin người dùng vào session và chuyển hướng về trang HomeServlet
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
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
        return "Google OAuth2 Login Servlet";
    }

}
