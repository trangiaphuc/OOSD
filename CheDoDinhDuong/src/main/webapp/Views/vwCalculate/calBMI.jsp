<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>


    <jsp:attribute name="js">

    <script>
        $('#frmCalBmi').on('submit', function (e) {
            e.preventDefault();

            const heightbmi = $('#txtHeightbmi').val();
            if (heightbmi.length === 0) {
                alert('Invalid Height.');
                return;
            }

            const weightbmi= $('#txtWeightbmi').val();
            if (weightbmi.length === 0) {
                alert('Invalid Weight.');
                return;
            }

            var result;
            result = weightbmi / ((heightbmi/100)*(heightbmi/100));

            var roundstring = result.toFixed(2);
            var round = Number(roundstring);

            var state;
            if(result < 18.5)
            {
                state = "Thiếu cân";
            }
            else if(result > 18.5 && result < 24.9)
            {
                state = "Bình thường";
            }
            else if(result > 25 && result < 29.9)
            {
                state = "Thừa cân";
            }
            else if(result > 30 && result < 34.9)
            {
                state = "Béo phì";
            }
            else if(result > 35)
            {
                state = "Cực kì béo phì";
            }


            $(document).ready(function() {
                document.getElementById("txtResult").innerHTML  = round + " - " + state;
            });





        });


        $('#txtHeightbmi').select();
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
                        <li data-filter="bmi" class="filter active  "><a href="${pageContext.request.contextPath}/Calculate/BMI">BMI Calculation</a></li>
                        <li data-filter="calo" class="filter  "><a href="${pageContext.request.contextPath}/Calculate/CALO">Calo Calculation</a></li>

                    </ul>




                </div>

<%--               cal bmi--%>
                    <div class="container">

                        <div class="row">

                            <!-- LEFT TEXT -->
                            <div class="col-md-5 offset-md-1">

                                <h2 class="fs-16">IMPORTANT INFORMATION</h2>
                                <p class="text-muted">BMI là chỉ số khối cơ thể (viết tắt: Body Mass Index), được các bác sĩ và chuyên gia sức khỏe dùng để
                                    xác định một người nào đó có bị béo phì, thừa cân hay quá gầy không. Thông thường người ta dùng chỉ số này để tính toán
                                    mức độ béo phì.</p>
                                <p class="text-muted">Công thức tính BMI: = Cân nặng (kg) / (Chiều cao (cm) x Chiều cao cm)).</p>

                            </div>
                            <!-- /LEFT TEXT -->


                            <!-- calculate -->
                            <div class="col-md-4">

                                <h2 class="fs-16">CALCULATE</h2>

                                <!-- calbmi form -->
                                <form id="frmCalBmi" method="#" action="#" autocomplete="off">
                                    <div class="clearfix">

                                        <!-- height -->
                                        <div class="form-group">
                                            <input id="txtHeightbmi" step="0.5" min="0" type="number" name="heightbmi" class="form-control" placeholder="Height (cm)" required="">
                                        </div>

                                        <!-- weight -->
                                        <div class="form-group">
                                            <input id="txtWeightbmi" step="0.5" min="0" type="number" name="weightbmi" class="form-control" placeholder="Weight (kg)" required="">
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 col-sm-6 col-xs-6">



                                        </div>

                                        <div class="col-md-12 col-sm-6 col-xs-6 text-left">

                                            <button type="submit" class="btn btn-primary">Get Result</button>

                                        </div>

                                    </div>

                                </form>

                                <div >
                                    KẾT QUẢ CỦA BẠN:
                                </div>

                                <div class="alert alert-mini alert-success mb-30">
                                    BMI: <strong id="txtResult"></strong>
                                </div>

                            </div>


                        </div>


                    </div>


            </div>
        </section>
        <!-- / -->



    </jsp:body>
</t:main>

