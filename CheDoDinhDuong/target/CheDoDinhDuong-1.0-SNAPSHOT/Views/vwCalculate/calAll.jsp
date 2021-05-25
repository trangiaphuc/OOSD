<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>


    <jsp:attribute name="js">

    <script>
        $('#frmRegister').on('submit', function (e) {
            e.preventDefault();

            const username = $('#txtUsername').val();
            if (username.length === 0) {
                alert('Invalid username.');
                return;
            }

            const password= $('#txtPassword').val();
            if (password.length === 0) {
                alert('Invalid password.');
                return;
            }
            const fullname= $('#txtFullname').val();
            if (password.length === 0) {
                alert('Invalid Full name.');
                return;
            }
            const age= $('#txtAge').val();
            if (password.length === 0) {
                alert('Invalid Age.');
                return;
            }

            const confirm= $('#txtConfirm').val();
            if (confirm.length === 0) {
                alert('Invalid confirm.');
                return;
            }
            if(password!==confirm){
                return alert("Password is not match!")
            }


            $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?user=' + username, function (data) {
                if (data === true ) {
                    $('#frmRegister').off('submit').submit();
                } else {
                    alert('Not available.');
                    return false;
                }
            });
        });


        $('#txtUsername').select();
    </script>

</jsp:attribute>


    <jsp:body>

        <section class="page-header page-header-xs">
            <div class="container">

                <h1>BMI & Calo Calculation</h1>

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Pages</a></li>
                    <li class="active">BMI & Calo Calculation</li>
                </ol>

            </div>
        </section>
        <!-- /PAGE HEADER -->



        <section>
            <div class="container">

                <div id="portfolio" class="portfolio-gutter">

                    <ul class="nav nav-pills mix-filter mb-60">
                        <li data-filter="all" class="filter active"><a href="${pageContext.request.contextPath}/Calculate/All">All</a></li>
                        <li data-filter="bmi" class="filter  "><a href="${pageContext.request.contextPath}/Calculate/BMI">BMI Calculation</a></li>
                        <li data-filter="calo" class="filter  "><a href="${pageContext.request.contextPath}/Calculate/CALO">Calo Calculation</a></li>

                    </ul>




                </div>
                This is where you can calculate your own body stats.
                Depending on your needs, you can choose from the methods of calculating the index above

            </div>
        </section>
        <!-- / -->



    </jsp:body>
</t:main>