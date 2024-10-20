<%-- 
    Document   : Confirm
    Created on : 18 thg 10, 2024, 09:20:37
    Author     : Bắp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Confirm Your Account</title>
        <meta name="author" content="themesflat.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- Font -->
        <link rel="stylesheet" href="./assets/fonts/fonts.css">
        <link rel="stylesheet" href="./assets/fonts/font-icons.css">
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/drift-basic.min.css">
        <link rel="stylesheet" href="./assets/css/photoswipe.css">
        <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="./assets/css/animate.css">
        <link rel="stylesheet" href="./assets/css/styles.css">

        <!-- Favicon and Touch Icons -->
        <link rel="shortcut icon" href="./assets/images/logo/favicon.png">
        <link rel="apple-touch-icon-precomposed" href="./assets/images/logo/favicon.png">

        <style>
            body {
                background-color: #f8f9fa; /* Light gray background */
            }
            .container {
                max-width: 400px; /* Set a max width for the form */
                margin-top: 100px; /* Space from the top */
                padding: 20px;
                background-color: white; /* White background for the form */
                border-radius: 10px; /* Rounded corners */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow effect */
            }
            .btn-primary {
                background-color: #000; /* Black button */
                border-color: #000; /* Button border color */
            }
            .btn-primary:hover {
                background-color: #333; /* Darker black on hover */
            }
            .form-group label {
                font-weight: bold; /* Bold labels */
            }
        </style>
    </head>
    <body>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ include file="inc/header.jsp" %>

        <div class="container">
            <h2 class="text-center mb-4">Nhập mã xác nhận</h2>
            <form action="ConfirmCodeServlet" method="post">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" class="form-control" value="<%= session.getAttribute("email")%>" readonly />
                </div>
                <div class="form-group">
                    <label for="confirmationCode">Mã xác nhận:</label>
                    <input type="text" name="confirmationCode" class="form-control" required />
                </div>
                <div class="form-check mb-3">

                </div>
                <button type="submit" class="btn btn-primary btn-block">Xác nhận</button>
            </form>

            <%
                String error = (String) session.getAttribute("error");
                if (error != null) {
            %>
            <div class="alert alert-danger mt-3">
                <%= error%>
            </div>
            <%
                    session.removeAttribute("error");
                }
            %>
        </div>

        <%@ include file="inc/footer.jsp" %>

        <!-- Javascript -->
        <script type="text/javascript" src="./assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./assets/js/swiper-bundle.min.js"></script>
        <script type="text/javascript" src="./assets/js/carousel.js"></script>
        <script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="./assets/js/lazysize.min.js"></script>
        <script type="text/javascript" src="./assets/js/count-down.js"></script>
        <script type="text/javascript" src="./assets/js/wow.min.js"></script>
        <script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
        <script type="text/javascript" src="./assets/js/main.js"></script>
    </body>
</html>

