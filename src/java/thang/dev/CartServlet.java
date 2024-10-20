/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.OrderItem;
import thang.dev.data.model.Product;
import thang.dev.util.Constants;
import thang.dev.util.Helper;
import thang.dev.util.QRCodeUtil;

/**
 *
 * @author Bắp
 */
public class CartServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        super.doGet(request, response);
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
        List<Product> newProductList = productDao.news(Constants.NUMBER_LIMIT_NEW);
        if (cart == null) {
            cart = new ArrayList<OrderItem>();
        }
        request.setAttribute("cart", cart);
        request.setAttribute("total", Helper.total(cart));
        System.out.println("Cart after adding product: " + cart);
        request.setAttribute("newProductList", newProductList);

        request.getRequestDispatcher("cart.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createOrder(request);
                break;
            case "update":
                updateOrder(request);
                break;
            case "delete":
                deleteOrder(request);
                break;
            default:
                throw new AssertionError();
        }

        response.sendRedirect("CartServlet");

    }

    private void createOrder(HttpServletRequest request) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        double price = Double.parseDouble(request.getParameter("price"));

        //tao moi mot doi tuong orderitem
        OrderItem orderItem = new OrderItem(quantity, price, 0, productId);

        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        boolean isExistInCart = false;

        if (cart == null) {
            cart = new ArrayList<>();
        } else {
            /*cu phap for each trong java: 
            for (Type element : collection) {
            
            }
            | type: kiểu dữ liệu  
            | element: bien dai dien
            | collection:  tập hợp chứa các phần tử mà bạn muốn lặp qua
             */
            for (OrderItem ord : cart) {
                if (ord.getProductId() == productId) {
                    ord.setQuantity(ord.getQuantity() + quantity);
                    isExistInCart = true;
                    break;
                }
            }
        }
        if (!isExistInCart) {
            cart.add(orderItem);
        }
        session.setAttribute("cart", cart);
          String bankName = "Tran Huu Thai";
        String accountNumber = "0123456789";

        String qrCodeData = QRCodeUtil.generateQRCodeData(cart, bankName, accountNumber);
        session.setAttribute("qrCodeData", qrCodeData);

        String qrCodeBase64 = QRCodeUtil.generateQRCodeImage(qrCodeData);
        session.setAttribute("qrCodeImage", qrCodeBase64);
    }

    private void updateOrder(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        if (cart != null && cart.isEmpty() == false) {
            for (OrderItem ord : cart) {
                if (ord.getProductId() == productId) {
                    ord.setQuantity(quantity);
                }
            }
        }
        session.setAttribute("cart", cart);
    }

    private void deleteOrder(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        if (cart != null) {
            for (int i = 0; i < cart.size(); i++) {
                OrderItem ord = cart.get(i);
                if (ord.getProductId() == productId) {
                    cart.remove(ord);
                }
            }
        }
        session.setAttribute("cart", cart);
    }
}
