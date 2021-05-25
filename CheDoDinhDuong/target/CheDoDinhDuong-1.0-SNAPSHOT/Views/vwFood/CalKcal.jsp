<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:main>
    <jsp:body>
        <div class="container-fluid mt-3">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h3>Calculate calories in the meal</h3>
                    </div>
                </div>
            </div>

            <table class="table">
                <thead>
                <tr>
                    <td>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Categories</label>
                            </div>
                            <select class="custom-select category" id="inputGroupSelect01">
                                <option disabled value="-1" selected>Choose...</option>
                                <c:forEach var="c" items="${categoriesforcal}">
                                    <option value="${c.getCatID()}">${c.getCatName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputSelectFood">Foods</label>
                            </div>
                            <select class="custom-select foodscal" id="inputSelectFood">
                                <option value="-1" selected>Choose...</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <button class="btn btn-green add2cal">ADD</button>
                    </td>
                </tr>
                </thead>
            </table>
            <table class="table tableCal">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Food</th>
                    <th >Image</th>
                    <th>Quantity</th>
                    <th>Kcal</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <img src="" alt="">
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <b>&nbsp;<span class="unit-price"></span></b>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">Total Kcal</td>
                    <td ><b><span class="unit-price"></span>&nbsp;Kcal</b></td>
                </tr>
                </tbody>
            </table>
        </div>
    </jsp:body>

</t:main>