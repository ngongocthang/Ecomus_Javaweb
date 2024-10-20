<%@include file = "./inc/header.jsp" %>
<!-- Slider -->
<section class="tf-slideshow slider-effect-fade slider-home-5 position-relative">
    <div class="swiper tf-sw-slideshow" data-preview="1" data-tablet="1" data-mobile="1" data-centered="false" data-space="0" data-loop="true" data-auto-play="true" data-delay="2000" data-speed="1000">
        <div class="swiper-wrapper">
            <div class="swiper-slide" lazy="true">
                <div class="wrap-slider">
                    <img class="lazyload" data-src="./assets/images/slider/fashion-slideshow-10.jpg" src="./assets/images/slider/fashion-slideshow-10.jpg" alt="fashion-slideshow-01">
                    <div class="box-content text-center">
                        <div class="container">
                            <h1 class="fade-item fade-item-1 text-white heading">Effortless Elegance</h1>
                            <p class="fade-item fade-item-2 text-white">From casual to formal, we've got you covered</p>
                            <a href="ShopServlet" class="fade-item fade-item-3 tf-btn btn-light-icon animate-hover-btn btn-xl radius-3"><span>Shop collection</span><i class="icon icon-arrow-right"></i></a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="swiper-slide" lazy="true">
                <div class="wrap-slider">
                    <img class="lazyload" data-src="./assets/images/slider/fashion-slideshow-11.jpg" src="./assets/images/slider/fashion-slideshow-11.jpg" alt="fashion-slideshow-01">
                    <div class="box-content text-center">
                        <div class="container">
                            <h1 class="fade-item fade-item-1 text-white heading">The mystery behind</h1>
                            <p class="fade-item fade-item-2 text-white">From casual to formal, we've got you covered</p>
                            <a href="shop-collection-list.html" class="fade-item fade-item-3 tf-btn btn-light-icon animate-hover-btn btn-xl radius-3"><span>Shop collection</span><i class="icon icon-arrow-right"></i></a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="swiper-slide" lazy="true">
                <div class="wrap-slider">
                    <img class="lazyload" data-src="./assets/images/slider/fashion-slideshow-12.jpg" src="./assets/images/slider/fashion-slideshow-12.jpg" alt="fashion-slideshow-01">
                    <div class="box-content text-center">
                        <div class="container">
                            <h1 class="fade-item fade-item-1 text-white">Multi-faceted Beauty</h1>
                            <p class="fade-item fade-item-2 text-white">From casual to formal, we've got you covered</p>
                            <a href="shop-collection-list.html" class="fade-item fade-item-3 tf-btn btn-light-icon animate-hover-btn btn-xl radius-3"><span>Shop collection</span><i class="icon icon-arrow-right"></i></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap-pagination">
        <div class="sw-dots style-2 dots-white sw-pagination-slider justify-content-center"></div>
    </div>
</section>
<!-- /Slider -->
<!-- Collection -->
<section class="flat-spacing-15">
    <div class="container-full">
        <div class="flat-title flex-row justify-content-between px-0">
            <span class="title wow fadeInUp" data-wow-delay="0s">Categories Collections</span>
            <div class="box-sw-navigation">
                <div class="nav-sw nav-next-slider nav-next-collection"><span class="icon icon-arrow-left"></span></div>
                <div class="nav-sw nav-prev-slider nav-prev-collection"><span class="icon icon-arrow-right"></span></div>
            </div>  
        </div>
        <div class="swiper tf-sw-collection sw-wrapper-right" data-preview="4.5" data-tablet="2.4" data-mobile="2.4" data-space-lg="30" data-space-md="30" data-space="15" data-loop="false" data-auto-play="false">
            <div class="swiper-wrapper">
                <c:forEach items="${categoryList}" var="category">
                    <div class="swiper-slide">  
                        <div class="collection-item-v3 hover-img">
                            <a href="CategoryServlet?categoryId=${category.id}" class="collection-image img-style">
                                <img class="lazyload" data-src="${pageContext.request.contextPath}/storage/${category.thumbnail}" src="${pageContext.request.contextPath}/storage/${category.thumbnail}" alt="collection-img" style="height: 300px; object-fit: cover; width: 100%;">
                                <span class="box-icon">
                                    <i class="icon-icon icon-arrow1-top-left"></i>
                                </span>
                            </a>

                            <div class="collection-content d-block text-center">
                                <a href="CategoryServlet?categoryId=${category.id}" class="link title fw-5">${category.name}</a>
                            </div>
                        </div> 
                    </div>
                </c:forEach>
            </div>

        </div>
    </div>
</section>
<!-- /Collection -->

