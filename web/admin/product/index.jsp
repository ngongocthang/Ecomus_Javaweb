<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="./assets/admin/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="./assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="./assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="./assets/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="./assets/admin/css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Sidebar Start -->
            <%@include file = "../inc/sidebar.jsp" %>
            <!-- Sidebar End -->
            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file = "../inc/navbar.jsp" %>
                <!-- Navbar End -->
                <!-- Table Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="bg-light rounded h-100 p-4">
                                <h6 class="mb-4">Product Table</h6>
                                <div class="table-responsive">
                                    <table class="table" style=" vertical-align: middle;">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Thumbnail</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">View</th>
                                                <th scope="col">Category</th>
                                                <th scope="col">Edit</th>
                                                <th scope="col">Delete</th>
                                            </tr>
                                        </thead>

                                        <tbody>



                                            <c:set var="index" value="1" />
                                            <c:forEach items="${productList}" var="product">
                                                <tr>
                                                    <th scope="row">${index}</th>
                                                    <td><img style="width: 75px; height: 75px;  object-fit: cover;" src="${pageContext.request.contextPath}/storage/${product.thumbnail}" alt="alt"/></td>
                                                    <td>${product.name}</td>
                                                    <td>${product.description}</td>
                                                    <td>${product.price}</td>
                                                    <td>${product.quantity}</td>
                                                    <td>${product.view}</td>
                                                    <td>${product.category.name}</td>

                                                    <td><a href="EditProductServlet?productId=${product.id}" style="color: orange;"><i class="fa fa-edit me-2"></i></a></td>
                                                    <td>
                                                        <form action="DeleteProductServlet" method="POST">
                                                            <button style="border: none; background: none; padding: 0; cursor: pointer;">
                                                                <input type="hidden" name="productId" value="${product.id}">
                                                                <i class="fa fa-trash me-2" style="color: red;"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <c:set var="index" value="${index + 1}" />
                                            </c:forEach>
                                        </tbody>
                                    </table>    
                                </div>

                                <!-- Phân trang -->
                                <nav aria-label="Page navigation example" class="mt-3">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${page > 1}">
                                            <li class="page-item">
                                                <a class="page-link" href="IndexProductServlet?page=${page - 1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach var="i" begin="1" end="${numberPage}">
                                            <c:if test="${i == page}">
                                                <li class="active">
                                                    <a href="IndexProductServlet?page=${i}" class="page-link">${i}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${i != page}">
                                                <li>
                                                    <a href="IndexProductServlet?page=${i}" class="page-link animate-hover-btn">${i}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${page < numberPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="IndexProductServlet?page=${page + 1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>

                            </div>
                        </div>  
                    </div>
                </div>
                <!-- Table End -->

                <!-- Footer Start -->
                <%@include file = "../inc/footer.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/admin/lib/chart/chart.min.js"></script>
        <script src="./assets/admin/lib/easing/easing.min.js"></script>
        <script src="./assets/admin/lib/waypoints/waypoints.min.js"></script>
        <script src="./assets/admin/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/moment.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>