<%@page import="thang.dev.data.model.Product"%>
<%@page import="thang.dev.data.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@include file = "./inc/header.jsp" %>
<div id="wrapper">
    <!-- page-title -->
    <div class="tf-page-title style-2" style="margin-top: 90px;">
        <div class="container-full">
            <div class="heading text-center">#My Orders</div>
        </div>
    </div>
    <!-- /page-title -->

    <!-- form -->
    <section class="flat-spacing-21">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8"> 
                    <div class="tf-content-center">
                        <div>
                            <table class="table border">
                                <thead>
                                    <tr>
                                        <th scope="col" class="font-weight-bold">#</th>
                                        <th scope="col" class="font-weight-bold">Code</th>
                                        <th scope="col" class="font-weight-bold">Order date</th>
                                        <th scope="col" class="font-weight-bold">Status</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="index" value="1" />
                                    <c:forEach items="${orderFindByUser}" var="order">
                                        <tr>
                                            <th scope="row">${index}</th>
                                            <td class="text-primary">${order.code}</td>
                                            <td>${order.createdAt }</td>
                                            <td style="color: ${order.status == 'pending' ? 'red' : (order.status == 'finished' ? 'orange' : 'green')}">
                                                ${order.status}
                                            </td>
                                        </tr>
                                        <c:set var="index" value="${index + 1}" />
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /form -->



    <%@include file = "./inc/footer.jsp" %>


</div>

<!-- gotop -->
<div class="progress-wrap">
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
    <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" style="transition: stroke-dashoffset 10ms linear 0s; stroke-dasharray: 307.919, 307.919; stroke-dashoffset: 286.138;"></path>
    </svg>
</div>
<!-- /gotop -->

<!-- Javascript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="js/carousel.js"></script>
<script type="text/javascript" src="js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="js/lazysize.min.js"></script>
<script type="text/javascript" src="js/count-down.js"></script>   
<script type="text/javascript" src="js/wow.min.js"></script>   
<script type="text/javascript" src="js/jquery-validate.js"></script>   
<script type="text/javascript" src="js/multiple-modal.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>


<!-- Mirrored from themesflat.co/html/ecomus/contact-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:27:42 GMT -->
</html>