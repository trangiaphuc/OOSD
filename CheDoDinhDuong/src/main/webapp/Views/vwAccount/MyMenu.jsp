<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:main>
    <jsp:body>
        <div class="container">
            <div class="row">
                <!--LEFT-->

                <div class="col-lg-3 col-md-3 col-sm-4">

                    <div class="thumbnail text-center">
                        <img class="img-fluid" src="${pageContext.request.contextPath}${authUser.getUrlImage()}" alt=""/>
                        <h2 class="fs-18 mt-10 mb-0">${authUser.getFullName()}</h2>
                        <h3 class="fs-11 mt-0 mb-10 text-muted">USER</h3>
                    </div>


                    <!-- SIDE NAV -->
                    <ul class="side-nav list-group mb-60" id="sidebar-nav">
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/Profile"><i
                                class="fa fa-eye"></i> PROFILE</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/ProfileSetting"><i
                                class="fa fa-gears"></i> SETTINGS</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath}/Account/History"><i
                                class="fa fa-gears"></i> HISTORY </a></li>
                        <li class="list-group-item active"><a href="${pageContext.request.contextPath}/Account/MyMenu"><i class="fa fa-gears"></i> MY MENU</a></li>
                    </ul>
                    <!-- /SIDE NAV -->


                    <!-- info -->
                    <div class="box-light mb-30">
                        <div class="text-muted">
                            <h2 class="fs-18 text-muted mb-6"><b>About</b> ${authUser.getFullName()}</h2>
                            <p>This is your personal information. You can change your info.</p>

                            <ul class="list-unstyled m-0">
                                <li class="mb-10"><i class="fa fa-globe fw-20 hidden-xs-down hidden-sm"></i> <a
                                        href="http://www.google.com">www.google.com</a></li>
                                <li class="mb-10"><i class="fa fa-facebook fw-20 hidden-xs-down hidden-sm"></i> <a
                                        href="http://www.facebook.com/">google</a></li>
                                <li class="mb-10"><i class="fa fa-twitter fw-20 hidden-xs-down hidden-sm"></i> <a
                                        href="http://www.twitter.com/">@google</a></li>
                            </ul>
                        </div>

                    </div>

                </div>
                <!--RIGHT-->
                <div class="col-lg-9 mt-3">
                    <div class="box-light">
                        <div class="box-inner">

                            <div class="row m-5">
                                <div class="col">
                                    <div class="text-center">
                                        <h2>My Menu</h2>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <a href="${pageContext.request.contextPath}/Food/BuildMenu">
                                        <h2>
                                            <i class="fa fa-plus-square" aria-hidden="true"></i>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="overflow-auto " style="height: 600px">
                                <c:choose>
                                    <c:when test="${lstCusMenu.size() == 0}">
                                        <div class="row ">
                                            <div class="col">
                                                <p class="card-text ">
                                                <h3>Không có thực đơn của riêng mình.</h3></p>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="c" items="${lstDate}">
                                            <div class="row ">
                                                <div class="col">
                                                    <div class="card">
                                                        <div class="card-header text-center">
                                                                ${c.getDatetime().getDate()}
                                                            - ${c.getDatetime().getMonth()+1}
                                                            - ${c.getDatetime().getYear()+1900}
                                                        </div>
                                                        <div class="card-body">
                                                            <c:forEach var="d" items="${lstDate2loop}">
                                                                <c:choose>
                                                                    <c:when test="${d.getDatetime().getDate() == c.getDatetime().getDate() }">
                                                                        <div class="card mb-3">
                                                                            <div class="row no-gutters">
                                                                                <div class="col-md-3 d-flex align-items-center justify-content-center"
                                                                                     style="background-color: #00AFF0">
                                                                                    <fmt:formatDate type="time"
                                                                                                    value="${d.getDatetime()}"/>
                                                                                </div>
                                                                                <div class="col-md-9">
                                                                                    <div class="card-body">
                                                                                        <c:forEach var="e"
                                                                                                   items="${lstCusMenu}">
                                                                                            <c:choose>
                                                                                                <c:when test="${e.getDatetime() == d.getDatetime() }">
                                                                                                    <p class="card-text">
                                                                                                    <h5>${e.getNumber()}&nbsp;${e.getFoodNamebyFoodID()}</h5></p>
                                                                                                </c:when>
                                                                                                <c:otherwise></c:otherwise>
                                                                                            </c:choose>
                                                                                        </c:forEach>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>

                                                                    </c:otherwise>
                                                                </c:choose>

                                                            </c:forEach>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </jsp:body>
</t:main>