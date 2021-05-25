<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:body>
        <div class="container">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>SUGGEST MENU</h2>
                    </div>
                </div>
            </div>
            <div class="row mb-50">
                <div class="col-6">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="condition">Tình trạng của bạn</label>
                        </div>
                        <select class="custom-select" id="condition" name="condition"
                                onchange="window.location.href=this.value;">
                            <c:forEach var="c" items="${lstCon}">
                                <c:choose>
                                    <c:when test="${c.getConID() == conid}">
                                        <option selected
                                                value="${pageContext.request.contextPath}/Menu/SuggestMenu?conid=${c.getConID()}">${c.getConName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${pageContext.request.contextPath}/Menu/SuggestMenu?conid=${c.getConID()}">${c.getConName()}</option>
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
                        <th scope="col">Bữa sáng</th>
                        <th scope="col">Bữa trưa</th>
                        <th scope="col">Bữa phụ</th>
                        <th scope="col">Bữa tối</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">Ngày 1</th>
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
                    </tr>
                    <tr>
                        <th scope="row">Ngày 2</th>
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
                    </tr>
                    <tr>
                        <th scope="row">Ngày 3</th>
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
                    </tr>
                    <tr>
                        <th scope="row">Ngày 4</th>
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
                    </tr>
                    <tr>
                        <th scope="row">Ngày 5</th>
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
                    </tr>
                    <tr>
                        <th scope="row">Ngày 6</th>
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
                    </tr>
                    <tr>
                        <th scope="row">Ngày 7</th>
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
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </jsp:body>
</t:main>
