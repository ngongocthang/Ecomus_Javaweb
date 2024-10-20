package thang.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;

public class ConfirmCodeServlet extends BaseServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String confirmationCode = request.getParameter("confirmationCode");

        UserDao userDAO = DatabaseDao.getInstance().getUserDao();
        User user = userDAO.find(email);

        System.out.println("Email: " + email);
        System.out.println("Confirmation Code: " + confirmationCode);

        if (user != null) {
            System.out.println("User found, checking confirmation code...");

            String userConfirmationCode = user.getConfirmationCode();
            if (userConfirmationCode != null && userConfirmationCode.equals(confirmationCode)) {
                user.setIsConfirmed(true);
                userDAO.update(user);

                session.setAttribute("success", "Xác nhận email thành công! Bạn có thể đăng nhập.");
                System.out.println("Confirmation successful, redirecting to LoginServlet...");
                response.sendRedirect("LoginServlet");
                return; // Ensure to return after redirect
            } else {
                System.out.println("Invalid confirmation code.");
            }
        } else {
            System.out.println("User not found.");
        }

        session.setAttribute("error", "Mã xác nhận không hợp lệ. Vui lòng thử lại.");
        response.sendRedirect("Confirm.jsp");
    }
}
