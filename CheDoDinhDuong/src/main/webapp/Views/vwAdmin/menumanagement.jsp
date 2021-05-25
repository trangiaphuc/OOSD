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
                    <li class="active">Menu</li>
                    <li><a href="${pageContext.request.contextPath}/Admin/UserManagement">User</a></li>
                </ol>
            </div>
        </section>
        <div class="container mt-50">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>SIMPLE MENU MANAGEMENT</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="condition">Condition</label>
                        </div>
                        <select class="custom-select" id="condition" name="condition"
                                onchange="window.location.href=this.value;">
                            <c:forEach var="c" items="${lstCon}">
                                <c:choose>
                                    <c:when test="${c.getConID() == conid}">
                                        <option selected
                                                value="${pageContext.request.contextPath}/Admin/MenuManagement?conid=${c.getConID()}">${c.getConName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${pageContext.request.contextPath}/Admin/MenuManagement?conid=${c.getConID()}">${c.getConName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Beakfast</th>
                        <th scope="col">Lunch</th>
                        <th scope="col">Tea</th>
                        <th scope="col">Dinner</th>
                        <th scope="col">&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">Day 1</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu1}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu1}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu1}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu1}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=1"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Day 2</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu2}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu2}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu2}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu2}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=2"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Day 3</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu3}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu3}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu3}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu3}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=3"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Day 4</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu4}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu4}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu4}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu4}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=4"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Day 5</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu5}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu5}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu5}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu5}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=5"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Day 6</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu6}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu6}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu6}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu6}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=6"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Day 7</th>
                        <td>
                            <c:forEach var="m" items="${lstMenu7}">
                                <c:if test="${m.getSession() == '1'}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu7}">
                                <c:if test="${m.getSession() == 2}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu7}">
                                <c:if test="${m.getSession() == 3}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="m" items="${lstMenu7}">
                                <c:if test="${m.getSession() == 4}">
                                    <div>
                                        <span>${m.getNumber()}&nbsp;</span>
                                        <span>${m.getFoodName()}</span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/Admin/EditMenu?conid=${conid}&day=7"
                               class="btn btn-outline-primary pr-4">
                                <i class="fa fa-pencil mt-5" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </jsp:body>
</t:main>