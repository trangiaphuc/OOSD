<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
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
        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <section class="page-header page-header-xs">
            <div class="container">
                <h1>ADMIN PAGE</h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/Admin">Admin page</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/FoodManagement">Food</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1">Menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/UserManagement">User</a></li>
                </ol>
            </div>
        </section>

        <div class="container mt-50">
            <form id="frmAddIngre" method="post"
                  action="${pageContext.request.contextPath}/Admin/AddIngre?id=${food.getFoodID()}">
                <div class="row">
                    <div class="col-md-5">
                        <div class="text-center" style="width: 100%;">
                            <img src="${pageContext.request.contextPath}${food.getUrlImage()}" class="img-thumbnail"
                                 style="width: 80%" alt="${food.getFoodName()}">
                        </div>
                    </div>
                    <div class="col-md">
                        <div>
                            <div class="row">
                                <div style="font-weight: bold; font-size: 20px">Ingredient</div>
                                <button type="button" class="btn btn-outline-dark ml-5"
                                        style="height: 25px; width: 40px" data-toggle="modal"
                                        data-target="#myModal">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>

                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Add ingredient</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <table class="table">
                                                    <thead>
                                                    <tr>
                                                        <td>
                                                            <div class="input-group mb-3">
                                                                <div class="input-group-prepend">
                                                                    <label class="input-group-text"
                                                                           for="Cat">Categories</label>
                                                                </div>
                                                                <select class="custom-select category" id="Cat">
                                                                    <option value="-1" selected>Choose...</option>
                                                                    <c:forEach var="c" items="${lstCat}">
                                                                        <c:if test="${c.getCatID() != 1 && c.getCatID()!= 3}">
                                                                            <option value="${c.getCatID()}">${c.getCatName()}</option>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group mb-3">
                                                                <div class="input-group-prepend">
                                                                    <label class="input-group-text" for="FoodByCat">Foods</label>
                                                                </div>
                                                                <select class="custom-select foodscal" id="FoodByCat"
                                                                        name="ingre">
                                                                    <option value="-1" selected>Choose...</option>
                                                                    <c:forEach var="d" items="${foodsCal}">
                                                                        <option value="${d.getFoodID()}">${d.getFoodName()}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div class="form-group row">
                                                <label for="gram" class="col-sm-6 col-form-label">Amougts
                                                    (gram)</label>
                                                <div class="col-sm">
                                                    <input type="number" class="form-control" id="gram" name="gram"
                                                           step="0.01">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button id="btnAddIngre" type="button"
                                                        class="btn btn-default">Add
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="row" style="overflow: auto;height: 200px">
                                <c:choose>
                                    <c:when test="${ingredientoffood.size() == 0}">
                                        <div>Không có nguyên liệu</div>
                                    </c:when>
                                    <c:otherwise>
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th scope="col">Nguyên liệu</th>
                                                <th scope="col">Gram</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="c" items="${ingredientoffood}">
                                                <tr>
                                                    <td>
                                                        <p class="card-text mt-3">
                                                                ${c.getIngredientName()}
                                                        </p>
                                                    </td>
                                                    <td>
                                    <span class="text-danger font-weight-bold">
