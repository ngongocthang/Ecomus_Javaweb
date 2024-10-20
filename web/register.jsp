<%@include file = "./inc/header.jsp" %>
<div id="wrapper">
    <!-- page-title -->
    <div class="tf-page-title style-2" style="margin-top: 90px;">
        <div class="container-full">
            <div class="heading text-center">#Register</div>
        </div>
    </div>
    <!-- /page-title -->

    <c:if test="${error != null}">
        <div class="alert alert-danger" role="alert">
            ${error}
        </div>
        <c:remove var="error" scope="session"/>
    </c:if>

    <section class="flat-spacing-10">
        <div class="container">
            <div class="form-register-wrap">
                <div class="flat-title align-items-start gap-0 mb_30 px-0">
                    <h5 class="mb_18">Register</h5>
                    <p class="text_black-2">Sign up for early Sale access plus tailored new arrivals, trends and promotions. To opt out, click unsubscribe in our emails</p>
                </div>
                <div>
                    <form class="" id="register-form" action="RegisterServlet" method="post" accept-charset="utf-8" data-mailchimp="true">
                        <div class="tf-field style-1 mb_15">
                            <input class="tf-field-input tf-input" placeholder=" " type="email" id="property3" name="email">
                                <label class="tf-field-label fw-4 text_black-2" for="property3">Email *</label>
                        </div>
                        <div class="tf-field style-1 mb_30">
                            <input class="tf-field-input tf-input" placeholder=" " type="password" id="property4" name="password">
                                <label class="tf-field-label fw-4 text_black-2" for="property4">Password *</label>
                        </div>
                        <div class="mb_20">
                            <button type="submit" class="tf-btn w-100 radius-3 btn-fill animate-hover-btn justify-content-center">Register</button>
                        </div>
                        <div class="text-center">
                            <a href="LoginServlet" class="tf-btn btn-line">Already have an account? Log in here<i class="icon icon-arrow1-top-left"></i></a>
                        </div>
                    </form>
                   
                </div>
            </div>
        </div>
    </section>

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

<script type="text/javascript" src="js/wow.min.js"></script>
<script type="text/javascript" src="js/multiple-modal.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>


<!-- Mirrored from themesflat.co/html/ecomus/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:32:41 GMT -->
</html>