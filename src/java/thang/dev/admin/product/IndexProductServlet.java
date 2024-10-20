package thang.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Product;
import thang.dev.util.Constants;

/**
 *
 * @author Bắp
 */
public class IndexProductServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();

        // Lấy số trang
        int page = 1; // Giá trị mặc định cho page
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1; // Nếu có lỗi trong việc phân tích, quay lại trang 1
            }
        }

        // Lấy tất cả sản phẩm mà không có lọc
        List<Product> productList = productDao.findAll();

        // Kiểm tra và ghi nhận số lượng sản phẩm trả về
        System.out.println("Total products: " + productList.size());

        // Tính tổng số sản phẩm
        int total = productList.size(); // Tổng số sản phẩm
        int numberPage = (int) Math.ceil((double) total / Constants.PER_PAGE_ADMIN); // Tính số trang

        List<Product> paginatedList = new ArrayList<>();
        if (total > 0) {
            int startIndex = (page - 1) * Constants.PER_PAGE_ADMIN;
            int endIndex = Math.min(startIndex + Constants.PER_PAGE_ADMIN, total);
            paginatedList = productList.subList(startIndex, endIndex);
        }

        // Gửi dữ liệu đến JSP
        request.setAttribute("productList", paginatedList);
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberPage);

        request.getRequestDispatcher("admin/product/index.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }
}
