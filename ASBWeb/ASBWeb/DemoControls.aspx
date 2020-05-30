﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoControls.aspx.cs" Inherits="ASBWeb.DemoControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="refresh" content="4" />
     <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="assets/css/slicknav.css" />
    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <link rel="stylesheet" href="assets/css/magnific-popup.css" />
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="assets/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/css/slick.css" />
    <link rel="stylesheet" href="assets/css/nice-select.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">

                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-service-cap mb-30">
                                    <div class="service-img">
                                       <h2>Gas Sensor</h2>
                                       <p>
                                           This is an example of a web serice call to the MCU for Gas Data. The colors Red and Green represent the alarm is sounding and the audio notification is active or that the house is safe to be in respectively.
                                        </p>
                                        <br />
                                        <p>
                                            <asp:Label ID="txtGasSensorStatus" runat="server" Text="Gas Sensor Status" ></asp:Label>
                                            : <asp:Image runat="server" ID="GasStatusImg" /></p>

                                    </div>
                                    <div class="service-cap">
                                        <h4><a href="module_details.aspx" target="_parent">Sensor & implementation</a></h4>
                                        <a href="module_details.aspx" target="_parent" class="more-btn">Read More <i class="ti-plus"></i></a>
                                    </div>
                                    <div class="service-icon">
                                        <img src="assets/img/icon/services_icon1.png" alt=""/>
                                    </div>
                                </div>
                            </div>
    </form>
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
