<%-- 
    Document   : index
    Created on : 24 thg 8, 2024, 16:12:02
    Author     : Bắp
--%>

<%@page import="thang.dev.HomeServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% response.sendRedirect("HomeServlet");             %>
    </body>
</html>
