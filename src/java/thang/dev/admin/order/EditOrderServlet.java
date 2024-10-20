package thang.dev.admin.order;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.UserDao;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.OrderDao;
import thang.dev.data.model.User;
import thang.dev.data.model.Order;

/**
 *
 * @author Bắp
 */
public class EditOrderServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        Order order = orderDao.find(orderId);
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        List<User> userList = userDao.findAll();

        request.setAttribute("userList", userList);
        request.setAttribute("order", order);
//        System.out.println(order.getCode());
        request.getRequestDispatcher("admin/order/edit.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        Order order = orderDao.find(orderId);

        String code = request.getParameter("code");
        String status = request.getParameter("status");
        int user_id = Integer.parseInt(request.getParameter("user_id"));

        order.setCode(code);
        order.setStatus(status);
        order.setUserId(user_id);

        orderDao.update(order);
        response.sendRedirect("IndexOrderServlet?message=Order Updated successfully!");
    }
}
