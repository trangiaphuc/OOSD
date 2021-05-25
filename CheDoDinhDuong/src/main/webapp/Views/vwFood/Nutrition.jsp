<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<beans.Category>"/>

<t:main>
    <jsp:body>
        <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-sm-3">
                <div class="card mb-3">
                    <div class="card-header">
                        <h4>Categories</h4>
                    </div>
                    <div class="list-group list-group-flush">
                        <c:forEach var="c" items="${categoriesWithDetails}">
                            <a href="${pageContext.request.contextPath}/Food/ByCat?id=${c.catID}" class="list-group-item list-group-item-action">
                                <i class="fa fa-caret-right" aria-hidden="true"></i>
                                    ${c.catName}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Foods</h4>
                    </div>
                    <c:choose>
                    <c:when test="${foodsIngredient.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach var="c" items="${foodsIngredient}">
                                <c:choose>
                                    <c:when test="${c.isDelete() == false}">
                                        <div class="col-sm-4 mb-3 fullwidth" >
                                            <div class="card">
                                                <a href="${pageContext.request.contextPath}/Food/Detail?id=${c.foodID}">
                                                    <img src="${pageContext.request.contextPath}${c.getUrlImage()}"
                                                         alt="${c.foodID}" title="${c.foodName}" class="card-img-top"/>
                                                    <div class="card-body">
                                                        <h6 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 80%">${c.foodName}</h6>
                                                        <h5 class="card-title text-danger">
                                                            <fmt:formatNumber value="${c.kcal}" type="number"/> Kcal/Phần
                                                        </h5>
                                                    </div>
                                                    <div class="card-footer bg-success">
                                                        <table class="table table-hover" style="text-align: center">
                                                            <thead>
                                                            <tr>
                                                                <th scope="col">Protein</th>
                                                                <th scope="col">Lipit</th>
                                                                <th scope="col">Glucozo</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td>
                                                                        ${c.protein}
                                                                </td>
                                                                <td>
                                                                        ${c.lipit}
                                                                </td>
                                                                <td>
                                                                        ${c.glucozo}
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </div>
                        </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>