package thang.dev.admin.user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;

/**
 *
 * @author Bắp
 */
public class EditUserServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        policy(request, response);
        if (response.isCommitted()) {
            return;
        }
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(userId);

        request.setAttribute("user", user);
        request.getRequestDispatcher("admin/user/edit.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(userId);
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
      
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        
        userDao.update(user);
        response.sendRedirect("IndexUserServlet");
    }
}
