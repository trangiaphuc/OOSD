<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<beans.Category>"/>
<jsp:useBean id="foods" scope="request" type="java.util.List<beans.Food>"/>

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
                            <c:when test="${foods.size() == 0}">
                                <div class="card-body">
                                    <p class="card-text">Không có dữ liệu.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach var="c" items="${foods}">
                                    <c:choose>
                                        <c:when test="${c.isDelete() == false}">
                                            <div class="col-sm-4 mb-3 fullwidth" >
                                                <div class="card">
                                                    <a href="${pageContext.request.contextPath}/Food/Detail?id=${c.foodID}">
                                                        <img src="${pageContext.request.contextPath}${c.getUrlImage()}"
                                                             alt="${c.getFoodID()}" title="${c.getFoodName()}" class="card-img-top"/>
                                                        <div class="card-body">
                                                            <h6 class="card-title" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 80%">${c.getFoodName()}</h6>
                                                            <h5 class="card-title text-danger">
                                                                <fmt:formatNumber value="${c.getKcal()}" type="number"/> Kcal/Phần
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
                                                                            ${c.getProtein()}
                                                                    </td>
                                                                    <td>
                                                                            ${c.getLipit()}
                                                                    </td>
                                                                    <td>
                                                                            ${c.getGlucozo()}
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
                            <div class="d-flex justify-content-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${maxPage==1}">

                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${currPage==1}">
                                                        <c:forEach var="d" items="${pages}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="?id=${currCatID}&page=${d}">${d}</a>
                                                            </li>
                                                        </c:forEach>

                                                        <li class="page-item">
                                                            <a class="page-link" href="?id=${currCatID}&page=${currPage+1}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${currPage==maxPage}">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="?id=${currCatID}&page=${currPage-1}" aria-label="Previous">
                                                                        <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>
                                                                <c:forEach var="d" items="${pages}">
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="?id=${currCatID}&page=${d}">${d}</a>
                                                                    </li>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="?id=${currCatID}&page=${currPage-1}" aria-label="Previous">
                                                                        <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>
                                                                <c:forEach var="d" items="${pages}">
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="?id=${currCatID}&page=${d}">${d}</a>
                                                                    </li>
                                                                </c:forEach>

                                                                <li class="page-item">
                                                                    <a class="page-link" href="?id=${currCatID}&page=${currPage+1}" aria-label="Next">
                                                                        <span aria-hidden="true">&raquo;</span>
                                                                    </a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>


                                    </ul>
                                </nav>
                            </div>
                    </div>
                </div>
            </div>

        </div>

    </jsp:body>
</t:main>