package Controllers;

import Models.ConditionModel;
import Models.CustomMenuModel;
import Models.MenuModel;
import Utilties.ServletUtils;
import beans.Condition;
import beans.CustomMenu;
import beans.SuggestMenu;
import beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MenuServlet", urlPatterns = "/Menu/*")
public class MenuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/SuggestMenu":
                doSuggestMenu(request,response);
                break;

            default:
                ServletUtils.redirect("/NotFound",request,response);
        }

    }

    private void doSuggestMenu(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<Condition> lstCon = ConditionModel.getAllCondition();
        request.setAttribute("lstCon",lstCon);
        String conid = request.getParameter("conid");
        if(conid==null)
            conid="1";
        request.setAttribute("conid",conid);
        List<SuggestMenu> lstMenu1 = MenuModel.getSuggestMenuByDay(conid,"1");
        List<SuggestMenu> lstMenu2 = MenuModel.getSuggestMenuByDay(conid,"2");
        List<SuggestMenu> lstMenu3 = MenuModel.getSuggestMenuByDay(conid,"3");
        List<SuggestMenu> lstMenu4 = MenuModel.getSuggestMenuByDay(conid,"4");
        List<SuggestMenu> lstMenu5 = MenuModel.getSuggestMenuByDay(conid,"5");
        List<SuggestMenu> lstMenu6 = MenuModel.getSuggestMenuByDay(conid,"6");
        List<SuggestMenu> lstMenu7 = MenuModel.getSuggestMenuByDay(conid,"7");
        request.setAttribute("lstMenu1",lstMenu1);
        request.setAttribute("lstMenu2",lstMenu2);
        request.setAttribute("lstMenu3",lstMenu3);
        request.setAttribute("lstMenu4",lstMenu4);
        request.setAttribute("lstMenu5",lstMenu5);
        request.setAttribute("lstMenu6",lstMenu6);
        request.setAttribute("lstMenu7",lstMenu7);
        ServletUtils.forward("/Views/vwMenu/suggestmenu.jsp",request,response);
    }
}
