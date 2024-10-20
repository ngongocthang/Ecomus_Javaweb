package thang.dev.admin.user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;

/**
 *
 * @author Bắp
 */
public class CreateUserServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        policy(request, response);
        if (response.isCommitted()) {
            return;
        }

        request.getRequestDispatcher("admin/user/create.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String role = request.getParameter("role");
        HttpSession session = request.getSession();
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email);

        if (email.isEmpty() || password.isEmpty() || repassword.isEmpty() || role.isEmpty()) {
            session.setAttribute("error", "Vui long nhap day du thong tin!");
            request.getRequestDispatcher("admin/user/create.jsp").include(request, response);
        } else if (user != null) {
            session.setAttribute("error", "Email da duoc su dung!");
            request.getRequestDispatcher("admin/user/create.jsp").include(request, response);
        } else if (!password.equals(repassword)) {
            session.setAttribute("error", "Mat khau khong trung nhau!");
            request.getRequestDispatcher("admin/user/create.jsp").include(request, response);
        } else {
            user = new User(email, password, role, role, true);
//            user = new User(email, password, role);
            userDao.insert(user);

            response.sendRedirect("IndexUserServlet");
        }
    }
}
