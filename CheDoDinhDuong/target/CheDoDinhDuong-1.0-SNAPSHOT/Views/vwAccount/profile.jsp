<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="authUser" scope="session" type="beans.User"/>



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

                <h1>PROFILE</h1>

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">Profile</li>
                </ol>

            </div>
        </section>
        <!-- /PAGE HEADER -->


        <section>
            <div class="container">
                <div class="row">

                    <!-- LEFT -->
                    <div class="col-lg-3 col-md-3 col-sm-4">

                        <div class="thumbnail text-center">
                            <img  class="img-fluid" src="${pageContext.request.contextPath}${authUser.urlImage}" alt="" />
                            <h2 class="fs-18 mt-10 mb-0">${authUser.fullName}</h2>
                            <h3 class="fs-11 mt-0 mb-10 text-muted">USER</h3>
                        </div>



                        <!-- SIDE NAV -->
                        <ul class="side-nav list-group mb-60" id="sidebar-nav">
                            <li class="list-group-item active"><a href="${pageContext.request.contextPath}/Account/Profile"><i class="fa fa-eye"></i> PROFILE</a></li>
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/ProfileSetting"><i class="fa fa-gears"></i> SETTINGS</a></li>
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/History"><i class="fa fa-gears"></i> HISTORY </a></li>
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/MyMenu"><i class="fa fa-gears"></i> MY MENU</a></li>
                        </ul>
                        <!-- /SIDE NAV -->


                        <!-- info -->
                        <div class="box-light mb-30">
                            <div class="text-muted">
                                <h2 class="fs-18 text-muted mb-6"><b>About</b> ${authUser.fullName}</h2>
                                <p>This is your personal information. You can change your info.</p>

                                <ul class="list-unstyled m-0">
                                    <li class="mb-10"><i class="fa fa-globe fw-20 hidden-xs-down hidden-sm"></i> <a href="http://www.google.com">www.google.com</a></li>
                                    <li class="mb-10"><i class="fa fa-facebook fw-20 hidden-xs-down hidden-sm"></i> <a href="http://www.facebook.com/">google</a></li>
                                    <li class="mb-10"><i class="fa fa-twitter fw-20 hidden-xs-down hidden-sm"></i> <a href="http://www.twitter.com/">@google</a></li>
                                </ul>
                            </div>

                        </div>

                    </div>


                    <!-- RIGHT -->
                    <div class="col-lg-9 col-md-9 col-sm-8">

                        <div class="box-light">

                            <div class="row">

                                <!-- PROFILE -->
                                <div class="col-md-12">

                                    <div class="box-inner">
                                        <h3>
                                            <a class="float-right fs-11 text-warning" href="#">VIEW ALL</a>
                                            PROFILE
                                        </h3>

                                        <form>

                                            <div class="form-group row">
                                                <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="usernameprofile"  readonly class="form-control-plaintext" id="staticEmail" value="${authUser.userName}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staticEmail1" class="col-sm-2 col-form-label">Full Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" readonly class="form-control-plaintext" id="staticEmail1" value="${authUser.fullName}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staticEmail2" class="col-sm-2 col-form-label">Age</label>
                                                <div class="col-sm-10">
                                                    <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="${authUser.age}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staticEmail3" class="col-sm-2 col-form-label">Height</label>
                                                <div class="col-sm-10">
                                                    <input type="text" readonly class="form-control-plaintext" id="staticEmail3" value="${authUser.height} (cm)">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staticEmail4" class="col-sm-2 col-form-label">Weight</label>
                                                <div class="col-sm-10">
                                                    <input type="text"  readonly class="form-control-plaintext" id="staticEmail4" value="${authUser.weight} (kg)">
                                                </div>
                                            </div>

                                        
                                           <c:choose>
                                               <c:when test="${authUser.sex == false}">
                                                   <div class="form-group row">
                                                       <label for="staticEmail5" class="col-sm-2 col-form-label">Sex</label>
                                                       <div class="col-sm-10">
                                                           <input type="text" readonly class="form-control-plaintext" id="staticEmail5" value="Male">
                                                       </div>
                                                   </div>
                                               </c:when>

                                               <c:otherwise>
                                                   <div class="form-group row">
                                                       <label for="staticEmail6" class="col-sm-2 col-form-label">Sex</label>
                                                       <div class="col-sm-10">
                                                           <input type="text" readonly class="form-control-plaintext" id="staticEmail6" value="Female">
                                                       </div>
                                                   </div>
                                               </c:otherwise>
                                           </c:choose>





                                        </form>





                                    </div>


                                </div>
                                <!-- /PROFILE -->

                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </section>


    </jsp:body>
</t:main>
