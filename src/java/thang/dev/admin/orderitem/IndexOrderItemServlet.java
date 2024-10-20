package thang.dev.admin.orderitem;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.OrderDao;
import thang.dev.data.dao.OrderItemDao;
import thang.dev.data.model.Order;
import thang.dev.data.model.OrderItem;

/**
 *
 * @author Bắp
 */
public class IndexOrderItemServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();
        List<OrderItem> orderItemList = orderItemDao.findByOder(orderId);
        
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        Order order = orderDao.find(orderId);

        request.setAttribute("order", order);
        request.setAttribute("orderItemList", orderItemList);
        request.getRequestDispatcher("admin/orderitem/index.jsp").include(request, response);

    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }
}
