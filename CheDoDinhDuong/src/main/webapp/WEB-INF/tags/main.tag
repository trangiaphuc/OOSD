<%@tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<jsp:useBean id="authUser" scope="session" type="beans.User"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Chế Độ Dinh Dưỡng</title>
    <link rel="icon" href="${pageContext.request.contextPath}/Public/images/logo.png" type="image/x-icon">
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0"/>
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700"
          rel="stylesheet" type="text/css"/>
    <!-- <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500&display=swap" rel="stylecssheet"> -->

    <!-- CORE CSS -->
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/plugins/bootstrap/css/bootstrap.min.css" />--%>

    <jsp:invoke fragment="css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>

    <!-- THEME CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/essentials.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/layout.css"/>
    <!-- PAGE LEVEL SCRIPTS -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/header-1.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/color_scheme.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/style.css"/>
    <!-- Font awesome -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>



    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>


</head>
<body class="smoothscroll enable-animation">
<div id="wrapper">
    <div id="header" class="navbar-toggleable-md clearfix">
        <header id="topNav">
            <div class="container">

                <button class="btn btn-mobile" data-toggle="collapse" data-target=".nav-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>

                <ul class="float-right nav nav-pills nav-second-main">
                    <!-- SEARCH -->
                    <li class="search">
                        <a href="javascript:;">
                            <i class="fa fa-search"></i>
                        </a>
                        <div class="search-box">
                            <form method="post">
                                <div class="input-group">
                                    <input type="text" name="search" placeholder="Search" class="form-control" />
                                    <span class="input-group-btn">
												<button class="btn btn-primary" type="submit" formaction="${pageContext.request.contextPath}/Food/Search">Search</button>
											</span>
                                </div>
                            </form>
                        </div>
                    </li>
                    <!-- /SEARCH -->
                </ul>

                <a class="logo float-left" href="${pageContext.request.contextPath}/Home">
                    <img src="${pageContext.request.contextPath}/Public/images/logo.png"/>
                </a>
                <div class="navbar-collapse collapse float-right nav-main-collapse">
                    <nav class="nav-main">
                        <ul id="topMain" class="nav nav-pills nav-main">
                            <li class="active">
                                <a href="${pageContext.request.contextPath}/Home">
                                    HOME
                                </a>
                            </li>



                            <c:choose>
                                <c:when test="${auth}">
                                    <form style="display: inline-block" id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>

                                    <c:if test="${authUser.getRole()==0}">
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/Admin">
                                                ADMIN PAGE
                                            </a>
                                        </li>
                                    </c:if>
                                        <li class="dropdown"><!-- PAGES -->
                                        <a class="dropdown-toggle" href="#" name="nametag">
                                            Hi, <b>${authUser.getFullName()} </b>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown">
                                                <a  href="${pageContext.request.contextPath}/Account/Profile">
                                                    Profile
                                                </a>
                                                    <%--                                        <ul class="dropdown-menu">--%>
                                                    <%--                                            <li><a href="portfolio-single-project.html">SUB SUB OPTION 1</a></li>--%>
                                                    <%--                                            <li><a href="page-category.html">SUB SUB OPTION 2</a></li>--%>
                                                    <%--                                        </ul>--%>
                                            </li>

                                            <li>
                                                <a href="javascript: $('#frmLogout').submit();">
                                                    Logout
                                                </a>
                                            </li>
                                        </ul>
                                    </li>


                                </c:when>
                                <c:otherwise>
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath}/Account/Login">
                                            LOGIN
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="${pageContext.request.contextPath}/Account/Register">
                                            REGISTER
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                        </ul>

                    </nav>
                </div>
            </div>
        </header>
    </div>


    <jsp:doBody/>


    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="${pageContext.request.contextPath}/Public/images/logo_light.png" class="footer-logo" style="width: 80%">
                    <p>Contact us to any report</p>
                    <address>
                        <ul class="list-unstyled">
                            <li class="footer-sprite address">
                                PO Box 21132<br>
                                Here Weare St, Melbourne<br>
                                Vivas 2355 Australia<br>
                            </li>
                            <li class="footer-sprite phone">
                                Phone: 1-800-565-2390
                            </li>
                            <li class="footer-sprite email">
                                <a href="mailto:support@yourname.com">support@yourname.com</a>
                            </li>
                        </ul>
                    </address>
                </div>
                <div class="col-md-3">
                    <!-- Latest Blog Post -->
                    <h4 class="letter-spacing-1">LATEST NEWS</h4>
                    <ul class="footer-posts list-unstyled">
                        <li>
                            <a href="#">Donec sed odio dui. Nulla vitae elit libero, a pharetra augue</a>
                            <small>29 June 2017</small>
                        </li>
                        <li>
                            <a href="#">Nullam id dolor id nibh ultricies</a>
                            <small>29 June 2017</small>
                        </li>
                        <li>
                            <a href="#">Duis mollis, est non commodo luctus</a>
                            <small>29 June 2017</small>
                        </li>
                    </ul>
                    <!-- /Latest Blog Post -->
                </div>
                <div class="col-md-2">
                    <!-- Links -->
                    <h4 class="letter-spacing-1">EXPLORE SMARTY</h4>
                    <ul class="footer-links list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Our Clients</a></li>
                        <li><a href="#">Our Pricing</a></li>
                        <li><a href="#">Smarty Tour</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                    <!-- /Links -->
                </div>
                <div class="col-md-4">
                    <!-- Newsletter Form -->
                    <h4 class="letter-spacing-1">KEEP IN TOUCH</h4>
                    <p>Subscribe to Our Newsletter to get Important News &amp; Offers</p>

                    <form class="validate" action="php/newsletter.php" method="post"
                          data-success="Subscribed! Thank you!" data-toastr-position="bottom-right">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control required"
                                   placeholder="Enter your Email">
                            <span class="input-group-btn">
										<button class="btn btn-success" type="submit">Subscribe</button>
									</span>
                        </div>
                    </form>
                    <!-- /Newsletter Form -->

                    <!-- Social Icons -->
                    <div class="mt-20">
                        <a href="#" class="social-icon social-icon-border social-facebook float-left"
                           data-toggle="tooltip" data-placement="top" title="Facebook">

                            <i class="icon-facebook"></i>
                            <i class="icon-facebook"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-twitter float-left"
                           data-toggle="tooltip" data-placement="top" title="Twitter">
                            <i class="icon-twitter"></i>
                            <i class="icon-twitter"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-gplus float-left" data-toggle="tooltip"
                           data-placement="top" title="Google plus">
                            <i class="icon-gplus"></i>
                            <i class="icon-gplus"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-linkedin float-left"
                           data-toggle="tooltip" data-placement="top" title="Linkedin">
                            <i class="icon-linkedin"></i>
                            <i class="icon-linkedin"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-rss float-left" data-toggle="tooltip"
                           data-placement="top" title="Rss">
                            <i class="icon-rss"></i>
                            <i class="icon-rss"></i>
                        </a>

                    </div>
                    <!-- /Social Icons -->

                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <ul class="float-right m-0 list-inline mobile-block">
                    <li><a href="#">Terms &amp; Conditions</a></li>
                    <li>&bull;</li>
                    <li><a href="#">Privacy</a></li>
                </ul>
                &copy; All Rights Reserved, Company LTD
            </div>
        </div>
    </footer>
