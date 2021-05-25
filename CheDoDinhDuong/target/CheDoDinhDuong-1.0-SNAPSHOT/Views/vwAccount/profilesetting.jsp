<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="beans.User"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<t:main>

<jsp:attribute name="js">

    <script>
        $('#frmChangePassword').on('submit', function (e) {


            const curpassword= $('#txtCurpassword').val();
            if (curpassword.length === 0) {
                alert('Invalid current password.');
                e.preventDefault();
                return;
            }

            const password= $('#txtNewpassword').val();
            if (password.length === 0) {
                alert('Invalid new password.');
                e.preventDefault();
                return;
            }

            const confirm= $('#txtRenewpassword').val();
            if (confirm.length === 0) {
                alert('Invalid confirm.');
                e.preventDefault();
                return;
            }
            if(password!==confirm){
                e.preventDefault();
                return alert("Password is not match!")

            }



        });


    </script>

</jsp:attribute>

    <jsp:body>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {

                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.image-upload-wrap').hide();

                        $('.file-upload-image').attr('src', e.target.result);
                        $('.file-upload-content').show();

                        $('.image-title').html(input.files[0].name);
                    };

                    reader.readAsDataURL(input.files[0]);

                } else {
                    removeUpload();
                }
            }
            function removeUpload() {
                $('.file-upload-input').replaceWith($('.file-upload-input').clone());
                $('.file-upload-content').hide();
                $('.image-upload-wrap').show();
            }
            $('.image-upload-wrap').bind('dragover', function () {
                $('.image-upload-wrap').addClass('image-dropping');
            });
            $('.image-upload-wrap').bind('dragleave', function () {
                $('.image-upload-wrap').removeClass('image-dropping');
            });

        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <style>
            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
            .file-upload {
                background-color: #ffffff;
                width: 600px;
                margin: 0 auto;
                padding: 20px;
            }

            .file-upload-btn {
                width: 100%;
                margin: 0;
                color: #fff;
                background: #1FB264;
                border: none;
                padding: 10px;
                border-radius: 4px;
                border-bottom: 4px solid #15824B;
                transition: all .2s ease;
                outline: none;
                text-transform: uppercase;
                font-weight: 700;
            }

            .file-upload-btn:hover {
                background: #1AA059;
                color: #ffffff;
                transition: all .2s ease;
                cursor: pointer;
            }

            .file-upload-btn:active {
                border: 0;
                transition: all .2s ease;
            }

            .file-upload-content {
                display: none;
                text-align: center;
            }

            .file-upload-input {
                position: absolute;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                outline: none;
                opacity: 0;
                cursor: pointer;
            }

            .image-upload-wrap {
                margin-top: 20px;
                border: 4px dashed #1FB264;
                position: relative;
            }

            .image-dropping,
            .image-upload-wrap:hover {
                background-color: #1FB264;
                border: 4px dashed #ffffff;
            }

            .image-title-wrap {
                padding: 0 15px 15px 15px;
                color: #222;
            }

            .drag-text {
                text-align: center;
            }

            .drag-text h3 {
                font-weight: 100;
                text-transform: uppercase;
                color: #15824B;
                padding: 60px 0;
            }

            .file-upload-image {
                max-height: 200px;
                max-width: 200px;
                margin: auto;
                padding: 20px;
            }

            .remove-image {
                width: 200px;
                margin: 0;
                color: #fff;
                background: #cd4535;
                border: none;
                padding: 10px;
                border-radius: 4px;
                border-bottom: 4px solid #b02818;
                transition: all .2s ease;
                outline: none;
                text-transform: uppercase;
                font-weight: 700;
            }

            .remove-image:hover {
                background: #c13b2a;
                color: #ffffff;
                transition: all .2s ease;
                cursor: pointer;
            }

            .remove-image:active {
                border: 0;
                transition: all .2s ease;
            }
        </style>

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
                            <img style="width: 250px;height: 280px"  class="img-fluid" src="${pageContext.request.contextPath}${authUser.urlImage}" alt="where your personal picture will be showed" />
                            <h2 class="fs-18 mt-10 mb-0">${authUser.fullName}</h2>
                            <h3 class="fs-11 mt-0 mb-10 text-muted">USER</h3>
                        </div>

                        <!-- SIDE NAV -->
                        <ul class="side-nav list-group mb-60" id="sidebar-nav">
                            <li class="list-group-item "><a href="${pageContext.request.contextPath}/Account/Profile"><i class="fa fa-eye"></i> PROFILE</a></li>
                            <li class="list-group-item active"><a href="${pageContext.request.contextPath}/Account/ProfileSetting"><i class="fa fa-gears"></i> SETTINGS</a></li>
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
                    <div class="col-lg-9 col-md-9 col-sm-8 order-md-2 order-sm-2 mb-80">
                        <div class="box-light">
                            <ul class="nav nav-tabs nav-top-border">
                                <li class="active"><a class="active" href="#info" data-toggle="tab">Personal Info</a></li>
                                <li><a href="#avatar" data-toggle="tab">Avatar</a></li>
                                <li><a href="#password" data-toggle="tab">Password</a></li>

                            </ul>

                            <div class="tab-content mt-20">

                                <!-- info tab -->
                                <div class="tab-pane active" id="info">
                                    <form action="#" method="post" id="frmProfilesetting">
                                        <div class="form-group">
                                            <label class="form-control-label">UserName</label>
                                            <input readonly type="text" name="usernameinfo"  class="form-control" value="${authUser.userName}">
                                        </div>

                                        <div class="form-group">
                                            <label class="form-control-label">Full Name</label>
                                            <input type="text" name="fullnameinfo"  class="form-control" value="${authUser.fullName}">
                                        </div>

                                        <div class="form-group">
                                            <label class="form-control-label">Age</label>
                                            <input type="number" name="ageinfo" class="form-control" value="${authUser.age}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">Height</label>
                                            <input type="number" step="0.5" min="0" name="heightinfo" value="${authUser.height}" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">Weight</label>
                                            <input type="number" step="0.5" min="0" name="weightinfo" value="${authUser.weight}" class="form-control">
                                        </div>


                                        <c:choose>
                                            <c:when test="${authUser.sex == false}">
                                                <div class="form-group">
                                                    <label class="form-control-label">Sex</label>
                                                    <label class="select mb-10 mt-20">
                                                        <select name="sexinfo">
                                                            <option value="-1"  disabled>Gender</option>
                                                            <option value="0" selected>Male</option>
                                                            <option value="1">Female</option>
                                                        </select>
                                                        <i></i>
                                                    </label>
                                                </div>
                                            </c:when>

                                            <c:otherwise>
                                                <div class="form-group">
                                                    <label class="form-control-label">Sex</label>
                                                    <label class="select mb-10 mt-20">
                                                        <select name="sexinfo" >
                                                            <option value="-1"  disabled>Gender</option>
                                                            <option value="0">Male</option>
                                                            <option value="1" selected>Female</option>
                                                        </select>
                                                        <i></i>
                                                    </label>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>




                                        <!--2 cai nut -->
                                        <div class="d-flex justify-content-start">
                                            <button type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/Update">
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                                Save Changes
                                            </button>

                                            <button type="button" class="btn btn-default" formaction="#" href="${pageContext.request.contextPath}/Account/Profile">
                                                Cancel
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <!-- avatar tab -->
                                <div class="tab-pane fade" id="avatar">

                                    <%--<form id="frmAvatar" class="clearfix" action="#" method="post" enctype="multipart/form-data">

                                        <input type="text" name="test"  class="form-control" value="">

                                        <div class="form-group">
                                            <label class="form-control-label">Username</label>
                                            <input type="text" name="usernameimage" readonly class="form-control" value="${authUser.userName}">
                                        </div>
                                        <!-- drag image content-->
                                        <div class="form-group row">
                                            <div class="file-upload">
                                                <button class="file-upload-btn" type="button"
                                                        onclick="$('.file-upload-input').trigger( 'click' )">Add Image
                                                </button>

                                                <div class="image-upload-wrap">


                                                    <input id="imgurl" class="file-upload-input" type='file' onchange="readURL(this);"
                                                           accept="image/*" name="imagefile"/>


                                                    <div class="drag-text">
                                                        <h3>Drag and drop a file or select add Image</h3>
                                                    </div>
                                                </div>
                                                <div class="file-upload-content">
                                                    <img class="file-upload-image" src="#" alt="your image"/>
                                                    <div class="image-title-wrap">
                                                            &lt;%&ndash;                                                <button type="button" onclick="removeUpload()" class="remove-image">&ndash;%&gt;
                                                            &lt;%&ndash;                                                    Remove <span class="image-title" name="imagename">Uploaded Image</span></button>&ndash;%&gt;
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!--2 cai nut -->
                                        <div class="d-flex justify-content-start">
                                            <button id="btnAdd" type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/AddImage">
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                                Save Changes
                                            </button>

                                            <button type="button" class="btn btn-default" formaction="#" href="${pageContext.request.contextPath}/Account/Profile">
                                                Cancel
                                            </button>
                                        </div>

                                    </form>
                                    <script>
                                        $("#btnAdd").click(function (e){

                                            if($("#imgurl").val().length == 0){
                                                alert("Bạn chưa chọn hình ảnh")
                                                e.preventDefault();
                                            }
                                        })
                                    </script>
    --%>
                                    <form method="post" enctype="multipart/form-data">
                                        <input type="text" name="test"  readonly class="form-control" value="${authUser.userName}">

                                        <div class="form-group row">
                                            <div class="file-upload">
                                                <button class="file-upload-btn" type="button"
                                                        onclick="$('.file-upload-input').trigger( 'click' )">Add Image
                                                </button>

                                                <div class="image-upload-wrap">


                                                    <input id="imgurl" class="file-upload-input" type='file' onchange="readURL(this);"
                                                           accept="image/*" name="imagefile"/>


                                                    <div class="drag-text">
                                                        <h3>Drag and drop a file or select add Image</h3>
                                                    </div>
                                                </div>
                                                <div class="file-upload-content">
                                                    <img class="file-upload-image" src="#" alt="your image"/>
                                                </div>
                                            </div>
                                        </div>

                                        <button id="btnAdd" type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/AddImage">
                                            <i class="fa fa-check" aria-hidden="true"></i>
                                            Save Changes
                                        </button>
                                    </form>
                                        <script>
                                            $("#btnAdd").click(function (e){

                                                if($("#imgurl").val().length == 0){
                                                    alert("Bạn chưa chọn hình ảnh")
                                                    e.preventDefault();
                                                }
                                            })
                                        </script>

                                </div>

                                <!-- password tab -->
                                <div class="tab-pane fade" id="password">

                                    <form action="#" method="post" id="frmChangePassword">

                                        <c:if test="${hasError}">
                                            <!-- ALERT -->
                                            <div class="alert alert-mini alert-danger mb-30" role="alert">
                                                <strong>Mat khau hien tai nhap sai</strong> ${errorMessage}
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div><!-- /ALERT -->

                                        </c:if>
                                        <div class="form-group">
                                            <label class="form-control-label">Username</label>
                                            <input type="text" name="curusername" id="txtCurusername" readonly class="form-control" value="${authUser.userName}">
                                        </div>

                                        <div class="form-group">
                                            <label class="form-control-label">Current Password</label>
                                            <input type="password" name="curpassword" class="form-control" id="txtCurpassword">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">New Password</label>
                                            <input type="password" name="newpassword" class="form-control" id="txtNewpassword">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">Re-type New Password</label>
                                            <input type="password" name="renewpassword" class="form-control" id="txtRenewpassword">
                                        </div>

                                        <!--2 cai nut -->
                                        <div class="d-flex justify-content-start">
                                            <button type="submit" class="btn btn-primary" style="margin-right: 10px;" formaction="${pageContext.request.contextPath}/Account/ChangePassword">
                                                <i class="fa fa-check" aria-hidden="true"></i>
                                                Change Password
                                            </button>

                                            <button type="button" class="btn btn-default" formaction="#" href="${pageContext.request.contextPath}/Account/Profile">
                                                Cancel
                                            </button>
                                        </div>

                                    </form>

                                </div>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>


    </jsp:body>
</t:main>
