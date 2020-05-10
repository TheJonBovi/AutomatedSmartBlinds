﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logs.aspx.cs" Inherits="ASBWeb.Logs" %>

<!doctype html>
<html class="no-js" lang="zxx">
<head runat="server">
    <meta http-equiv="refresh" content="30">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title><%: Page.Title %> - Automated Smart Blinds</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/Automated_Smart_Blinds_Logo_Main_blinds.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
</head>

<body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <%--<img src="assets/img/logo/loder-logo.png" alt="">--%>
                    <img src="assets/img/logo/Automated_Smart_Blinds_Logo_Header_blinds.png" alt="" />
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
        <div>
            <form runat="server" id="main">
                <!-- slider Area Start-->
                <div class="slider-area ">
                    <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/gallery/front-down.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="hero-cap pt-100">
                                        <h2>Logs</h2>
                                        <nav aria-label="breadcrumb ">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Logs</a></li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- slider Area End-->
                <!-- Services Area Start -->
                <%--<div class="services-area1 section-padding30">--%>
                <%-- <div class="container">--%>
                <!-- section tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-55">
                            <div class="front-text">
                                <h2 class="">LOG time</h2>
                            </div>
                            <span class="back-text">Log</span>
                        </div>
                    </div>
                </div>
<%--        </div>--%>
                         <%--<div class="progress-table-wrap"> --%> 
					
                            <asp:GridView runat="server" ID="gvLogs" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sysID" DataSourceID="sDSAutoSmartBlinds" AllowPaging="True" PageSize="50" CssClass="progress-table" ForeColor="Black" >
                                <AlternatingRowStyle BackColor="#ffe9de" />
                                <Columns>
                                    <asp:BoundField DataField="sysID" HeaderText="sysID" InsertVisible="False" ReadOnly="True" SortExpression="sysID" />
                                    <asp:BoundField DataField="userSysID" HeaderText="userSysID" SortExpression="userSysID" />
                                    <asp:BoundField DataField="logTime" HeaderText="logTime" SortExpression="logTime" />
                                    <asp:BoundField DataField="tempLog" HeaderText="Current Temp" SortExpression="tempLog" />
                                    <asp:BoundField DataField="tempAlarm" HeaderText="Temp Alert Status" SortExpression="tempAlarm" />
                                    <asp:BoundField DataField="proxLog" HeaderText="Prox Alert Status" SortExpression="proxLog" />
                                    <asp:BoundField DataField="ledLog" HeaderText="ledLog" SortExpression="ledLog" />
                                    <asp:BoundField DataField="pizoLog" HeaderText="pizoLog" SortExpression="pizoLog" />
                                    <asp:BoundField DataField="gasLog" HeaderText="Gas Alert Status" SortExpression="gasLog" />
                                    <asp:BoundField DataField="cameraLog" HeaderText="cameraLog" SortExpression="cameraLog" />
                                    <asp:BoundField DataField="sbHorzLog" HeaderText="Current Vert Position" SortExpression="sbHorzLog" /> <%--current vert name change from horz log. need to change log in the future.--%>
                                    <asp:BoundField DataField="sbVertLog" HeaderText="Current Horz Position" SortExpression="sbVertLog" /> <%--current horz name change from vert log. need to change log in the future.--%>
                                </Columns>
                            </asp:GridView>
                       
                               <%-- </div>--%>

       <asp:SqlDataSource ID="sDSAutoSmartBlinds" runat="server" ConnectionString="<%$ ConnectionStrings:csWebDB %>" SelectCommand="SELECT * FROM [sbLogs] ORDER BY [logTime] DESC"></asp:SqlDataSource>
        <!-- Services Area End -->
            </form>
            </div>
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

</body>
</html>
