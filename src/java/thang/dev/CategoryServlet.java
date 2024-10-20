/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import thang.dev.data.dao.CategoryDao;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Product;
import thang.dev.data.model.Category;
import thang.dev.util.Constants;

/**
 *
 * @author Bắp
 */
public class CategoryServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        Category category = categoryDao.find(categoryId);

        // Lấy số trang
        int page = 1; // Giá trị mặc định cho page
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // Nếu có lỗi trong việc phân tích, quay lại trang 1
            }
        }

        // Lấy sản phẩm theo thuộc tính và thứ tự nếu có
        List<Product> productList;
        if (request.getParameter("property") != null && request.getParameter("order") != null) {
            String property = request.getParameter("property");
            String order = request.getParameter("order");
            productList = productDao.filter(categoryId, property, order);
        } else {
            productList = productDao.findByCategory(categoryId);
        }

        // Tính tổng số sản phẩm đã lọc
        int total = productList.size(); // Tổng số sản phẩm sau khi lọc
        int numberPage = (int) Math.ceil((double) total / Constants.PER_PAGE); // Tính số trang

        // Lấy danh sách sản phẩm cho trang hiện tại từ danh sách đã lọc
        int startIndex = (page - 1) * Constants.PER_PAGE;
        int endIndex = Math.min(startIndex + Constants.PER_PAGE, total);
        List<Product> paginatedList = productList.subList(startIndex, endIndex);

        // Gửi dữ liệu đến JSP
        request.setAttribute("productList", paginatedList);
        request.setAttribute("category", category);
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberPage);

        request.getRequestDispatcher("category.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}