<%--                                        <fmt:formatNumber value="${c.gram}" type="number"/>--%>
                                        ${c.gram}
                                    </span>
                                                        g
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
            <form method="post">
                <div class="form-group row">
                    <label for="foodname" class="col-sm-2 col-form-label">Food name</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="foodname" name="foodname"
                               value="${food.getFoodName()}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="catname" class="col-sm-2 col-form-label">Category</label>
                    <div class="col-sm">
                        <select class="form-control" id="catname" name="catname">
                            <c:forEach var="c" items="${lstCat}">
                                <c:choose>
                                    <c:when test="${c.getCatName() == food.getCatName()}">
                                        <option selected>${c.getCatName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>${c.getCatName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="glucozo" class="col-sm-2 col-form-label">Glucozo</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="glucozo" name="glucozo"
                               value="${food.getGlucozo()}"
                               step="0.01">
                    </div>
                    <label for="kcal" class="col-sm-2 col-form-label text-right">Calo</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="kcal" name="kcal" value="${food.getKcal()}"
                               step="0.01">
                    </div>
                    <label for="lipit" class="col-sm-2 col-form-label text-right">Lipt</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="lipit" name="lipit" value="${food.getLipit()}"
                               step="0.01">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="protein" class="col-sm-2 col-form-label">Protein</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="protein" name="protein"
                               value="${food.getProtein()}"
                               step="0.01">
                    </div>
                    <label for="vitaminA" class="col-sm-2 col-form-label text-right">VitaminA</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="vitaminA" name="vitaminA"
                               value="${food.getVitA()}" step="0.01">
                    </div>
                    <label for="vitaminB" class="col-sm-2 col-form-label text-right">VitaminB</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="VitaminB" name="vitaminB"
                               value="${food.getVitB()}" step="0.01">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="vitaminC" class="col-sm-2 col-form-label">VitaminC</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="vitaminC" name="vitaminC"
                               value="${food.getVitC()}" step="0.01">
                    </div>
                    <label for="vitaminD" class="col-sm-2 col-form-label text-right">VitaminD</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="vitaminD" name="vitaminD"
                               value="${food.getVitD()}" step="0.01">
                    </div>
                    <label for="vitaminE" class="col-sm-2 col-form-label text-right">VitaminE</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="VitaminE" name="vitaminE"
                               value="${food.getVitE()}" step="0.01">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="kali" class="col-sm-2 col-form-label">Kali</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="kali" name="kali" value="${food.getKali()}"
                               step="0.01">
                    </div>
                    <label for="fe" class="col-sm-2 col-form-label text-right">Sắt</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="fe" name="fe" value="${food.getFe()}"
                               step="0.01">
                    </div>
                    <label for="natri" class="col-sm-2 col-form-label text-right">Natri</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" id="natri" name="natri" value="${food.getNa()}"
                               step="0.01">
                    </div>
                </div>
                <div class="form-group row" style="display: none">
                    <label for="urlimg" class="col-sm-2 col-form-label">Image url</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="urlimg" name="urlimg" value="${food.getUrlImage()}">
                    </div>
                </div>
                    <%--                <button id="btnEdit" type="submit" class="btn btn-primary mt-50 mb-50"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button>--%>
                <button id="btnEdit" type="submit"
                        formaction="${pageContext.request.contextPath}/Admin/EditFood?id=${food.getFoodID()}"
                        class="btn btn-primary mt-50 mb-50"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save
                </button>
            </form>
        </div>
        <script>
            $("#btnAddIngre").click(function (e) {
                e.preventDefault();
                var ingreID = $("#FoodByCat").val();
                $.get("${pageContext.request.contextPath}/Admin/CheckValidIngre?foodid=" + foodID + "&ingreid=" + ingreID, function (data) {
                    if (data === true) {
                        alert("Nguyên liệu đã tồn tại");
                    } else {
                        if ($('#FoodByCat').val() == -1) {
                            alert("Bạn chưa chọn nguyên liệu");
                            return;
                        }
                        if ($('#gram').val() == 0) {
                            alert("Bạn chưa chọn khối lượng");
                            return;
                        }
                        $('#frmAddIngre').submit();
                    }
                })
            })
            $("#btnEdit").click(function (e) {
                if ($("#foodname").val().length == 0) {
                    alert("Please enter food name");
                    e.preventDefault();
                    return;
                }
                if ($("#glucozo").val().length == 0) {
                    $("#glucozo").val(0);
                }
                if ($("#kcal").val().length == 0) {
                    $("#kcal").val(0);
                }
                if ($("#lipit").val().length == 0) {
                    $("#lipit").val(0);
                }
                if ($("#protein").val().length == 0) {
                    $("#protein").val(0);
                }
                if ($("#vitaminA").val().length == 0) {
                    $("#vitaminA").val(0);
                }
                if ($("#VitaminB").val().length == 0) {
                    $("#VitaminB").val(0);
                }
                if ($("#kali").val().length == 0) {
                    $("#kali").val(0);
                }
                if ($("#vitaminC").val().length == 0) {
                    $("#vitaminC").val(0);
                }
                if ($("#vitaminD").val().length == 0) {
                    $("#vitaminD").val(0);
                }
                if ($("#VitaminE").val().length == 0) {
                    $("#VitaminE").val(0);
                }
                if ($("#natri").val().length == 0) {
                    $("#natri").val(0);
                }
                if ($("#fe").val().length == 0) {
                    $("#fe").val(0);
                }
            })
            $(document).ready(function () {
                $("#Cat").change(function () {
                    var idd = $("#Cat").val();
                    if (idd != -1) {
                        $.get("${pageContext.request.contextPath}/Food/CollectFood", {id: idd}, function (data) {
                            var html = "";
                            for (var idx in data) {
                                html += "<option value=" + data[idx].foodID + ">" + data[idx].foodName + "</option>"
                            }
                            document.getElementById("FoodByCat").innerHTML = html;
                        })
                    }
                })
            })
            var foodID = ${food.getFoodID()};
            var flag = true;

        </script>
    </jsp:body>
</t:main>