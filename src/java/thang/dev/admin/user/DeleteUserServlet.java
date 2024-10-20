package thang.dev.admin.user;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;

/**
 *
 * @author Bắp
 */
public class DeleteUserServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        userDao.delete(userId);

//                response.sendRedirect("IndexUserServlet");
            response.sendRedirect("IndexUserServlet?message=User deleted successfully!");

    }
}