<!-- Shop Gram -->
<section class="flat-spacing-7">
    <div class="container">
        <div class="flat-title wow fadeInUp" data-wow-delay="0s">
            <span class="title">Hot Products</span>
            <p class="sub-title">Inspire and let yourself be inspired, from one unique fashion to another.</p>
        </div>
        <div class="wrap-carousel wrap-shop-gram">
            <div class="swiper tf-sw-shop-gallery" data-preview="5" data-tablet="3" data-mobile="2" data-space-lg="7" data-space-md="7">
                <div class="swiper tf-sw-product-sell wrap-sw-over" data-preview="4" data-tablet="3" data-mobile="2" data-space-lg="30" data-space-md="15" data-pagination="2" data-pagination-md="3" data-pagination-lg="3">
                    <div class="swiper-wrapper">
                        <c:forEach items="${hotProductList}" var="product">
                            <div class="swiper-slide" lazy="true">
                                <div class="card-product style-5">
                                    <div class="card-product-wrapper">
                                        <a href="ProductServlet?productId=${product.id}" class="product-img">
                                            <img class="lazyload img-product" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                            <img class="lazyload img-hover" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                        </a>

                                        <div class="list-product-btn gap-0">
                                            <a href="ProductServlet?productId=${product.id}" data-bs-toggle="modal" class="box-icon bg_white quickview tf-btn-loading shadow-none">
                                                <span class="icon icon-view"></span>
                                                <span class="tooltip">Quick View</span>
                                            </a>
                                        </div>
                                        <div class="size-list style-3">
                                            <span>S</span>
                                            <span>M</span>
                                            <span>L</span>
                                            <span>XL</span>
                                        </div>
                                    </div>
                                    <div class="card-product-info">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <a href="ProductServlet?productId=${product.id}" class="title link ms-3">${product.name}</a> <!-- Added margin-end (me-3) -->
                                            <span class="price me-3">Price: $${product.price}</span>
                                        </div>
                                        <div class="d-block text-center">
                                            <span class="text-truncate d-inline-block" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                ${product.description}
                                            </span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="sw-dots sw-pagination-gallery justify-content-center"></div>
        </div>
    </div>
</section>
<!-- /Shop Gram -->

<!-- Banner Countdown -->
<section class="tf-hero-image-liquid">
    <img class="lazyload" data-src="./assets/images/slider/banner-countdown.png" src="./assets/images/slider/banner-countdown.png" alt="img-banner" loading="lazy">
    <div class="box-content">
        <div class="container wow fadeInUp" data-wow-delay="0s">
            <h2 class="heading">Last Chance Offers</h2>
            <p>Get Them Before They're Gone</p>
            <div class="tf-countdown"> <!-- style-rectangle -->
                <div class="js-countdown" data-timer="1007500" data-labels="Days,Hours,Mins,Secs"></div>
            </div>
            <a href="shop-default.html" class="tf-btn btn-fill btn-md animate-hover-btn radius-3">Shop now - $129</a>
        </div>
    </div>
</section>
<!-- /Banner Countdown -->
<!-- Look book -->
<section class="flat-spacing-16">
    <div class="container">
        <div class="flat-lookbook-v2">
            <div class="col-left">
                <div class="wrap-lookbook lookbook-sw radius-10 o-hidden">
                    <div class="image">
                        <img class="lazyload" data-src="./assets/images/shop/file/lookbook-5.jpg" src="./assets/images/shop/file/lookbook-5.jpg" alt="collection-img">
                    </div>
                </div>
            </div>
            <div class="col-right">
                <div class="slider-wrap-lookbook">
                    <div class="nav-sw nav-next-slider nav-next-lookbook"><span class="icon icon-arrow-left"></span></div>
                    <div class="inner-sw-lookbook">
                        <div class="flat-title-lookbook">
                            <p class="label">SPRING SALE 30% OFF</p>
                            <h3 class="heading">New Products</h3>
                        </div>
                        <div class="swiper tf-sw-lookbook wrap-sw-over" data-preview="1" data-tablet="1" data-mobile="1" data-space-lg="30" data-space-md="15">

                            <div class="swiper-wrapper">
                                <c:forEach items="${newProductList}" var="product">
                                    <div class="swiper-slide" lazy="true">
                                        <div class="card-product style-5">
                                            <div class="card-product-wrapper">
                                                <a href="ProductServlet?productId=${product.id}" class="product-img">
                                                    <img class="lazyload img-product" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                                    <img class="lazyload img-hover" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                                </a>
                                                <div class="list-product-btn gap-0">
                                                    <a href="ProductServlet?productId=${product.id}" data-bs-toggle="modal" class="box-icon bg_white quickview tf-btn-loading shadow-none">
                                                        <span class="icon icon-view"></span>
                                                        <span class="tooltip">Quick View</span>
                                                    </a>
                                                </div>
                                                <div class="size-list style-3">
                                                    <span>S</span>
                                                    <span>M</span>
                                                    <span>L</span>
                                                    <span>XL</span>
                                                </div>
                                            </div>
                                            <div class="card-product-info">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <a href="ProductServlet?productId=${product.id}" class="title link ms-3">${product.name}</a> <!-- Added margin-end (me-3) -->
                                                    <span class="price me-3">Price: $${product.price}</span>
                                                </div>
                                                <div class="d-block text-center">
                                                    <span class="text-truncate d-inline-block" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                        ${product.description}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="sw-dots style-2 sw-pagination-lookbook d-md-none"></div> 
                        </div>
                    </div>
                    <div class="nav-sw nav-prev-slider nav-prev-lookbook"><span class="icon icon-arrow-right"></span></div>
                </div>  
            </div>
        </div>
    </div>
