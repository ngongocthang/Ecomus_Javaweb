<%@include file = "./inc/header.jsp" %>
<!-- page-title -->
<div class="tf-page-title" style="margin-top: 90px;">
    <div class="container-full">
        <div class="heading text-center">#Shop</div>
        <p class="text-center text-2 text_black-2 mt_5">Shop through our latest selection of Fashion</p> 
    </div>
</div>
<!-- /page-title -->

<!-- Section Product -->
<section class="flat-spacing-2">
    <div class="container">
        <div class="tf-shop-control grid-3 align-items-center">
            <div class="tf-control-filter">
                <a href="#filterShop" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft" class="tf-btn-filter"><span class="icon icon-filter"></span><span class="text">Filter</span></a>
            </div>

        </div>

        <div class="grid-layout wrapper-shop" data-grid="grid-4">
            <c:forEach items="${productList}" var="product">
                <!-- card product 1 -->
                <div class="card-product">
                    <div class="card-product-wrapper">
                        <a href="ProductServlet?productId=${product.id}" class="product-img">
                            <img class="lazyload img-product" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="${pageContext.request.contextPath}/storage/${product.thumbnail}" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                            <img class="lazyload img-hover" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="${pageContext.request.contextPath}/storage/${product.thumbnail}" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                        </a>
                        <div class="list-product-btn">
                            <a href="#quick_view" data-bs-toggle="modal" class="box-icon bg_white quickview tf-btn-loading">
                                <span class="icon icon-view"></span>
                                <span class="tooltip">Quick View</span>
                            </a>
                        </div>
                    </div>
                    <div class="card-product-info">
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="ProductServlet?productId=${product.id}" class="title link ms-3">${product.name}</a>
                            <span class="price me-3">Price: $${product.price}</span>
                        </div>
                        <div class="d-block text-center">
                            <span class="text-truncate d-inline-block" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                ${product.description}
                            </span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- pagination -->
        <ul class="tf-pagination-wrap tf-pagination-list">
            <c:if test="${page > 1}">
                <li>
                    <a href="ShopServlet?page=${page - 1}" class="pagination-link animate-hover-btn">
                        <span class="icon icon-arrow-left"></span>
                    </a>
                </li>
            </c:if>

            <c:forEach var="i" begin="1" end="${numberPage}">
                <c:if test="${i == page}">
                    <li class="active">
                        <a href="ShopServlet?page=${i}" class="pagination-link">${i}</a>
                    </li>
                </c:if>
                <c:if test="${i != page}">
                    <li>
                        <a href="ShopServlet?page=${i}" class="pagination-link animate-hover-btn">${i}</a>
                    </li>
                </c:if>
            </c:forEach>

            <c:if test="${page < numberPage}">
                <li>
                    <a href="ShopServlet?page=${page + 1}" class="pagination-link animate-hover-btn">
                        <span class="icon icon-arrow-right"></span>
                    </a>
                </li>
            </c:if>
        </ul>
        
    </div>
</section>
<!-- /Section Product -->


<!-- Filter -->
<div class="offcanvas offcanvas-start canvas-filter" id="filterShop">
    <div class="canvas-wrapper">
        <header class="canvas-header">
            <div class="filter-icon">
                <span class="icon icon-filter"></span>
                <span>Filter</span>
            </div>
            <span class="icon-close icon-close-popup" data-bs-dismiss="offcanvas" aria-label="Close"></span>
        </header>
        <div class="canvas-body">
            <!-- Form ?? l?c d? li?u gi?ng ?o?n code 1 -->
            <form action="ShopServlet" method="get" id="facet-filter-form" class="facet-filter-form">
                <input type="hidden" name="productId" value="${product.id}">

                <!-- Widget l?c Property -->
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#property"  aria-expanded="true" aria-controls="property">
                        <span>Property</span>
                    </div>
                    <div id="property" class="collapse show">
                        <select name="property" class="form-select mb_36">
                            <option value="name">Name</option>
                            <option value="price">Price</option>    
                            <option value="createdAt">Time</option>
                        </select>
                    </div>
                </div>

                <!-- Widget l?c Order -->
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#order" aria-expanded="true" aria-controls="order">
                        <span>Order</span>
                    </div>
                    <div id="order" class="collapse show">
                        <select name="order" class="form-select mb_36">
                            <option value="asc">A-Z</option>
                            <option value="desc">Z-A</option>
                        </select>
                    </div>
                </div>

                <!-- Nút filter -->
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>
        </div>
    </div>       
</div>
<!-- End Filter -->



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
<script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.min.js"></script>
<script type="text/javascript" src="./assets/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="./assets/js/carousel.js"></script>

<script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="./assets/js/lazysize.min.js"></script>
<script type="text/javascript" src="./assets/js/count-down.js"></script>   
<script type="text/javascript" src="./assets/js/wow.min.js"></script>   
<script type="text/javascript" src="./assets/js/rangle-slider.js"></script>
<script type="text/javascript" src="./assets/js/wow.min.js"></script>
<script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
<script type="text/javascript" src="./assets/js/main.js"></script>
</body>


<!-- Mirrored from themesflat.co/html/ecomus/shop-default.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:24:49 GMT -->
</html>