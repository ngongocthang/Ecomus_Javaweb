<%@include file="inc/header.jsp" %>
<!-- breadcrumb -->
<div class="tf-breadcrumb" style="margin-top: 120px; margin-left: 60px">
    <div class="container">
        <div class="tf-breadcrumb-wrap d-flex justify-content-between flex-wrap align-items-center">
            <div class="tf-breadcrumb-list">
                <a href="HomeServlet" class="text">Home</a>
                <i class="icon icon-arrow-right"></i>
                <span class="text">Detail</span>
            </div>
        </div>
    </div>
</div>
<!-- /breadcrumb -->
<section id="prodetails" class="section-p1" >
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="single-pro-img">
                    <img src="${pageContext.request.contextPath}/storage/${product.thumbnail}" alt="" id="MainImg" width="85%" style="margin-left: 55px;">
                </div>
            </div>
            <div class="col-md-6">
                <form action="CartServlet" method="post" class="single-pro-details">
                    <div class="tf-product-info-wrap sticky-top">
                        <div class="tf-zoom-main"></div>
                        <div class="tf-product-info-list other-image-zoom">
                            <form action="CartServlet" method="post" class="single-pro-details">
                                <input type="hidden" name="action" value="create">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="price" value="${product.price}">
                                <div class="tf-product-info mt-3 d-flex justify-content-between align-items-center">
                                    <div class="tf-product-info-title" style="font-size: 20px;">
                                        <strong style="margin-right: 10px">Name:</strong> ${product.name}</br>
                                        <strong style="margin-right: 10px">Price: $</strong>  ${product.price}
                                    </div> 
                                    <div class="text-center">

                                        <c:if test="${not empty qrCodeImage}">
                                            <img src="data:image/png;base64,${qrCodeImage}" alt="QR Code" class="img-fluid rounded" style="max-width: 75px;" />
                                        </c:if>
                                    </div>
                                </div>

                                <div style="margin-top: -50px; margin-bottom: 10px;">
                                    <strong>Description:</strong>
                                    <p>${product.description}</p>
                                </div>


                                <div class="d-flex align-items-center">
                                    <div class="tf-product-info-quantity me-3">
                                        <div class="quantity-title fw-6">Quantity</div>
                                        <div class="wg-quantity d-flex align-items-center">
                                            <span class="btn-quantity minus-btn">-</span>
                                            <input type="text" name="quantity" value="1" class="form-control mx-2" style="width: 60px;">
                                            <span class="btn-quantity plus-btn">+</span>
                                        </div>
                                    </div>
                                    <div class="tf-product-info-buy-button " style="margin-top: 26px">
                                        <button href="#"
                                                class="tf-btn btn-fill justify-content-center fw-6 fs-16 animate-hover-btn">
                                            <span>Add to cart</span>
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <div class="b1" ">
                                <a href="#" class="btns-full" style="">Buy with <img
                                        src="./assets/images/payments/paypal.png" alt=""></a>
                                <a href="#" class="payment-more-option">More payment options</a>

                            </div>
                            <div class="tf-pickup-availability">
                                <div>
                                    <svg width="18" height="18" viewBox="0 0 18 18" class="mt_3">
                                    <path
                                        d="M7.6 13.2L14.65 6.15L13.25 4.75L7.6 10.4L4.75 7.55L3.35 8.95L7.6 13.2ZM0 18V0H18V18H0ZM2 16H16V2H2V16Z"
                                        fill="#428445"></path>
                                    </svg>
                                </div>
                                <div>
                                    <p>Pickup available at <span class="fw-6">Toronto - Spadina Avenue</span>
                                        Usually ready in 24 hours</p>
                                    <a href="#pickup_available" data-bs-toggle="modal" class="">
                                        Check availability at other stores
                                    </a>
                                </div>
                            </div>
                            <div class="tf-product-info-extra-link">
                                <a href="#compare_color" data-bs-toggle="modal" class="tf-product-extra-icon">
                                    <div class="icon">
                                        <img src="images/item/compare.svg" alt="">
                                    </div>
                                    <div class="text fw-6">Compare color</div>
                                </a>
                                <a href="#ask_question" data-bs-toggle="modal" class="tf-product-extra-icon">
                                    <div class="icon">
                                        <i class="icon-question"></i>
                                    </div>
                                    <div class="text fw-6">Ask a question</div>
                                </a>
                                <a href="#delivery_return" data-bs-toggle="modal" class="tf-product-extra-icon">
                                    <div class="icon">
                                        <svg class="d-inline-block" xmlns="http://www.w3.org/2000/svg"
                                             width="22" height="18" viewBox="0 0 22 18" fill="currentColor">
                                        <path
                                            d="M21.7872 10.4724C21.7872 9.73685 21.5432 9.00864 21.1002 8.4217L18.7221 5.27043C18.2421 4.63481 17.4804 4.25532 16.684 4.25532H14.9787V2.54885C14.9787 1.14111 13.8334 0 12.4255 0H9.95745V1.69779H12.4255C12.8948 1.69779 13.2766 2.07962 13.2766 2.54885V14.5957H8.15145C7.80021 13.6052 6.85421 12.8936 5.74468 12.8936C4.63515 12.8936 3.68915 13.6052 3.33792 14.5957H2.55319C2.08396 14.5957 1.70213 14.2139 1.70213 13.7447V2.54885C1.70213 2.07962 2.08396 1.69779 2.55319 1.69779H9.95745V0H2.55319C1.14528 0 0 1.14111 0 2.54885V13.7447C0 15.1526 1.14528 16.2979 2.55319 16.2979H3.33792C3.68915 17.2884 4.63515 18 5.74468 18C6.85421 18 7.80021 17.2884 8.15145 16.2979H13.423C13.7742 17.2884 14.7202 18 15.8297 18C16.9393 18 17.8853 17.2884 18.2365 16.2979H21.7872V10.4724ZM16.684 5.95745C16.9494 5.95745 17.2034 6.08396 17.3634 6.29574L19.5166 9.14894H14.9787V5.95745H16.684ZM5.74468 16.2979C5.27545 16.2979 4.89362 15.916 4.89362 15.4468C4.89362 14.9776 5.27545 14.5957 5.74468 14.5957C6.21392 14.5957 6.59575 14.9776 6.59575 15.4468C6.59575 15.916 6.21392 16.2979 5.74468 16.2979ZM15.8298 16.2979C15.3606 16.2979 14.9787 15.916 14.9787 15.4468C14.9787 14.9776 15.3606 14.5957 15.8298 14.5957C16.299 14.5957 16.6809 14.9776 16.6809 15.4468C16.6809 15.916 16.299 16.2979 15.8298 16.2979ZM18.2366 14.5957C17.8853 13.6052 16.9393 12.8936 15.8298 12.8936C15.5398 12.8935 15.252 12.943 14.9787 13.04V10.8511H20.0851V14.5957H18.2366Z">
                                        </path>
                                        </svg>
                                    </div>
                                    <div class="text fw-6">Delivery & Return</div>
                                </a>
                                <a href="#share_social" data-bs-toggle="modal" class="tf-product-extra-icon">
                                    <div class="icon">
                                        <i class="icon-share"></i>
                                    </div>
                                    <div class="text fw-6">Share</div>
                                </a>
                            </div>
                            <div class="tf-product-info-delivery-return">
                                <div class="row">
                                    <div class="col-xl-6 col-12">
                                        <div class="tf-product-delivery">
                                            <div class="icon">
                                                <i class="icon-delivery-time"></i>
                                            </div>
                                            <p>Estimate delivery times: <span class="fw-7">12-26 days</span>
                                                (International), <span class="fw-7">3-6 days</span> (United
                                                States).</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-12">
                                        <div class="tf-product-delivery mb-0">
                                            <div class="icon">
                                                <i class="icon-return-order"></i>
                                            </div>
                                            <p>Return within <span class="fw-7">30 days</span> of purchase.
                                                Duties & taxes are non-refundable.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tf-product-info-trust-seal mt-4">
                                    <div class="tf-product-trust-mess">
                                        <i class="icon-safe"></i>
                                        <p class="fw-6">Guarantee Safe <br> Checkout</p>
                                    </div>
                                    <div class="tf-payment">
                                        <img src="./assets/images/payments/visa.png" alt="">
                                        <img src="./assets/images/payments/img-1.png" alt="">
                                        <img src="./assets/images/payments/img-2.png" alt="">
                                        <img src="./assets/images/payments/img-3.png" alt="">
                                        <img src="./assets/images/payments/img-4.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- tabs -->
