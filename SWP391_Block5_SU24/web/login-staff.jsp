<%-- 
    Document   : login
    Created on : Aug 5, 2024, 11:28:46 AM
    Author     : Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Ion Icon Fonts-->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">

        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- Date Picker -->
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <!-- Flaticons  -->
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">
        <style>
            .idiv{
                align-items: center;
                display:flex;
                justify-content: flex-end;
                background-image: url(images/Banner2.png);
                background-position: 50% 50%;
                background-size: contain;
                background-repeat: no-repeat;
                background-color:#ffb657;
                height:80%;
                width:80%
            }
            .idiv{
                animation-name: slide-left;
                animation-duration: 1s;
            }
            @keyframes slide-left {
                from {
                    margin-right: -50px;
                }
                to {
                    margin-right: 0px;
                }
            }
        </style>
    </head>
    <body>


        <div style="height: 670px; width: 100%;">
            <div class="colorlib-nav" style="padding:50px;padding-left:200px; background-color:white; width:100%; height:12%; font-size:30px; align-items:center;box-shadow:#0000000f 0px 6px 6px 0px;color:#000c;display:flex;">
                <div class="ldiv" style="padding-right:7px" id="colorlib-logo"><a href="index.jsp">Footwear</a></div> Log In
            </div>
            <div style="background-color:#ffb657; width:100%;height:85%;align-items: center;justify-content: center;display:flex">
                <div class ="idiv">
                    <div style="background-color:#fff;border-radius:4px;font-size:14px;min-width: 30%;margin-right:50px">
                        <div style="align-items: center; padding: 22px 30px 5px;;font-size:20px; color:black; display:flex">
                            <p style='padding-left:7.5%'>Log In<p>
                        </div>
                        <div style="padding: 0px 30px 30px">
                            <%
                            String error = request.getParameter("error");
                            if(!(error==null)){%>
                            <div style="align-items: center;color:red; display:flex">
                                <p style='padding-left:7.5%'><%= error%><p>
                            </div>
                            <%}%>
                            <form action="LoginController" method="post" style='display: flex; flex-direction: column; align-items: center;'>                           
                                <input style='margin:0px 12px 0px 12px; height: 40px; width:85%;' type="text" name="username" placeholder='Username' value="${username != null ? username : ''}"><br>
                                <input style='margin:0px 12px 0px 12px; height: 40px; width:85%;' type="password" name="password" placeholder='Password'><br>
                                <button name="role" value="2" style='border:0px; text-align:center; background-color: #ffb657;border-radius: 2px;display:flex;color:white;justify-content:center; width: 85%;' type="submit">LOG IN</button>
                            </form>
                            <div style="justify-content: space-between;display:flex; width:100%;align-items: center">
                                <a style='padding-left:7.5%'></a> <a href="login.jsp" style='padding-right:7.5%'>Customer Login</a></div>

                        </div>
                        <div style="justify-content:center; text-align: center; display:flex; padding: 22px 30px;">
                            New to Footwear? &nbsp;<a href='signup.jsp'>Sign Up</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>