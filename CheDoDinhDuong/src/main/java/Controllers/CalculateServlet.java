package Controllers;

import Models.UserModel;
import Utilties.ServletUtils;
import beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

@WebServlet(name = "CalculateServlet", urlPatterns = "/Calculate/*")
public class CalculateServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path==null){
            path="/Index";
        }
        switch (path){
            case "/All":
                ServletUtils.forward("/Views/vwCalculate/calAll.jsp",request,response);
                break;
            case "/BMI":
                ServletUtils.forward("/Views/vwCalculate/calBMI.jsp",request,response);
                break;
            case "/CALO":
                ServletUtils.forward("/Views/vwCalculate/calCALO.jsp",request,response);
                break;

            default:
                ServletUtils.redirect("/NotFound",request,response);
        }
    }

}
