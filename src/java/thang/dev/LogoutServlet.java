package thang.dev;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


/**
 *
 * @author Bắp
 */
public class LogoutServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        // get session
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        
        response.sendRedirect("LoginServlet");
        }
    
    @Override
            protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
            }
    }
