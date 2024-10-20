/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thang.dev;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 *
 * @author Bắp
 */
public class BlogServlet extends BaseServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
                request.getRequestDispatcher("blog.jsp").include(request, response);
        }
    
    @Override
            protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
            }
    }
