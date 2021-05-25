<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<t:main>
    <jsp:body>
        <script>
            function searchFood() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
            var asc = 0;
            function sortTableByName(c) {
                var table, rows, switching, i, x, y, shouldSwitch;
                asc = asc + 1;
                table = document.getElementById("myTable");
                switching = true;
                /*Make a loop that will continue until
                no switching has been done:*/
                while (switching) {
                    //start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /*Loop through all table rows (except the
                    first, which contains table headers):*/
                    for (i = 1; i < (rows.length - 1); i++) {
                        //start by saying there should be no switching:
                        shouldSwitch = false;
                        /*Get the two elements you want to compare,
                        one from current row and one from the next:*/
                        x = rows[i].getElementsByTagName("TD")[c];
                        y = rows[i + 1].getElementsByTagName("TD")[c];
                        //check if the two rows should switch place:
                        if(asc % 2 == 0){
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }
                        else
                        {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }

                    }
                    if (shouldSwitch) {
                        /*If a switch has been marked, make the switch
                        and mark that a switch has been done:*/
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }

                }
            }
            function sortTableByID(){
                var table, rows, switching, i, x, y, shouldSwitch;
                asc = asc + 1;
                table = document.getElementById("myTable");
                switching = true;
                /*Make a loop that will continue until
                no switching has been done:*/
                while (switching) {
                    //start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /*Loop through all table rows (except the
                    first, which contains table headers):*/
                    for (i = 1; i < (rows.length - 1); i++) {
                        //start by saying there should be no switching:
                        shouldSwitch = false;
                        /*Get the two elements you want to compare,
                        one from current row and one from the next:*/
                        x = rows[i].getElementsByTagName("TH")[0];
                        y = rows[i + 1].getElementsByTagName("TH")[0];
                        //check if the two rows should switch place:
                        if(asc % 2 == 0){
                            if (parseInt(x.innerHTML) > parseInt(y.innerHTML)) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }
                        else
                        {
                            if (parseInt(x.innerHTML) < parseInt(y.innerHTML)) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        }

                    }
                    if (shouldSwitch) {
                        /*If a switch has been marked, make the switch
                        and mark that a switch has been done:*/
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }

                }
            }
            function readURL(input) {
                if (input.files && input.files[0]) {

                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.image-upload-wrap').hide();

                        $('.file-upload-image').attr('src', e.target.result);
                        $('.file-upload-content').show();

                        $('.image-title').html(input.files[0].name);
                    };

                    reader.readAsDataURL(input.files[0]);

                } else {
                    removeUpload();
                }
            }
            function removeUpload() {
                $('.file-upload-input').replaceWith($('.file-upload-input').clone());
                $('.file-upload-content').hide();
                $('.image-upload-wrap').show();
            }
            $('.image-upload-wrap').bind('dragover', function () {
                $('.image-upload-wrap').addClass('image-dropping');
            });
            $('.image-upload-wrap').bind('dragleave', function () {
                $('.image-upload-wrap').removeClass('image-dropping');
            });

        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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
            .file-upload {
                background-color: #ffffff;
                width: 600px;
                margin: 0 auto;
                padding: 20px;
            }

            .file-upload-btn {
                width: 100%;
                margin: 0;
                color: #fff;
                background: #1FB264;
                border: none;
                padding: 10px;
                border-radius: 4px;
                border-bottom: 4px solid #15824B;
                transition: all .2s ease;
                outline: none;
                text-transform: uppercase;
                font-weight: 700;
            }

            .file-upload-btn:hover {
                background: #1AA059;
                color: #ffffff;
                transition: all .2s ease;
                cursor: pointer;
            }

            .file-upload-btn:active {
                border: 0;
                transition: all .2s ease;
            }

            .file-upload-content {
                display: none;
                text-align: center;
            }

            .file-upload-input {
                position: absolute;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                outline: none;
                opacity: 0;
                cursor: pointer;
            }

            .image-upload-wrap {
                margin-top: 20px;
                border: 4px dashed #1FB264;
                position: relative;
            }

            .image-dropping,
            .image-upload-wrap:hover {
                background-color: #1FB264;
                border: 4px dashed #ffffff;
            }

            .image-title-wrap {
                padding: 0 15px 15px 15px;
                color: #222;
            }

            .drag-text {
                text-align: center;
            }

            .drag-text h3 {
                font-weight: 100;
                text-transform: uppercase;
                color: #15824B;
                padding: 60px 0;
            }

            .file-upload-image {
                max-height: 200px;
                max-width: 200px;
                margin: auto;
                padding: 20px;
            }

            .remove-image {
                width: 200px;
                margin: 0;
                color: #fff;
                background: #cd4535;
                border: none;
                padding: 10px;
                border-radius: 4px;
                border-bottom: 4px solid #b02818;
                transition: all .2s ease;
                outline: none;
                text-transform: uppercase;
                font-weight: 700;
            }

            .remove-image:hover {
                background: #c13b2a;
                color: #ffffff;
                transition: all .2s ease;
                cursor: pointer;
            }

            .remove-image:active {
                border: 0;
                transition: all .2s ease;
            }

            #myInput {
                width: 50%;
                font-size: 16px;
                padding: 12px 20px 12px 12px;
                border: 1px solid #ddd;
                margin-bottom: 12px;
            }

            .sort:hover{
                cursor: pointer;
            }
        </style>
        <section class="page-header page-header-xs">
            <div class="container">

                <h1>ADMIN PAGE</h1>

                <!-- breadcrumbs -->
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/Admin">Admin page</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/FoodManagement">Food</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1">Menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/UserManagement">User</a></li>
                </ol><!-- /breadcrumbs -->

            </div>
        </section>
        <form method="post" enctype="multipart/form-data">
            <div class="container">
                <div class="row m-30">
                    <div class="col">
                        <div class="text-center">
                            <h2 class="tt">RECYCLER BIN</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div style="font-size: 25px; padding: 5px 10px 5px 5px"><i class="fa fa-search" aria-hidden="true"></i></div><input type="text" id="myInput" onkeyup="searchFood()" placeholder="Search for names.." title="Type in a name">
                </div>
                <div class="row mb-50" style="overflow: auto; height: 550px">
                    <table class="table mb-0" id="myTable">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" onclick="sortTableByID()" class="sort">#</th>
                            <th scope="col">Thức ăn <i onclick="sortTableByName(0)" class="fa fa-sort sort" aria-hidden="true"></i></th>
                            <th scope="col">Thể loại <i onclick="sortTableByName(1)" class="fa fa-sort sort" aria-hidden="true"></i></th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="f" items="${lstFood}">
                            <c:if test="${f.isDelete()==true}">
                                <tr>
                                    <th scope="row">${f.getFoodID()}</th>
                                    <td>${f.getFoodName()}</td>
                                    <td>${f.getCatName()}</td>
                                    <td>
                                        <button type="submit" class="btn btn-outline-success pr-6 btnRestore"
                                                formaction="${pageContext.request.contextPath}/Admin/Restore?id=${f.getFoodID()}">
                                            <i class="fa fa-recycle" aria-hidden="true"></i>
                                        </button>
                                        <button type="submit" class="btn btn-outline-danger pr-6 btndelete"
                                                formaction="${pageContext.request.contextPath}/Admin/DeleteFoodRB?id=${f.getFoodID()}">
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
        </form>
        <script>
            $('.btndelete').click(function (e) {
                if (confirm('Bạn có chắc chắn xóa?')) {

                } else {
                    e.preventDefault();
                }
            })
        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.css">
    </jsp:body>
</t:main>