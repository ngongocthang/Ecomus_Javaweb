/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Random;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.UserDao;
import thang.dev.data.model.User;
import org.mindrot.jbcrypt.BCrypt;
import java.util.regex.Pattern;
import thang.dev.util.Constants;
import thang.dev.util.EmailService;

/**
 *
 * @author Bắp
 */
public class RegisterServlet extends BaseServlet {

    private static final String SMTP_SERVER = "smtp.gmail.com";
    private static final int SMTP_PORT = 587; // Cổng cho TLS
    private static final String USERNAME = "ngongocthang18082004@gmail.com";
    private static final String PASSWORD = "vwjsguzernqqcaup";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        super.doGet(request, response);
        request.getRequestDispatcher("register.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate email
        if (!Constants.EMAIL_PATTERN.matcher(email).matches()) {
            session.setAttribute("error", "Email không hợp lệ");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (password.length() < Constants.MIN_PASSWORD_LENGTH) {
            session.setAttribute("error", "Mật khẩu phải có ít nhất " + Constants.MIN_PASSWORD_LENGTH + " ký tự");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email);
        if (user != null) {
            session.setAttribute("error", "Email đã tồn tại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            String confirmationCode = generateConfirmationCode();
            user = new User(email, hashedPassword, "user", confirmationCode, false);
            userDao.insert(user);

            sendConfirmationEmail(email, confirmationCode);

            session.setAttribute("email", email);
            session.setAttribute("confirmationCode", confirmationCode);
            session.setAttribute("waitingForConfirmation", true);
            response.sendRedirect("Confirm.jsp");
        }
    }

    

    private String generateConfirmationCode() {
        int code = new Random().nextInt(999999); // Generate a random 6-digit code
        return String.format("%06d", code); // Format to 6 digits
    }

    private void sendConfirmationEmail(String email, String confirmationCode) {
        String subject = "Confirm your account";
        String body = "Your confirmation code is: " + confirmationCode + ". Please enter this code to confirm your account.";

        System.out.println("Attempting to send confirmation email to: " + email); // Debug log

        try {
            EmailService.sendEmail(email, subject, body);
            System.out.println("Email sent successfully to: " + email); // Log success
        } catch (Exception e) {
            System.err.println("Failed to send email to " + email + ": " + e.getMessage()); // Log failure
            e.printStackTrace(); // Print stack trace for further inspection
        }
    }
}
