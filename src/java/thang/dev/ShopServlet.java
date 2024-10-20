package thang.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Product;
import thang.dev.util.Constants;

public class ShopServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

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

        // Lấy sản phẩm theo thuộc tính và thứ tự nếu có
        List<Product> productList;
        String property = request.getParameter("property");
        String order = request.getParameter("order");
        
        if (property != null && order != null) {
            productList = productDao.filterShop(property, order); // Không sử dụng productId
        } else {
            productList = productDao.findAll();
        }
        
        // Kiểm tra và ghi nhận số lượng sản phẩm trả về
    System.out.println("Total products after filtering: " + productList.size());

        // Tính tổng số sản phẩm đã lọc
        int total = productList.size(); // Tổng số sản phẩm sau khi lọc
        int numberPage = (int) Math.ceil((double) total / Constants.PER_PAGE); // Tính số trang

        List<Product> paginatedList = new ArrayList<>();
        if (total > 0) {
            int startIndex = (page - 1) * Constants.PER_PAGE;
            int endIndex = Math.min(startIndex + Constants.PER_PAGE, total);
            paginatedList = productList.subList(startIndex, endIndex);
        }

        // Gửi dữ liệu đến JSP
        request.setAttribute("productList", paginatedList);
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberPage);

        request.getRequestDispatcher("shop.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }
}