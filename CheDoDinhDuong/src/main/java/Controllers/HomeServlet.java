package Controllers;

import Models.TestDBModel;
import Utilties.ServletUtils;
import beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "HomeServlet", urlPatterns = "/Home/*")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path==null){
            path="/Index";
        }
        switch (path){
            case "/Index":
//                HttpSession session = request.getSession();
//                boolean auth = (boolean) session.getAttribute("auth");
//                User authUser = (User) session.getAttribute("authUser");
//                System.out.println(auth);
//                System.out.println(authUser);

                ServletUtils.forward("/Views/vwHome/home.jsp",request,response);
                break;
            case "/Test":
                ServletUtils.forward("/Views/vwHome/index.jsp",request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
        }
    }
}