</div>
<div id="sidepanel" class="sidepanel-light">
    <a id="sidepanel_close" href="#"><!-- close -->
        <i class="fa fa-remove"></i>
    </a>

    <div class="sidepanel-content">
        <h2 class="sidepanel-title">Explore Smarty</h2>

        <!-- SIDE NAV -->
        <ul class="list-group">

            <li class="list-group-item">
                <a href="#">
                    <i class="ico-category et-heart"></i>
                    ABOUT US
                </a>
            </li>
            <li class="list-group-item list-toggle"><!-- add "active" to stay open on page load -->
                <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-1" class="collapsed">
                    <i class="ico-dd icon-angle-down"><!-- Drop Down Indicator --></i>
                    <i class="ico-category et-strategy"></i>
                    PORTFOLIO
                </a>
                <ul id="collapse-1" class="list-unstyled collapse"><!-- add "in" to stay open on page load -->
                    <li><a href="#"><i class="fa fa-angle-right"></i> 1 COLUMN</a></li>
                    <li class="active">
                        <span class="badge">New</span>
                        <a href="#"><i class="fa fa-angle-right"></i> 2 COLUMNS</a>
                    </li>
                    <li><a href="#"><i class="fa fa-angle-right"></i> 3 COLUMNS</a></li>
                </ul>
            </li>
            <li class="list-group-item list-toggle"><!-- add "active" to stay open on page load -->
                <a data-toggle="collapse" data-parent="#sidebar-nav" href="#collapse-2" class="collapsed">
                    <i class="ico-dd icon-angle-down"><!-- Drop Down Indicator --></i>
                    <i class="ico-category et-trophy"></i>
                    PORTFOLIO
                </a>
                <ul id="collapse-2" class="list-unstyled collapse"><!-- add "in" to stay open on page load -->
                    <li><a href="#"><i class="fa fa-angle-right"></i> SLIDER</a></li>
                    <li class="active"><a href="#"><i class="fa fa-angle-right"></i> HEADERS</a></li>
                    <li><a href="#"><i class="fa fa-angle-right"></i> FOOTERS</a></li>
                </ul>
            </li>
            <li class="list-group-item">
                <a href="#">
                    <i class="ico-category et-happy"></i>
                    BLOG
                </a>
            </li>
            <li class="list-group-item">
                <a href="#">
                    <i class="ico-category et-beaker"></i>
                    FEATURES
                </a>
            </li>
            <li class="list-group-item">
                <a href="#">
                    <i class="ico-category et-map-pin"></i>
                    CONTACT
                </a>
            </li>

        </ul>
        <!-- /SIDE NAV -->

        <!-- social icons -->
        <div class="text-center mb-30">

            <a href="#" class="social-icon social-icon-sm social-facebook" data-toggle="tooltip" data-placement="top" title="Facebook">
                <i class="icon-facebook"></i>
                <i class="icon-facebook"></i>
            </a>

            <a href="#" class="social-icon social-icon-sm social-twitter" data-toggle="tooltip" data-placement="top" title="Twitter">
                <i class="icon-twitter"></i>
                <i class="icon-twitter"></i>
            </a>

            <a href="#" class="social-icon social-icon-sm social-linkedin" data-toggle="tooltip" data-placement="top" title="Linkedin">
                <i class="icon-linkedin"></i>
                <i class="icon-linkedin"></i>
            </a>

            <a href="#" class="social-icon social-icon-sm social-rss" data-toggle="tooltip" data-placement="top" title="RSS">
                <i class="icon-rss"></i>
                <i class="icon-rss"></i>
            </a>

        </div>
        <!-- /social icons -->

    </div>

