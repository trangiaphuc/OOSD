<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
    <jsp:body>
        <!-- PAGE HEADER

        CLASSES:
        .page-header-xs	= 20px margins
        .page-header-md	= 50px margins
        .page-header-lg	= 80px margins
        .page-header-xlg= 130px margins
        .dark			= dark page header

        .shadow-before-1 	= shadow 1 header top
        .shadow-after-1 	= shadow 1 header bottom
        .shadow-before-2 	= shadow 2 header top
        .shadow-after-2 	= shadow 2 header bottom
        .shadow-before-3 	= shadow 3 header top
        .shadow-after-3 	= shadow 3 header bottom
        -->
        <section class="page-header page-header-xs">
            <div class="container">

                <h1>LOGIN</h1>

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">Login</li>
                </ol>

            </div>
        </section>
        <!-- /PAGE HEADER -->



        <!-- -->
        <section>
            <div class="container">

                <div class="row">

                    <div class="col-md-6 offset-md-3">
                    <c:if test="${hasError}">
                        <!-- ALERT -->
                        <div class="alert alert-mini alert-danger mb-30" role="alert">
                            <strong>Login Failed!</strong> ${errorMessage}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div><!-- /ALERT -->

                    </c:if>




                        <div class="box-static box-border-top p-30">
                            <div class="box-title mb-30">
                                <h2 class="fs-20">I'm a returning customer</h2>
                            </div>

                            <form id="frmLogin" class="m-0" method="post" action="#" autocomplete="off">
                                <div class="clearfix">

                                    <!-- Email -->
                                    <div class="form-group">
                                        <input type="text" name="emaillogin" class="form-control" placeholder="Username" required="">
                                    </div>

                                    <!-- Password -->
                                    <div class="form-group">
                                        <input type="password" name="passwordlogin" class="form-control" placeholder="Password" required="">
                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-md-6 col-sm-6 col-xs-6">

                                        <!-- Inform Tip -->
                                        <div class="form-tip pt-20">
                                            <a class="no-text-decoration fs-13 mt-10 block" href="#">Forgot Password?</a>
                                        </div>

                                    </div>

                                    <div class="col-md-6 col-sm-6 col-xs-6 text-right">

                                        <button type="submit" class="btn btn-primary">OK, LOG IN</button>

                                    </div>

                                </div>

                            </form>

                        </div>

                        <div class="mt-30 text-center">
                            <a href="${pageContext.request.contextPath}/Account/Register"><strong>Create Account</strong></a>

                        </div>

                    </div>
                </div>

            </div>
        </section>
        <!-- / -->
    </jsp:body>
</t:main>
