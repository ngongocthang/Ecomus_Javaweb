<div id="wrapper">
    <%@include file = "./inc/header.jsp" %>

    <!-- page-title -->
    <div class="tf-page-title style-2" style="margin-top: 90px;">
        <div class="container-full">
            <div class="heading text-center">#Log in</div>
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
            <div class="tf-grid-layout lg-col-2 tf-login-wrap">
                <div class="tf-login-form">
                    <div id="login">
                        <h5 class="mb_36">Log in</h5>
                        <div>
                            <form class="" id="login-form" action="LoginServlet" method="post" accept-charset="utf-8">
                                <div class="tf-field style-1 mb_15">
                                    <input class="tf-field-input tf-input" placeholder="" type="email" id="property3" name="email">
                                        <label class="tf-field-label fw-4 text_black-2" for="property3">Email *</label>
                                </div>
                                <div class="tf-field style-1 mb_30">
                                    <input class="tf-field-input tf-input" placeholder="" type="password" id="property4" name="password">
                                        <label class="tf-field-label fw-4 text_black-2" for="property4">Password *</label>
                                </div>
                                <div class="tf-field style-1 mb_30">

<!--                                    <div class="text-center">
                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid &redirect_uri=http://localhost:8080/Shop/login&response_type=code&client_id=800456180237-bflf1d7cqn8e4latcedb0s3mdlar3ccc.apps.googleusercontent.com&approval_prompt=force" id="google-button">                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                                    <path d="M15.545 6.558a9.4 9.4 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.7 7.7 0 0 1 5.352 2.082l-2.284 2.284A4.35 4.35 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.8 4.8 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.7 3.7 0 0 0 1.599-2.431H8v-3.08z"/>
                                                </svg>
                                            </a>
                                        </button>

                                        <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-link btn-floating mx-1">
                                            <a href="https://www.facebook.com/v19.0/dialog/oauth?client_id=417133904526343&redirect_uri=http://localhost:8080/Shop/Oauth2FacebookServlet" id="facebook-button">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
                                                </svg>
                                            </a>
                                        </button>
                                    </div>-->




                                    <div class="d-flex gap-3 w-100">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid &redirect_uri=http://localhost:8080/Shop/login&response_type=code&client_id=800456180237-bflf1d7cqn8e4latcedb0s3mdlar3ccc.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-danger d-flex align-items-center justify-content-center w-50">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                            </svg>
                                            <span class="ms-2 fs-6">Sign in with Google</span>
                                        </a>
                                        <a href="https://www.facebook.com/v19.0/dialog/oauth?client_id=417133904526343&redirect_uri=http://localhost:8080/Shop/Oauth2FacebookServlet" class="btn btn-lg btn-primary d-flex align-items-center justify-content-center w-50">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                                <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                            </svg>
                                            <span class="ms-2 fs-6">Sign in with Facebook</span>
                                        </a>
                                    </div>






                                </div>
                                <div class="mb_20">
                                    <a href="" class="tf-btn btn-line">Forgot your password?</a>
                                </div>
                                <div class="">
                                    <button type="submit" class="tf-btn w-100 radius-3 btn-fill animate-hover-btn justify-content-center">Log in</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tf-login-content">
                    <h5 class="mb_36">I'm new here</h5>
                    <p class="mb_20">Sign up for early Sale access plus tailored new arrivals, trends and promotions. To opt out, click unsubscribe in our emails.</p>
                    <a href="RegisterServlet" class="tf-btn btn-line">Register<i class="icon icon-arrow1-top-left"></i></a>
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
<script type="text/javascript" src="js/multiple-modal.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>


<!-- Mirrored from themesflat.co/html/ecomus/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Sep 2024 12:28:04 GMT -->
</html>