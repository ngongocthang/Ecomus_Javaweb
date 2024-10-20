package thang.dev.admin.product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.CategoryDao;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;

/**
 *
 * @author Bắp
 */
public class DeleteProductServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        productDao.delete(productId);

            response.sendRedirect("IndexProductServlet?message=Product deleted successfully!");

    }
}
