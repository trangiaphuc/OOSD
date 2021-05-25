<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>


    <jsp:attribute name="js">

    <script>
        $('#frmCalCalo').on('submit', function (e) {
            e.preventDefault();

            const heightcalo = $('#txtHeightcalo').val();
            if (heightcalo.length === 0) {
                alert('Invalid Height.');
                return;
            }

            const weightcalo= $('#txtWeightcalo').val();
            if (weightcalo.length === 0) {
                alert('Invalid Weight.');
                return;
            }
            const agecalo= $('#txtAgecalo').val();
            if (agecalo.length === 0) {
                alert('Invalid Age.');
                return;
            }
            const sexcalo = $('#txtSexcalo').val();
            if (sexcalo.length === 0) {
                alert('Invalid Sex.');
                return;
            }
            const workcalo= $('#txtWorkcalo').val();
            if (workcalo.length === 0) {
                alert('Invalid Work.');
                return;
            }

            var resultnam;
            resultnam = ((10*weightcalo)+(6.25*(heightcalo))-(5*agecalo) + 5) ;
            var resultnu;
            resultnu = ((10*weightcalo)+(6.25*(heightcalo))-(5*agecalo) - 161) ;
            var statecalo;
            statecalo = "Calo/Ngày"

            if(sexcalo == 0){

                switch (workcalo){
                    case "0":
                        resultnam = resultnam * 1.2;
                        var roundstringcalo = resultnam.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function() {
                            document.getElementById("txtResultcalo").innerHTML  = roundcalo + "  " + statecalo;
                        });
                        break;
                    case "1":
                        resultnam = resultnam * 1.3;
                        var roundstringcalo = resultnam.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function() {
                            document.getElementById("txtResultcalo").innerHTML  = roundcalo + "  " + statecalo;
                        });
                        break;
                    case "2":
                        resultnam = resultnam * 1.4;
                        var roundstringcalo = resultnam.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function() {
                            document.getElementById("txtResultcalo").innerHTML  = roundcalo + "  " + statecalo;
                        });
                        break;
                    case "3":
                        resultnam = resultnam * 1.5;
                        var roundstringcalo = resultnam.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function() {
                            document.getElementById("txtResultcalo").innerHTML  = roundcalo + "  " + statecalo;
                        });
                        break;

                }
            }
            else {
                switch (workcalo) {
                    case "0":
                        resultnu = resultnu * 1.2;
                        var roundstringcalo = resultnu.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function () {
                            document.getElementById("txtResultcalo").innerHTML = roundcalo + "  " + statecalo;
                        });
                        break;
                    case "1":
                        resultnu = resultnu * 1.3;
                        var roundstringcalo = resultnu.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function () {
                            document.getElementById("txtResultcalo").innerHTML = roundcalo + "  " + statecalo;
                        });
                        break;
                    case "2":
                        resultnu = resultnu * 1.4;
                        var roundstringcalo = resultnu.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function () {
                            document.getElementById("txtResultcalo").innerHTML = roundcalo + "  " + statecalo;
                        });
                        break;
                    case "3":
                        resultnu = resultnu * 1.5;
                        var roundstringcalo = resultnu.toFixed(2);
                        var roundcalo = Number(roundstringcalo);
                        $(document).ready(function () {
                            document.getElementById("txtResultcalo").innerHTML = roundcalo + "  " + statecalo;
                        });
                        break;
                }

            }



        });


        $('#txtHeightcalo').select();
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
                        <li data-filter="calo" class="filter active  "><a href="${pageContext.request.contextPath}/Calculate/CALO">Calo Calculation</a></li>

                    </ul>




                </div>


                    <%-- cal calo--%>
                <div class="container">

                    <div class="row">

                        <!-- LEFT TEXT -->
                        <div class="col-md-5 offset-md-1">

                            <h2 class="fs-16">IMPORTANT INFORMATION</h2>
                            <p class="text-muted">Calories là đơn vị nhằm để xác định năng lượng chứa trong thực phẩm và đồ uống
                                ta tiêu thị hằng ngày. Calories được đốt cháy để chuyển hóa thành năng lượng phục vụ các nhu cầu
                                hoạt động của cơ thể, nếu dung nạp vượt quá nhu cầu, nó sẽ được dự trữ và tích tụ trong cơ thể dưới
                                dạng chất béo và chuyển hóa thành mỡ. 7700 Calories tương ứng với một kg mỡ.</p>

                            <p class="text-muted">Công thức tính Calo nam: = ((10 * Cân nặng (kg)) + (6.25 * Chiều cao (cm)) - (5 * Tuổi (năm)) + 5) * Hoạt động (120-150%) .</p>
                            <p class="text-muted">Công thức tính Calo cho nữ: = ((10 * Cân nặng (kg)) + (6.25 * Chiều cao (cm)) - (5 * Tuổi (năm)) - 161) * Hoạt động (120-150%) .</p>


                        </div>
                        <!-- /LEFT TEXT -->


                        <!-- calculate -->
                        <div class="col-md-4">

                            <h2 class="fs-16">CALCULATE</h2>

                            <!-- calbmi form -->
                            <form id="frmCalCalo" method="#" action="#" autocomplete="off">
                                <div class="clearfix">

                                    <!-- height -->
                                    <div class="form-group">
                                        <input  id="txtHeightcalo" step="0.5" min="0" type="number" name="heightcalo" class="form-control" placeholder="Height (cm)" required="">
                                    </div>

                                    <!-- weight -->
                                    <div class="form-group">
                                        <input id="txtWeightcalo" step="0.5" min="0" type="number" name="weightcalo" class="form-control" placeholder="Weight (kg)" required="">
                                    </div>
                                    <!-- age -->
                                    <div class="form-group">
                                        <input id="txtAgecalo" type="number" name="agecalo" class="form-control" placeholder="Age" required="">
                                    </div>

                                    <div class="form-group">
                                        <select id="txtSexcalo" class="col-md-12"  name="sexcalo">
                                            <option value="-1" selected disabled>Gender</option>
                                            <option value="0">Male</option>
                                            <option value="1">Female</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <select id="txtWorkcalo" class="col-md-12" name="workcalo">
                                            <option value="-1" selected disabled>Work</option>
                                            <option value="0">Vận động ít</option>
                                            <option value="1">Vận động nhẹ</option>
                                            <option value="2">Vận động trung bình</option>
                                            <option value="3">Vận động nặng</option>

                                        </select>
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

                            <div>
                                KẾT QUẢ CỦA BẠN:
                            </div>

                            <div class="alert alert-mini alert-success mb-30">
                                Nhu cầu năng lượng: <strong id="txtResultcalo"></strong>
                            </div>

                        </div>


                    </div>


                </div>

            </div>
        </section>
        <!-- / -->



    </jsp:body>
</t:main>