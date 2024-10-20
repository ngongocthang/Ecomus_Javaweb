package thang.dev;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;

/**
 *
 * @author Bắp
 */
public class LoginServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        super.doGet(request, response);
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            response.sendRedirect("HomeServlet");
        }
        request.getRequestDispatcher("user.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email, password);
        if (user == null) {
            session.setAttribute("errors", "Login Failed!!");
            response.sendRedirect("LoginServlet");
        } else {
            session.setAttribute("user", user);
            if (user.getRole().equals("admin")||user.getRole().equals("staff")) {
                response.sendRedirect("DashboardServlet");
            } else {
                response.sendRedirect("HomeServlet");
            }
        }
    }
}
