<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>


    <jsp:attribute name="js">
        <script>

            $(document).ready(function (){
                $(".categoryBuild").change(function (){
                    var idd =  $(".categoryBuild").val();
                    $.get("${pageContext.request.contextPath}/Food/CollectFood",{id:idd},function(data) {
                        console.log(data);
                        var html="";
                        for(var key in data) {
                            html += "<option value=" + data[key].foodID  + ">" +data[key].foodName  + "</option>"
                        }
                        document.getElementById("inputSelectFoodBuild").innerHTML = html;
                    })
                })
            });

            $('#btnAddtoMenu').click(function (e){
                var catCheck =  $(".categoryBuild").val();
                if(catCheck==null)
                {
                    alert("Please choose Categories");
                    e.preventDefault();
                    return;
                }
                if($('.inputdate').val().length == 0)
                {
                    alert("Please choose Date");
                    e.preventDefault();
                    return;
                }
                if($('.numberBM').val().length == 0)
                {
                    alert("Please choose Number");
                    e.preventDefault();
                    return;
                }

            });
        </script>
    </jsp:attribute>

    <jsp:body>

        <div class="container">
            <div class="row m-50">
                <div class="col">
                    <div class="text-center">
                        <h2>BUILD MENU FOR YOU</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form method="post">
                        <table class="table">
                            <thead>
                            <tr>
                                <td>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelectCatBuild">Categories</label>
                                        </div>
                                        <select class="custom-select categoryBuild" id="inputGroupSelectCatBuild">
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
                                            <label class="input-group-text" for="inputSelectFoodBuild">Foods</label>
                                        </div>
                                        <select class="custom-select foodsbuild" id="inputSelectFoodBuild" name="foodIdBuild">
                                            <option value="-1" selected>Choose...</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            </thead>
                        </table>
                        <div class="form-group ">
                            <div class='mb-3 input-group date d-flex align-items-center' id='dtpkCustomMenu'>
                                Date: &nbsp;
                                <input type="datetime-local" class="form-control inputdate" name="dtpkCustomMenu"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class='mb-3 input-group  d-flex align-items-center' id='numberBuild'>
                                Number: &nbsp;
                                <input type="number" class="form-control numberBM" name="numberBuild"/>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-outline-success" id="btnAddtoMenu">
                                <i class="fa fa-check" aria-hidden="true"></i>
                                Add to Menu
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>


    </jsp:body>

</t:main>
