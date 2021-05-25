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

                    //dont und
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "bbbbb";
                        } else {
                            tr[i].style.display = "none";
                        }

                        //end dont und
                    }
                }
            }

            var asc = 0;


            //what is the sort func

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
                        if (asc % 2 == 0) {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        } else {
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

            function sortTableByID(c) {
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
                        x = rows[i].getElementsByTagName("TH")[c];
                        y = rows[i + 1].getElementsByTagName("TH")[c];
                        //check if the two rows should switch place:
                        if (asc % 2 == 0) {
                            if (parseInt(x.innerHTML) > parseInt(y.innerHTML)) {
                                //if so, mark as a switch and break the loop:
                                shouldSwitch = true;
                                break;
                            }
                        } else {
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
        </script>
        <style>
            #myInput {
                width: 50%;
                font-size: 16px;
                padding: 12px 20px 12px 12px;
                border: 1px solid #ddd;
                margin-bottom: 12px;
            }

            .sort:hover {
                cursor: pointer;
            }
        </style>

        <%--        BODY USER--%>

        <section class="page-header page-header-xs">
            <div class="container">
                <h1>ADMIN PAGE</h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/Admin">Admin page</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/FoodManagement">Food</a></li>
                    <li><a href="${pageContext.request.contextPath}/Admin/MenuManagement?conid=1">Menu</a></li>
                    <li class="active">User</li>
                </ol>
            </div>
        </section>
        <form method="post">
            <div class="container">
                <div class="row m-30">
                    <div class="col">
                        <div class="text-center">
                            <h2 class="tt">USERS MANAGEMENT</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div style="font-size: 25px; padding: 5px 10px 5px 5px"><i class="fa fa-search"
                                                                               aria-hidden="true"></i></div>
                    <input type="text" id="myInput" onkeyup="searchFood()" placeholder="Search for usernames.."
                           title="Type in a name">
                </div>

                <div class="row mb-50" style="overflow: auto; height: 550px">
                    <table class="table mb-0" id="myTable">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" onclick="sortTableByID(0)" class="sort">#</th>
                            <th scope="col">Tài khoản <i onclick="sortTableByName(0)" class="fa fa-sort sort"
                                                        aria-hidden="true"></i></th>
                            <th scope="col">Họ và tên <i onclick="sortTableByName(1)" class="fa fa-sort sort"
                                                        aria-hidden="true"></i></th>
                            <th scope="col">Tuổi <i onclick="sortTableByID(1)" class="fa fa-sort sort"
                                                    aria-hidden="true"></i></th>
                            <th scope="col">Giới tính <i onclick="sortTableByName(2)" class="fa fa-sort sort"
                                                         aria-hidden="true"></i></th>
                            <th scope="col">Trạng thái <i onclick="sortTableByName(3)" class="fa fa-sort sort"
                                                          aria-hidden="true"></i></th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="u" items="${lstUsers}">
                            <tr>
                                <th scope="row">${u.getUserID()}</th>
                                <td>${u.getUserName()}</td>
                                <td>${u.getFullName()}</td>
                                <th scope="row">${u.getAge()}</th>

                                <c:choose>
                                    <c:when test="${u.isSex()==false}">
                                        <td style="color: blue"><i class="fa fa-user" aria-hidden="true"> Male</i></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td style="color: plum"><i class="fa fa-user" aria-hidden="true"> Female</i></td>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${u.isDelete()==true}">
                                        <td>
                                            Blocked
                                        </td>
                                        <th scope="row">
                                            <button type="submit" class="btn btn-outline-success pr-6 btnActive"
                                                    formaction="${pageContext.request.contextPath}/Admin/ActiveUnActive?username=${u.getUserName()}">
                                                Active
                                            </button>
                                        </th>
                                    </c:when>
                                    <c:otherwise>
                                        <td>
                                            Activating
                                        </td>
                                        <th scope="row">
                                            <button type="submit" class="btn btn-outline-danger btnBlock" style="padding-right: 10px"
                                                    formaction="${pageContext.request.contextPath}/Admin/ActiveUnActive?username=${u.getUserName()}">
                                                Block
                                            </button>
                                        </th>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
        <script>
            $('.btnBlock').click(function (e) {
                if (confirm('Bạn có chắc chắn đình chỉ tài khoản này?')) {

                } else {
                    e.preventDefault();
                }
            })
            $('.btnActive').click(function (e) {
                if (confirm('Bạn có chắc chắn kích hoạt tài khoản này?')) {

                } else {
                    e.preventDefault();
                }
            })
        </script>
    </jsp:body>
</t:main>