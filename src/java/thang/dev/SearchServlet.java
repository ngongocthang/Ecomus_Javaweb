/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Product;
import thang.dev.util.Constants;

/**
 *
 * @author Bắp
 */
public class SearchServlet extends BaseServlet {

    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        super.doGet(request, response);
//        String keyword = request.getParameter("keyword");
//        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
//        List<Product> productList = productDao.findByName(keyword);
//
//        request.setAttribute("productList", productList);
//        request.setAttribute("keyword", keyword);
//
//        request.getRequestDispatcher("search.jsp").include(request, response);
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    super.doGet(request, response);
    
    // Lấy từ khóa tìm kiếm
    String keyword = request.getParameter("keyword");

    // Lấy các tham số lọc
    String property = request.getParameter("property");
    if (property == null || property.isEmpty()) {
        property = "name"; // Giá trị mặc định
    }
    
    String order = request.getParameter("order");
    if (order == null || order.isEmpty()) {
        order = "asc"; // Giá trị mặc định
    }

    ProductDao productDao = DatabaseDao.getInstance().getProductDao();

    // Lấy danh sách sản phẩm sau khi áp dụng bộ lọc
    List<Product> productList = productDao.findByNameAndFilter(keyword, property, order);

    // Logic phân trang
    int page = 1;
    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            page = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            page = 1;
        }
    }

    // Tính toán phân trang
    int total = productList.size();
    int numberPage = (int) Math.ceil((double) total / Constants.PER_PAGE);

    // Lấy danh sách sản phẩm của trang hiện tại
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
    request.setAttribute("keyword", keyword);
    request.setAttribute("property", property);  // Gửi giá trị lọc đến JSP
    request.setAttribute("order", order);        // Gửi giá trị sắp xếp đến JSP

    request.getRequestDispatcher("search.jsp").include(request, response);
}


     

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
