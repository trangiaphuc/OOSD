<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:body>
        <section class="page-header page-header-xs">
            <div class="container">
                <h1>ADMIN PAGE</h1>
                <ol class="breadcrumb">
                    <li class="active">Admin page</li>
                    <li><a href="${pageContext.request.contextPath}/Admin/FoodManagement">Food</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1">Menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/UserManagement">User</a></li>
                </ol>
            </div>
        </section>
        <div class="container mt-50" style="height: 600px">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>TRANG QUẢN LÝ</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-xs-6">
                    <div class="text-center">
                        <i class="ico-light ico-lg ico-rounded ico-hover fa fa-cutlery" aria-hidden="true"></i>
                        <a href="${pageContext.request.contextPath}/Admin/FoodManagement"><h4>FOODMANAGEMENT</h4></a>
                        <p>Insert, edit or delete your food</p>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6">
                    <div class="text-center">
                        <i class="ico-light ico-lg ico-rounded ico-hover fa fa-table" aria-hidden="true"></i>
                        <a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1"> <h4>SAMPLE MENU MANAGEMENT</h4></a>
                        <p>Insert, edit or delete sample menu for member to refer</p>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6">
                    <div class="text-center">
                        <i class="ico-light ico-lg ico-rounded ico-hover fa fa-users" aria-hidden="true"></i>
                        <a href="${pageContext.request.contextPath}/Admin/UserManagement"><h4>USERS MANAGEMENT</h4></a>
                        <p>Manage all member of your website</p>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6">
                    <div class="text-center">
                        <i class="ico-light ico-lg ico-rounded ico-hover fa fa-recycle" aria-hidden="true"></i>
                        <a href="${pageContext.request.contextPath}/Admin/RecycleBin"><h4>RECYCLE BIN</h4></a>
                        <p>Manage all food which is deleted</p>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>