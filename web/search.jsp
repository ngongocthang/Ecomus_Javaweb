<%@include file = "./inc/header.jsp" %>
<!-- page-title -->
<div class="tf-page-title" style="margin-top: 90px;">
    <div class="container-full">
        <div class="heading text-center">#${keyword}</div>
        <p class="text-center text-2 text_black-2 mt_5">Shop through our latest selection of Fashion</p> 
    </div>
</div>
<!-- /page-title -->

<!-- Section Product -->
<section class="flat-spacing-2">
    <div class="container">
        <div class="tf-shop-control grid-3 align-items-center">
            <div class="tf-control-filter">
                <a href="#filterShop" data-bs-toggle="offcanvas" aria-controls="offcanvasLeft" class="tf-btn-filter">
                    <span class="icon icon-filter"></span><span class="text">Filter</span>
                </a>
            </div>
        </div>

        <div class="grid-layout wrapper-shop" data-grid="grid-4">
            <!-- Loop through product list -->
            <c:forEach items="${productList}" var="product">
                <div class="card-product">
                    <div class="card-product-wrapper">
                        <a href="ProductServlet?productId=${product.id}" class="product-img">
                            <img class="lazyload img-product" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="${pageContext.request.contextPath}/storage/${product.thumbnail}" alt="product image" 
                                 style="height: 500px; object-fit: cover; width: 100%;">
                            <img class="lazyload img-hover" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="${pageContext.request.contextPath}/storage/${product.thumbnail} " alt="product image hover" 
                                 style="height: 500px; object-fit: cover; width: 100%;">
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

        <!-- Pagination -->
       <!-- Pagination -->
<ul class="tf-pagination-wrap tf-pagination-list">
    <!-- ?i?u h??ng v? trang tr??c -->
    <c:if test="${page > 1}">
        <li>
            <a href="<c:choose>
                   <c:when test='${not empty keyword}'>
                       SearchServlet?keyword=${keyword}&page=${page - 1}
                   </c:when>
                   <c:otherwise>
                       ShopServlet?page=${page - 1}
                   </c:otherwise>
               </c:choose>" 
               class="pagination-link animate-hover-btn">
                <span class="icon icon-arrow-left"></span>
            </a>
        </li>
    </c:if>

    <!-- Hi?n th? s? trang -->
    <c:forEach var="i" begin="1" end="${numberPage}">
        <c:if test="${i == page}">
            <li class="active">
                <a href="<c:choose>
                       <c:when test='${not empty keyword}'>
                           SearchServlet?keyword=${keyword}&page=${i}
                       </c:when>
                       <c:otherwise>
                           ShopServlet?page=${i}
                       </c:otherwise>
                   </c:choose>" 
                   class="pagination-link">${i}</a>
            </li>
        </c:if>
        <c:if test="${i != page}">
            <li>
                <a href="<c:choose>
                       <c:when test='${not empty keyword}'>
                           SearchServlet?keyword=${keyword}&page=${i}
                       </c:when>
                       <c:otherwise>
                           ShopServlet?page=${i}
                       </c:otherwise>
                   </c:choose>" 
                   class="pagination-link animate-hover-btn">${i}</a>
            </li>
        </c:if>
    </c:forEach>

    <!-- ?i?u h??ng ??n trang sau -->
    <c:if test="${page < numberPage}">
        <li>
            <a href="<c:choose>
                   <c:when test='${not empty keyword}'>
                       SearchServlet?keyword=${keyword}&page=${page + 1}
                   </c:when>
                   <c:otherwise>
                       ShopServlet?page=${page + 1}
                   </c:otherwise>
               </c:choose>" 
               class="pagination-link animate-hover-btn">
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
            <!-- Form l?c d? li?u -->
            <form action="<c:choose>
                             <c:when test='${not empty keyword}'>
                                 SearchServlet
                             </c:when>
                             <c:otherwise>
                                 ShopServlet
                             </c:otherwise>
                          </c:choose>" 
                  method="get" id="facet-filter-form" class="facet-filter-form">
                
                <!-- Th?m c?c tham s? t?m ki?m v? l?c -->
                <input type="hidden" name="keyword" value="${keyword}">
                
                <!-- Widget l?c Property -->
                <div class="widget-facet">
                    <div class="facet-title" data-bs-target="#property" aria-expanded="true" aria-controls="property">
                        <span>Property</span>
                    </div>
                    <div id="property" class="collapse show">
                        <select name="property" class="form-select mb_36">
                            <option value="name" ${property == 'name' ? 'selected' : ''}>Name</option>
                            <option value="price" ${property == 'price' ? 'selected' : ''}>Price</option>
                            <option value="createdAt" ${property == 'createdAt' ? 'selected' : ''}>Time</option>
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
                            <option value="asc" ${order == 'asc' ? 'selected' : ''}>A-Z</option>
                            <option value="desc" ${order == 'desc' ? 'selected' : ''}>Z-A</option>
                        </select>
                    </div>
                </div>

                <!-- N?t l?c -->
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>
        </div>
    </div>       
</div>
<!-- End Filter -->


<%@include file = "./inc/footer.jsp" %>

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
<script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
<script type="text/javascript" src="./assets/js/main.js"></script>
</body>
</html>
