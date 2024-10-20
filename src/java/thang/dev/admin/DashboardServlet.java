package thang.dev.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.OrderDao;
import thang.dev.data.model.Order;
import thang.dev.data.model.User;
import thang.dev.util.GetDateTime;

/**
 *
 * @author Bắp
 */
public class DashboardServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {

        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDateTime now = LocalDateTime.now();
        int numberOrderToday = orderDao.countOrderByDay(dtf.format(now));

        List<Order> orderList = orderDao.findAll();
        int numberOrderAll = orderList.size();
        List<Order> orderPendingList = orderDao.findByStatus("pending");

        int numberOrderPending = orderPendingList.size();
        int numberOrderFinish = numberOrderAll - numberOrderPending;

        request.setAttribute("numberOrderToday", numberOrderToday);
        request.setAttribute("numberOrderAll", numberOrderAll);
        request.setAttribute("numberOrderPending", numberOrderPending);
        request.setAttribute("numberOrderFinish", numberOrderFinish);
        request.setAttribute("orderPendingList", orderPendingList);
        request.setAttribute("user", user);

//        chart
        List<String> dateList = GetDateTime.get7Date();
        List<Integer> orderByDateList = new ArrayList<>();

        for (String d : dateList) {
            int n = orderDao.countOrderByDay(d);
            orderByDateList.add(n);
        }

        request.setAttribute("orderPendingList", orderPendingList);
        request.setAttribute("dateList", dateList);
        request.setAttribute("orderByDateList", orderByDateList);
        request.getRequestDispatcher("admin/dashboard.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
    }
}
