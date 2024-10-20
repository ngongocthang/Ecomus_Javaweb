package thang.dev.admin.category;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.CategoryDao;
import thang.dev.data.dao.DatabaseDao;

/**
 *
 * @author Bắp
 */
public class DeleteCategoryServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        categoryDao.delete(categoryId);

            response.sendRedirect("IndexCategoryServlet?message=Category deleted successfully!");

    }
}