</div>
<!-- /SIDE card -->


<!-- SCROLL TO TOP -->
<a href="#" id="toTop"></a>


<%--<!-- PRELOADER -->--%>
<%--<div id="preloader">--%>
<%--    <div class="inner">--%>
<%--        <span class="loader"></span>--%>
<%--    </div>--%>
<%--</div>--%>
<script>
    $(document).mouseup(function(e)
    {
        var container = $(".search-box");

        // if the target of the click isn't the container nor a descendant of the container
        if (!container.is(e.target) && container.has(e.target).length === 0)
        {
            container.hide();
        }
    });
    $('.search').on("click",function () {
        $('.search-box').css("display","block");
    })
    $(document).ready(function (){
        $(".category").change(function (){
            var idd =  $(".category").val();
            $.get("${pageContext.request.contextPath}/Food/CollectFood",{id:idd},function(data) {
                console.log(data);
                var html="";
                for(var key in data) {
                    html += "<option value=" + data[key].foodID  + ">" +data[key].foodName  + "</option>"
                }
                document.getElementById("inputSelectFood").innerHTML = html;
            })
        })
    })
    var tb=[];
    $(document).ready(function (){

        var obj;
        $(".tableCal").css("display","none");
        $(".add2cal").on('click',function (){
            var idfood = $(".foodscal").val();
            if(idfood!= -1){
                $.get("${pageContext.request.contextPath}/Food/SelectFood",{id:idfood},function(data) {

                    obj = data;
                    // Check food co trong bang hay chua
                    var flag = false;
                    for (var i = 0; i < tb.length; i++) {
                        if(obj.value.foodID == tb[i].value.foodID){
                            flag = true;
                            break;
                        }
                    }
                    console.log(flag);
                    // food chua co trong bang
                    if(flag === false){
                        obj.quantity = 1;
                        tb.push(obj);
                    }else{ // san pham da co trong gio hang
                        tb[i].quantity += 1;
                    }
                    console.log(obj.value.foodID);
                    $(".tableCal").css("display","table");
                    drawCheckout();
                })
            }

        });
    })
    function drawCheckout(){
        $('tbody').empty();
        var ckUnit = "";
        var totalKcal = 0;
        for (var i = 0; i < tb.length; i++) {
            totalKcal += tb[i].value.kcal * tb[i].quantity;

            $('tbody').append(
                '<tr>'+
                '<td >'+tb[i].value.foodID+'</td>'+
                '<td>'+tb[i].value.foodName +'</td>'+
                '<td>'+'<img src='+ `"` + "${pageContext.request.contextPath}" +'/' + tb[i].value.urlImage +`"` +' alt="" style="height: 100px;width: 100px">'+'</td>'+
                '<td><input type="number" onchange="changeUnitQuantity(this,'+ tb[i].value.foodID +
                ')" name= " " value="'+tb[i].quantity+'" min="1" step="1"><button type="button" onclick="removeUnit('
                +tb[i].value.foodID+
                ')" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-remove"></span></button>'
                +'</td>' +
                '<td>'+'<b><span class="unit-price">'+tb[i].value.kcal * tb[i].quantity+' Kcal</span></b>' +'</td>'+
                '</tr>');
        }
        ckUnit += '<tr><td colspan="4">Total Kcal</td><td><b>'+totalKcal+' Kcal</b></td></tr>';

        $('tbody').append(ckUnit);
    }
    function removeUnit(id){
        // Check san pham co trong bang hay chua
        for (var i = 0; i < tb.length; i++) {
            if(tb[i].value.foodID == id){
                tb.splice(i, 1);
                break;
            }
        }

        drawCheckout();
    }
    function changeUnitQuantity(e, id){
        var ipValue = e.value;
        if(ipValue > 0){
            for (var i = 0; i < tb.length; i++) {
                if(tb[i].value.foodID == id){
                    tb[i].quantity = ipValue;
                    break;
                }
            }
            drawCheckout();
        }else{
            removeUnit(id);
        }
    }
</script>
<script type="text/javascript">var plugin_path = 'assets/plugins/';</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Public/plugins/jquery/jquery-3.2.1.min.js"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/Public/js/scripts.js"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/Public/plugins/bootstrap/js/bootstrap.bundle.min.js"/>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<jsp:invoke fragment="js"/>
</body>
</html>