</section>
<!-- /Look book -->
<!-- Icon box -->
<section class="flat-spacing-9 flat-iconbox-v2">
    <div class="container">
        <div class="wrap-carousel wrap-mobile wow fadeInUp" data-wow-delay="0s">
            <div class="swiper tf-sw-mobile" data-preview="1" data-space="15">
                <div class="swiper-wrapper wrap-iconbox">
                    <div class="swiper-slide">
                        <div class="tf-icon-box text-center">
                            <div class="icon">
                                <i class="icon-shipping-1"></i>
                            </div>
                            <div class="content">
                                <div class="title">Free Shipping</div>
                                <p>Free shipping over order $120</p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="tf-icon-box text-center">
                            <div class="icon">
                                <i class="icon-payment-1"></i>
                            </div>
                            <div class="content">
                                <div class="title">Flexible Payment</div>
                                <p>Pay with Multiple Credit Cards</p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="tf-icon-box text-center">
                            <div class="icon">
                                <i class="icon-return-1"></i>
                            </div>
                            <div class="content">
                                <div class="title">14 Day Returns</div>
                                <p>Within 30 days for an exchange</p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <div class="sw-dots style-2 sw-pagination-mb justify-content-center"></div>
        </div>
    </div>
</section>
<!-- /Icon box -->

<!-- Product -->
<section class="flat-spacing-6 pt_0">
    <div class="container">
        <div class="flat-title wow fadeInUp" data-wow-delay="0s">
            <span class="title">Products</span>
            <div class="d-flex gap-16 align-items-center">
                <div class="nav-sw-arrow nav-next-slider nav-next-product"><span class="icon icon-arrow1-left"></span></div>
                <a href="product-style-05.html" class="tf-btn btn-line fs-12 fw-6">VIEW ALL</a>
                <div class="nav-sw-arrow nav-prev-slider nav-prev-product"><span class="icon icon-arrow1-right"></span></div>
            </div>   
        </div>
        <div class="hover-sw-nav hover-sw-2">
            <div class="swiper tf-sw-product-sell wrap-sw-over" data-preview="4" data-tablet="3" data-mobile="2" data-space-lg="30" data-space-md="15" data-pagination="2" data-pagination-md="3" data-pagination-lg="3">
                <div class="swiper-wrapper">
                    <c:forEach items="${productList}" var="product">
                        <div class="swiper-slide" lazy="true">
                            <div class="card-product style-5">
                                <div class="card-product-wrapper">
                                    <a href="ProductServlet?productId=${product.id}" class="product-img">
                                        <img class="lazyload img-product" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                        <img class="lazyload img-hover" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                    </a>
                                    <div class="list-product-btn gap-0">
                                        <a href="ProductServlet?productId=${product.id}" data-bs-toggle="modal" class="box-icon bg_white quickview tf-btn-loading shadow-none">
                                            <span class="icon icon-view"></span>
                                            <span class="tooltip">Quick View</span>
                                        </a>
                                    </div>
                                    <div class="size-list style-3">
                                        <span>S</span>
                                        <span>M</span>
                                        <span>L</span>
                                        <span>XL</span>
                                    </div>
                                </div>
                                <div class="card-product-info">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="ProductServlet?productId=${product.id}" class="title link ms-3">${product.name}</a> <!-- Added margin-end (me-3) -->
                                        <span class="price me-3">Price: $${product.price}</span>
                                    </div>
                                    <div class="d-block text-center">
                                        <span class="text-truncate d-inline-block" style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                            ${product.description}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="nav-sw nav-next-slider nav-next-product box-icon w_46 round"><span class="icon icon-arrow-left"></span></div>
            <div class="nav-sw nav-prev-slider nav-prev-product box-icon w_46 round"><span class="icon icon-arrow-right"></span></div>
        </div>
    </div>
</section>
<!-- /Product -->

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
<script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="./assets/js/count-down.js"></script>
<script type="text/javascript" src="./assets/js/wow.min.js"></script>
<script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
<script type="text/javascript" src="./assets/js/main.js"></script>
</body>


</html>