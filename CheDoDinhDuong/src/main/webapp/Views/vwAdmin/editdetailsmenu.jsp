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
                            <h2>EDIT SAMPLE MENU</h2>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="condition" class="col-sm-2 col-form-label bold">Tình trạng:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="condition" name="condition"
                               readonly value="${conditionName}">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="day" class="col-sm-2 col-form-label bold">Ngày:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="day" name="day"
                               readonly value="${day}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="session" class="col-sm-2 col-form-label bold">Thời gian:</label>
                    <div class="col-sm">
                        <input type="text" class="form-control" id="session" name="session"
                               readonly value="${session}">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label bold"
                           for="Cat">Categories</label>
                    <div class="col-sm">
                        <select class="custom-select category" id="Cat">
                            <option value="-1" selected>Choose...</option>
                            <c:forEach var="c" items="${lstCat}">
                                <option value="${c.getCatID()}">${c.getCatName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label bold"
                           for="FoodByCat">Foods</label>
                    <div class="col-sm">
                        <select class="custom-select foodscal" id="FoodByCat"
                                name="food">
                            <option value="${menu.getFoodIDByName()}" selected>${menu.getFoodName()}</option>
                            <c:forEach var="d" items="${foodsCal}">
                                <option value="${d.getFoodIDByName()}">${d.getFoodName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="number" class="col-sm-2 col-form-label bold">Số lượng:</label>
                    <div class="col-sm">
                        <input type="number" class="form-control" id="number" name="number"
                               value="${menu.getNumber()}" step="1">
                    </div>
                </div>
                <div class=" form-group row mt-10">
                    <button type="submit"
                            class="btn btn-outline-primary"
                            formaction="${pageContext.request.contextPath}/Admin/EditDetailsMenu?id=${menu.getId()}">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i> Save
                    </button>
                </div>

            </div>
        </form>
        <script>
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