<section class="flat-spacing-17 pt_0 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="widget-tabs style-has-border">
                    <ul class="widget-menu-tab">
                        <li class="item-title active">
                            <span class="inner">Shipping</span>
                        </li>

                    </ul>
                    <div class="widget-content-tab">
                        <div class="widget-content-inner active">
                            <div class="tf-page-privacy-policy">
                                <div class="title">The Company Private Limited Policy</div>
                                <p>The Company Private Limited and each of their respective subsidiary, parent and affiliated companies is deemed to operate this Website (?we? or ?us?) recognizes that you care how information about you is used and shared. We have created this Privacy Policy to inform you what information we collect on the Website, how we use your information and the choices you have about the way your information is collected and used. Please read this Privacy Policy carefully. Your use of the Website indicates that you have read and accepted our privacy practices, as outlined in this Privacy Policy.</p>
                                <p>We are not responsible for the content or privacy practices on any websites.</p>
                                <p>We reserve the right, in our sole discretion, to modify, update, add to, discontinue, remove or otherwise change any portion of this Privacy Policy, in whole or in part, at any time. When we amend this Privacy Policy, we will revise the ?last updated? date located at the top of this Privacy Policy.</p>
                                <p>If you have any questions regarding this Privacy Policy, you should contact our Customer Service Department by email at marketing@company.com</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /tabs -->
