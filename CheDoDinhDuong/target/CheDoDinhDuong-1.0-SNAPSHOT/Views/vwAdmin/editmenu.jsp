<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
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
        <form method="post">
            <div class="container mt-50">
                <div class="row m-50">
                    <div class="col">
                        <div class="text-center">
                            <h2>SAMPLE MENU MANAGEMENT</h2>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="condition" class="col-sm-2 col-form-label bold">Condition:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="condition" name="condition"
                               readonly value="${conditionName}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="day" class="col-sm-2 col-form-label bold">Day:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="day" name="day"
                               readonly value="${day}">
                    </div>
                </div>
                <div class="row">
                    <button type="button" class="btn btn-outline-dark ml-5" data-toggle="modal"
                            data-target="#myModal">Add food
                        <i class="fa fa-plus" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Breakfast
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 1}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/Admin/EditDetailsMenu?id=${m.getId()}"
                                           class="btn btn-outline-primary pr-4">
                                            <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Lunch</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 2}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/Admin/EditDetailsMenu?id=${m.getId()}"
                                           class="btn btn-outline-primary pr-4">
                                            <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Tea</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 3}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/Admin/EditDetailsMenu?id=${m.getId()}"
                                           class="btn btn-outline-primary pr-4">
                                            <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" colspan="3">Dinner</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${lstMenu}">
                            <c:if test="${m.getSession() == 4}">
                                <tr>
                                    <td colspan="2" class="w-700">${m.getNumber()} ${m.getFoodName()}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/Admin/EditDetailsMenu?id=${m.getId()}"
                                           class="btn btn-outline-primary pr-4">
                                            <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteMenu?id=${m.getId()}&conid=${conid}&day=${day}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Food</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group row">
                                <label for="con" class="col-sm-4 col-form-label">Condition:</label>
                                <div class="col-sm">
                                    <input  class="form-control" id="con" name="con" readonly value="${conditionName}">
                                </div>
                            </div>
                            <div class="form-group row ml-1 mr-1">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="session">Time:</label>
                                    </div>
                                    <select class="custom-select" id="session" name="session">
                                        <option value="1">Breakfash</option>
                                        <option value="2">Lunch</option>
                                        <option value="3">Tea</option>
                                        <option value="4">Dinner</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row ml-1 mr-1">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text"
                                               for="Cat">Categories</label>
                                    </div>
                                    <select class="custom-select category" id="Cat">
                                        <option value="-1" selected>Choose...</option>
                                        <c:forEach var="c" items="${lstCat}">
                                            <option value="${c.getCatID()}">${c.getCatName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row ml-1 mr-1">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="FoodByCat">Foods</label>
                                    </div>
                                    <select class="custom-select foodscal" id="FoodByCat"
                                            name="food">
                                        <option value="-1" selected>Choose...</option>
                                        <c:forEach var="d" items="${foodsCal}">
                                            <option value="${d.getFoodID()}">${d.getFoodName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="number" class="col-sm-4 col-form-label">Số lượng: </label>
                                <div class="col-sm">
                                    <input type="number" class="form-control" id="number" name="number" step="1">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="btnAddMenu" type="submit"
                                        formaction="${pageContext.request.contextPath}/Admin/AddMenu?conid=${conid}&day=${day}"
                                        class="btn btn-default">Add
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <script>
            $('#btnAddMenu').click(function (e) {

                if($('#Cat').val()==-1){
                    alert("Bạn chưa nhập món ăn");
                    e.preventDefault();
                    return;
                }
                if($('#number').val().length == 0){
                    alert("Bạn chưa nhập số lượng");
                    e.preventDefault();
                    return;
                }

            })
            $('.btndelete').click(function (e) {
                if (confirm('Bạn có chắc chắn xóa?')) {

                } else {
                    e.preventDefault();
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
        </script>
    </jsp:body>
</t:main>