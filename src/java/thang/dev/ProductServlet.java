/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import thang.dev.data.dao.CategoryDao;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Category;
import thang.dev.data.model.Product;
import thang.dev.util.Constants;
import thang.dev.util.QRCodeUtil;

/**
 *
 * @author Bắp
 */
public class ProductServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();

        Product product = productDao.find(productId);
        List<Product> newProductList = productDao.news(Constants.NUMBER_LIMIT_NEW);

        int categoryId = product.getCategoryId();
        List<Product> findProductByCategory = productDao.findByCategory(categoryId);

        String qrCodeData = "Product ID: " + productId + "\n"
                + "Product Name: " + product.getName() + "\n"
                + "Product Image: " + product.getThumbnail() + "\n"
                + "Price: " + product.getPrice();

        String qrCodeImage = QRCodeUtil.generateQRCodeImage(qrCodeData);
        request.setAttribute("product", product);
        request.setAttribute("findProductByCategory", findProductByCategory);
        request.setAttribute("qrCodeImage", qrCodeImage);

        request.getRequestDispatcher("product.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }
}