<!-- product -->
<section class="flat-spacing-1 pt_0">
    <div class="container">
        <div class="flat-title">
            <span class="title">Related Product</span>
            <p>Embrace the New Trend: Exclusive Products Available Only at Our Store!</p>
        </div>
        <div class="hover-sw-nav hover-sw-2">
            <div class="swiper tf-sw-product-sell wrap-sw-over" data-preview="4" data-tablet="3" data-mobile="2"
                 data-space-lg="30" data-space-md="15" data-pagination="2" data-pagination-md="3"
                 data-pagination-lg="3">
                <div class="swiper-wrapper">
                    <c:forEach items="${findProductByCategory}" var="product">
                        <div class="swiper-slide" lazy="true">
                            <div class="card-product style-5">
                                <div class="card-product-wrapper">
                                    <a href="ProductServlet?productId=${product.id}" class="product-img">
                                        <img class="lazyload img-product" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="./assets/images/products/orange-1.jpg" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
                                        <img class="lazyload img-hover" data-src="${pageContext.request.contextPath}/storage/${product.thumbnail}" src="./assets/images/products/white-1.jpg" alt="image-product" style="height: 500px; object-fit: cover; width: 100%;">
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
                                </div>
                            </div>
                        </div>
                    </c:forEach>  
                </div>
            </div>
            <div class="nav-sw nav-next-slider nav-next-product box-icon w_46 round"><span
                    class="icon icon-arrow-left"></span></div>
            <div class="nav-sw nav-prev-slider nav-prev-product box-icon w_46 round"><span
                    class="icon icon-arrow-right"></span></div>
            <div class="sw-dots style-2 sw-pagination-product justify-content-center"></div>
        </div>
    </div>
</section>
<!-- /product -->

<%@include file="inc/footer.jsp" %>
<!-- Javascript -->
<script type="text/javascript" src="./assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery.min.js"></script>
<script type="text/javascript" src="./assets/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="./assets/js/carousel.js"></script>
<script type="text/javascript" src="./assets/js/count-down.js"></script>
<script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="./assets/js/lazysize.min.js"></script>
<script type="text/javascript" src="./assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="./assets/js/drift.min.js"></script>
<script type="text/javascript" src="./assets/js/wow.min.js"></script>
<script type="text/javascript" src="./assets/js/multiple-modal.js"></script>
<script type="text/javascript" src="./assets/js/main.js"></script>

<script type="module" src="js/model-viewer.min.js"></script>
<script type="module" src="js/zoom.js"></script>
</body>

</html>