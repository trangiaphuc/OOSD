<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
        <!-- Chuc nang container -->
        <section id="features">
            <div class="container">

                <header class="text-center mb-60 background_food">
                    <h2>Our Features</h2>
                    <h5 class="lead font-lato pb-30">Immediately perform the functions you want to use!</h5>
                    <hr />
                </header>

                <!--Chuc nang Hang 1 -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/Calculate/All"><i class="ico-light ico-lg ico-rounded ico-hover et-tools"></i></a>
                            <a href="${pageContext.request.contextPath}/Calculate/All"><h4>BMI & Calo calculation</h4></a>
                            <p>Check body index, thereby suggesting the right nutritional diet.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/Menu/SuggestMenu">
                                <i class="ico-light ico-lg ico-rounded ico-hover et-piechart"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/Menu/SuggestMenu"> <h4>Diet by condition</h4></a>
                            <p>Depending on the condition of the user that appropriate diets are given.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/Food/CalKcal"><i class="ico-light ico-lg ico-rounded ico-hover et-compass"></i></a>
                            <a href="${pageContext.request.contextPath}/Food/CalKcal"><h4>Calculate calories in the meal</h4></a>
                            <p>Energy absorbed after eating food.</p>
                        </div>
                    </div>



                </div>
                <!--Chuc nang Hang 1 -->

                <!--Chuc nang Hang 2 -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/Food/Nutrition"><i class="ico-light ico-lg ico-rounded ico-hover et-search"></i></a>
                            <a href="${pageContext.request.contextPath}/Food/Nutrition"><h4>Nutritional information</h4></a>
                            <p>Information of proteins, fats, vitamins, ....</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/Food/BuildMenu"><i class="ico-light ico-lg ico-rounded ico-hover et-presentation"></i></a>
                            <a href="${pageContext.request.contextPath}/Food/BuildMenu"> <h4>Build Menu </h4></a>
                            <p>Develop a menu to calculate and plan deployment to meet your nutritional needs</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/Account/MyMenu"><i class="ico-light ico-lg ico-rounded ico-hover et-alarmclock"></i></a>
                            <a href="${pageContext.request.contextPath}/Account/MyMenu"> <h4>Today what do eat</h4></a>
                            <p>Suggestions for meals today.</p>
                        </div>
                    </div>

                </div>
                <!--Chuc nang Hang 2 -->

            </div>
        </section>
        <!-- Chuc nang container -->

        <!-- Banner -->
        <section id="home" class="h-450" >
            <div class="display-table">
                <div class="display-table-cell vertical-align-middle">

                    <div class="container text-center">

                        <h1 class="m-0 fs-50 fw-300 wow fadeInUp" data-wow-delay="0.4s">Healthy and Balenciaga</h1>
                        <p class="lead font-lato fs-30 wow fadeInUp" data-wow-delay="0.7s">Building a Diet was never so Easy &amp; Effective.</p>

                        <div class="mt-30">
                            <!-- <a href="#" class="btn btn-3d btn-lg btn-teal"><i class="glyphicon glyphicon-th-large"></i>FREE TRIAL</a> -->
                            <!-- <span class="fs-17 hidden-xs-down">&nbsp; OR &nbsp;</span> -->
                            <a href="${pageContext.request.contextPath}/Account/Login" class="btn btn-3d btn-lg btn-red"><i class="glyphicon glyphicon-user"></i>START BEING A MEMBER</a>
                        </div>

                    </div>

                </div>
            </div>
        </section>
        <!-- Banner -->

    </jsp:body>
</t:main>