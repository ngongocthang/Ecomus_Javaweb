package thang.dev.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import thang.dev.data.dao.Database;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.model.User;

public abstract class BaseAdminServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        DatabaseDao.init(new Database());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        checkAdminAccess(request, response);
        if (response.isCommitted()) {
            return; // Nếu đã chuyển hướng, dừng lại
        }
        handleGet(request, response); // phuong thuc xu li rieng
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        checkAdminAccess(request, response);
        if (response.isCommitted()) {
            return;
        }
        handlePost(request, response); // phuong thuc xu li rieng
    }

    protected abstract void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    protected abstract void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException;

    /*
    * middleware
     */
    protected void checkAdminAccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !(user.getRole().equals("admin") || user.getRole().equals("staff"))) {
            response.sendRedirect("HomeServlet");
        }

    }

    /**
     * policy
     */
    protected void policy(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().equals("admin")) {
            response.sendRedirect("admin/authorization.jsp");
            return; // Dừng lại sau khi chuyển hướng
        }
    }

}
