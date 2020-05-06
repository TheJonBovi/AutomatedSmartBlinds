﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ASBWeb.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js" lang="zxx">
<head runat="server">
    <title><%: Page.Title %> - Automated Smart Blinds</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css"/>
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css"/>
    <link rel="stylesheet" href="assets/css/themify-icons.css"/>
    <link rel="stylesheet" href="assets/css/slick.css"/>
    <link rel="stylesheet" href="assets/css/nice-select.css"/>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <link rel="stylesheet" href="assets/css/responsive.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Preloader Start -->
            <div id="preloader-active">
                <div class="preloader d-flex align-items-center justify-content-center">
                    <div class="preloader-inner position-relative">
                        <div class="preloader-circle"></div>
                        <div class="preloader-img pere-text">
                            <%--<img src="assets/img/logo/loder-logo.png" alt="" />--%>
                            <img src="assets/img/logo/Orange_logo_transparent_bkgrd - 500x500.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- Preloader Start -->
            <header>
                <!-- Header Start -->
                <div class="header-area header-transparent">
                    <div class="main-header ">
                        <div class="header-top d-none d-lg-block">
                            <div class="container-fluid">
                                <div class="col-xl-12">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="header-info-left">
                                           
                                        </div>
                                        <div class="header-info-right">
                                            <ul class="header-social">
                                                <li style="color:white">Michael Roberts</li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                <li></li>
                                                <li></li>
                                                <li><img src="assets/img/banner/small_orange_dot.png"</li>
                                                <li></li>
                                                <li></li>
                                                <li style="color:white">Chad</li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                                                <li></li>
                                                <li></li>
                                                <li><img src="assets/img/banner/small_orange_dot.png"</li>
                                                <li></li>
                                                <li></li>
                                                <li style="color:white">Drew</li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                                <li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="header-bottom  header-sticky">
                            <div class="container-fluid">
                                <div class="row align-items-center">
                                    <!-- Logo -->
                                    <div class="col-xl-2 col-lg-2 col-md-1">
                                        <div class="logo">
                                            <!-- logo-1 -->
                                            <a href="index.html" class="big-logo">
                                                <img src="assets/img/logo/AS_logo.png" alt=""></a>
                                            <!-- logo-2 -->
                                            <a href="index.html" class="small-logo">
                                                <img src="assets/img/logo/loder-logo.png" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8 col-md-8">
                                        <!-- Main-menu -->
                                        <div class="main-menu f-right d-none d-lg-block">
                                            <nav>
                                                <ul id="navigation">
                                                    <li><a href="Default.aspx">Home</a></li>
                                                    <li><a href="Settings.aspx">Settings</a></li>
                                                    <li><a href="Logs.aspx">Logs</a></li>
                                                    <li><a href="about.aspx">About</a></li>
                                                    <li><a href="contact.aspx">Contact</a></li>
                                                   
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>

                                    <!-- Mobile Menu -->
                                    <div class="col-12">
                                        <div class="mobile_menu d-block d-lg-none"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header End -->
            </header>
            <main>
                <!-- slider Area Start-->
                <div class="slider-area ">
                    <%--<div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">--%>
                    <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/gallery/project5.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap pt-100">
                                        <h2>About us</h2>
                                        <nav aria-label="breadcrumb ">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Product</a></li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- slider Area End-->
                <!-- About Area Start -->
                <section class="support-company-area fix pt-10 section-padding30">
                    <div class="support-wrapper align-items-end">
                        <div class="left-content">
                           <%-- <!-- section tittle -->
                            <div class="section-tittle section-tittle2 mb-55">
                                <div class="front-text">
                                    <h2 class="">Who we are</h2>
                                </div>
                                <span class="back-text">About us</span>
                            </div>
                            <div class="support-caption">
                                <p class="pera-top">Mollit anim laborum duis au dolor in voluptcate velit ess cillum dolore eu lore dsu quality mollit anim laborumuis au dolor in voluptate velit cillu.</p>
                                <p>Mollit anim laborum.Dvcuis aute iruxvfg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur sfwsignjnt occa cupidatat non aute iruxvfg dhjinulpadeserunt mollitemnth incididbnt ut;o5tu layjobore mofllit anim.</p>
                                <a href="about.html" class="btn red-btn2">read more</a>
                            </div>
                        </div>
                        <div class="right-content">
                            <!-- img -->
                            <div class="right-img">
                                <img src="assets/img/gallery/safe_in.png" alt="">
                            </div>
                            <div class="support-img-cap text-center">
                                <span>1994</span>
                                <p>Since</p>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- About Area End -->
                <!-- Testimonial Start -->
                <div class="testimonial-area t-bg testimonial-padding">
                    <div class="container ">
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- Section Tittle -->
                                <div class="section-tittle section-tittle6 mb-50">
                                    <div class="front-text">
                                        <h2 class="">Testimonial</h2>
                                    </div>
                                    <span class="back-text">Feedback</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-10 col-lg-11 col-md-10 offset-xl-1">
                                <div class="h1-testimonial-active">
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <!-- Testimonial Content -->
                                        <div class="testimonial-caption ">
                                            <div class="testimonial-top-cap">
                                                <!-- SVG icon -->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="86px" height="63px">
                                                    <path fill-rule="evenodd" stroke-width="1px" stroke="rgb(255, 95, 19)" fill-opacity="0" fill="rgb(0, 0, 0)"
                                                        d="M82.623,59.861 L48.661,59.861 L48.661,25.988 L59.982,3.406 L76.963,3.406 L65.642,25.988 L82.623,25.988 L82.623,59.861 ZM3.377,25.988 L14.698,3.406 L31.679,3.406 L20.358,25.988 L37.340,25.988 L37.340,59.861 L3.377,59.861 L3.377,25.988 Z" />
                                                </svg>
                                                <p>Mollit anim laborum.Dvcuis aute iruxvfg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur sfwsignjnt occa cupidatat non aute iruxvfg dhjinulpadeserunt mollitemnth incididbnt ut;o5tu layjobore mofllit anim. Mollit anim laborum.Dvcuis aute iruxvfg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur sfwsignjn.</p>
                                            </div>
                                            <!-- founder -->
                                            <div class="testimonial-founder d-flex align-items-center">
                                                <div class="founder-text">
                                                    <span>Jessya Inn</span>
                                                    <p>Co Founder</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <!-- Testimonial Content -->
                                        <div class="testimonial-caption ">
                                            <div class="testimonial-top-cap">
                                                <!-- SVG icon -->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="86px" height="63px">
                                                    <path fill-rule="evenodd" stroke-width="1px" stroke="rgb(255, 95, 19)" fill-opacity="0" fill="rgb(0, 0, 0)"
                                                        d="M82.623,59.861 L48.661,59.861 L48.661,25.988 L59.982,3.406 L76.963,3.406 L65.642,25.988 L82.623,25.988 L82.623,59.861 ZM3.377,25.988 L14.698,3.406 L31.679,3.406 L20.358,25.988 L37.340,25.988 L37.340,59.861 L3.377,59.861 L3.377,25.988 Z" />
                                                </svg>
                                                <p>Mollit anim laborum.Dvcuis aute iruxvfg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur sfwsignjnt occa cupidatat non aute iruxvfg dhjinulpadeserunt mollitemnth incididbnt ut;o5tu layjobore mofllit anim. Mollit anim laborum.Dvcuis aute iruxvfg dhjkolohr in re voluptate velit esscillumlore eu quife nrulla parihatur. Excghcepteur sfwsignjn.</p>
                                            </div>
                                            <!-- founder -->
                                            <div class="testimonial-founder d-flex align-items-center">
                                                <div class="founder-text">
                                                    <span>Jessya Inn</span>
                                                    <p>Co Founder</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Testimonial End -->--%>
                <!-- Team Start -->
                <div class="team-area section-padding30">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- Section Tittle -->
                                <div class="section-tittle section-tittle5 mb-50">
                                    <div class="front-text">
                                        <h2 class="">Our team</h2>
                                    </div>
                                    <span class="back-text">exparts</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- single Tem -->
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-">
                                <div class="single-team mb-30">
                                    <div class="team-img">
                                        <img src="assets/img/team/team1.png" alt="">
                                    </div>
                                    <div class="team-caption">
                                        <span>UX Designer</span>
                                        <h3>Ethan Welch</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-">
                                <div class="single-team mb-30">
                                    <div class="team-img">
                                        <img src="assets/img/team/team2.png" alt="">
                                    </div>
                                    <div class="team-caption">
                                        <span>UX Designer</span>
                                        <h3>Ethan Welch</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-">
                                <div class="single-team mb-30">
                                    <div class="team-img">
                                        <img src="assets/img/team/team3.png" alt="">
                                    </div>
                                    <div class="team-caption">
                                        <span>UX Designer</span>
                                        <h3>Ethan Welch</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Team End -->
            </main>
            <footer>
                <!-- Footer Start-->
                <div class="footer-main">
                    <div class="footer-area footer-padding">
                        <div class="container">
                            <div class="row  justify-content-between">
                                <div class="col-lg-4 col-md-4 col-sm-8">
                                    <div class="single-footer-caption mb-30">
                                        <!-- logo -->
                                        <div class="footer-logo">
                                            <a href="index.html">
                                                <img src="assets/img/logo/logo2_footer.png" alt=""></a>
                                        </div>
                                        <div class="footer-tittle">
                                            <div class="footer-pera">
                                                <p class="info1">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-4 col-sm-5">
                                    <div class="single-footer-caption mb-50">
                                        <div class="footer-tittle">
                                            <h4>Quick Links</h4>
                                            <ul>
                                                <li><a href="#">About</a></li>
                                                <li><a href="#">Services</a></li>
                                                <li><a href="#">Projects</a></li>
                                                <li><a href="#">Contact Us</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-7">
                                    <div class="single-footer-caption mb-50">
                                        <div class="footer-tittle">
                                            <h4>Contact</h4>
                                            <div class="footer-pera">
                                                <p class="info1">
                                                    198 West 21th Street,
                                            Suite 721 New York,NY 10010
                                                </p>
                                            </div>
                                            <ul>
                                                <li><a href="#">Phone: +95 (0) 123 456 789</a></li>
                                                <li><a href="#">Cell: +95 (0) 123 456 789</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-8">
                                    <div class="single-footer-caption mb-50">
                                        <!-- Form -->
                                        <div class="footer-form">
                                            <div id="mc_embed_signup">
                                                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative mail_part" novalidate="true">
                                                    <input type="email" name="EMAIL" id="newsletter-form-email" placeholder=" Email Address " class="placeholder hide-on-focus" onfocus="this.placeholder = ''" onblur="this.placeholder = ' Email Address '">
                                                    <div class="form-icon">
                                                        <button type="submit" name="submit" id="newsletter-submit" class="email_icon newsletter-submit button-contactForm">
                                                            SIGN UP
                                               
                                                        </button>
                                                    </div>
                                                    <div class="mt-10 info"></div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- Map -->
                                        <div class="map-footer">
                                            <img src="assets/img/gallery/map-footer.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Copy-Right -->
                            <div class="row align-items-center">
                                <div class="col-xl-12 ">
                                    <div class="footer-copy-right">
                                        <p>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                            All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer End-->
            </footer>

            <!-- JS here -->

            <!-- All JS Custom Plugins Link Here here -->
            <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
            <!-- Jquery, Popper, Bootstrap -->
            <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
            <script src="./assets/js/popper.min.js"></script>
            <script src="./assets/js/bootstrap.min.js"></script>
            <!-- Jquery Mobile Menu -->
            <script src="./assets/js/jquery.slicknav.min.js"></script>

            <!-- Jquery Slick , Owl-Carousel Plugins -->
            <script src="./assets/js/owl.carousel.min.js"></script>
            <script src="./assets/js/slick.min.js"></script>
            <!-- Date Picker -->
            <script src="./assets/js/gijgo.min.js"></script>
            <!-- One Page, Animated-HeadLin -->
            <script src="./assets/js/wow.min.js"></script>
            <script src="./assets/js/animated.headline.js"></script>
            <script src="./assets/js/jquery.magnific-popup.js"></script>

            <!-- Scrollup, nice-select, sticky -->
            <script src="./assets/js/jquery.scrollUp.min.js"></script>
            <script src="./assets/js/jquery.nice-select.min.js"></script>
            <script src="./assets/js/jquery.sticky.js"></script>

            <!-- counter , waypoint -->
            <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
            <script src="./assets/js/jquery.counterup.min.js"></script>

            <!-- contact js -->
            <script src="./assets/js/contact.js"></script>
            <script src="./assets/js/jquery.form.js"></script>
            <script src="./assets/js/jquery.validate.min.js"></script>
            <script src="./assets/js/mail-script.js"></script>
            <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

            <!-- Jquery Plugins, main Jquery -->
            <script src="./assets/js/plugins.js"></script>
            <script src="./assets/js/main.js"></script>

        </div>
    </form>
</body>
</html>
