<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="food" scope="request" type="beans.Food"/>

<t:main>
    <jsp:body>
        <div class="container-fluid mt-3">
            <div class="card">
                <div class="card-header">
                    <h4>${food.foodName}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <img style="max-width: 200px;max-height: 300px" alt="${food.getFoodName()}" title="${food.getFoodName()}" src="${pageContext.request.contextPath}${food.getUrlImage()}">
                            <div>&nbsp;</div>
                            <c:choose>
                                <c:when test="${ingredientoffood.size() ==0 }"></c:when>
                                <c:otherwise>
                                    <table class="table">
                                        <thead class="thead-dark">
                                        <tr >
                                            <td>
                                                <p class="card-text mt-3">
                                                    Nguyên liệu:
                                                </p>
                                            </td>
                                            <td>
                                                <p class="card-text mt-3">
                                                    Khối lượng:
                                                </p>
                                            </td>
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
                                        <fmt:formatNumber value="${c.getGram()}" type="number"/>
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
                        <div class="col-lg-8">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Kcal:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getKcal()}" type="number"/>
                                    </span>
                                        Kcal/Phần
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Protein:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getProtein()}" type="number"/>
                                    </span>
                                        g
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Lipit:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getLipit()}" type="number"/>
                                    </span>
                                        g
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Glucozo:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getGlucozo()}" type="number"/>
                                    </span>
                                        g
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Vitamin A:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getVitA()}" type="number"/>
                                    </span>
                                        µg
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Vitamin C:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getVitC()}" type="number"/>
                                    </span>
                                        mg
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Vitamin D:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getVitD()}" type="number"/>
                                    </span>
                                        µg
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Kali:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getKali()}" type="number"/>
                                    </span>
                                        mg
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Sắt:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getFe()}" type="number"/>
                                    </span>
                                        mg
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="card-text mt-3">
                                            Natri:
                                        </p>
                                    </td>
                                    <td>
                                    <span class="text-danger font-weight-bold">
                                        <fmt:formatNumber value="${food.getNa()}" type="number"/>
                                    </span>
                                        mg
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </jsp:body>
</t:main>