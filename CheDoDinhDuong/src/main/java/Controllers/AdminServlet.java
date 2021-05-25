package Controllers;

import Models.*;
import Utilties.ServletUtils;
import beans.*;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;
import template.TemplateMethodModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "AdminServlet", urlPatterns = "/Admin/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String path = request.getPathInfo();
        switch (path){
            case "/AddFood":
                addNewFood(request,response);
                break;
            case "/DeleteFood":
                deleteFood(request,response);
                break;
            case "/EditFood":
                editFood(request,response);
                break;
            case "/AddIngre":
                addNewIngre(request,response);
                break;
            case "/AddMenu":
                addNewMenu(request,response);
                break;
            case "/DeleteMenu":
                deleteMenu(request,response);
                break;
            case "/EditDetailsMenu":
                editDetailsMenu(request,response);
                break;
            case "/ActiveUnActive":
                doActiveUnactive(request,response);
                break;
            case "/Restore":
                doRestore(request,response);
                break;
            case "/DeleteFoodRB":
                doDeleteFoodRB(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }

    private void addNewFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String foodName = request.getParameter("foodname");
        String catname = request.getParameter("catname");
        String glucozo = request.getParameter("glucozo");
        String kcal = request.getParameter("kcal");
        String lipit = request.getParameter("lipit");
        String protein = request.getParameter("protein");
        String vitaminA = request.getParameter("vitaminA");
        String vitaminB = request.getParameter("vitaminB");
        String vitaminC = request.getParameter("vitaminC");
        String vitaminD = request.getParameter("vitaminD");
        String vitaminE = request.getParameter("vitaminE");
        String kali = request.getParameter("kali");
        String fe = request.getParameter("fe");
        String natri = request.getParameter("natri");
//        System.out.println(CategoryModel.getCatIDByCatName(catname));
//        System.out.println(catname);
        String imgurl="";
        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            //System.out.println(contentDisp);
            String[] items = contentDisp.split(";");
            for(String s : items){
                String tmp = s.trim();
                if (tmp.startsWith("filename")){
                    int idx = tmp.indexOf('=') + 2;
                    String filename = tmp.substring(idx, tmp.length() - 1);
                    String targetDir = this.getServletContext().getRealPath("Public/Imgs/Food");
                    String destination = targetDir + "/" + filename;
//                    System.out.println(destination);
                    part.write(destination);
                    imgurl ="/Public/Imgs/Food/"+ filename;
                }
            }
        }
//        String a= request.getContextPath();
////        System.out.println(a);
//        FoodModel.addNewFood(foodName, CategoryModel.getCatIDByCatName(catname),glucozo,kcal,lipit,protein,
//                vitaminA,vitaminB,vitaminC,vitaminD,vitaminE,kali,fe,natri,imgurl);
//
        TemplateMethodModel templateMethodModel = new CategoryModel();


        FoodModel.addNewFood(foodName, templateMethodModel.executeQ(catname),glucozo,kcal,lipit,protein,
                vitaminA,vitaminB,vitaminC,vitaminD,vitaminE,kali,fe,natri,imgurl);
        ServletUtils.redirect("/Admin/FoodManagement",request,response);
    }

    private void deleteFood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        FoodModel.deleteFood(foodID);
        ServletUtils.redirect("/Admin/FoodManagement",request,response);
    }

    private void editFood(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        String foodName = request.getParameter("foodname");
        String catname = request.getParameter("catname");
        String glucozo = request.getParameter("glucozo");
        String kcal = request.getParameter("kcal");
        String lipit = request.getParameter("lipit");
        String protein = request.getParameter("protein");
        String vitaminA = request.getParameter("vitaminA");
        String vitaminB = request.getParameter("vitaminB");
        String vitaminC = request.getParameter("vitaminC");
        String vitaminD = request.getParameter("vitaminD");
        String vitaminE = request.getParameter("vitaminE");
        String kali = request.getParameter("kali");
        String fe = request.getParameter("fe");
        String natri = request.getParameter("natri");
        String imgurl = request.getParameter("urlimg");
        FoodModel.updateFood(foodID,foodName,CategoryModel.getCatIDByCatName(catname),glucozo,kcal,lipit,protein,
                vitaminA,vitaminB,vitaminC,vitaminD,vitaminE,kali,fe,natri,imgurl);
        ServletUtils.redirect("/Admin/FoodManagement",request,response);
    }

    private void addNewIngre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        String ingre = request.getParameter("ingre");
        String gram = request.getParameter("gram");
        IngredientModel.addNewIngre(foodID,ingre,gram);
        ServletUtils.redirect("/Admin/EditFood?id="+foodID,request,response);
    }

    private void addNewMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sesstion = request.getParameter("session");
        String conid = request.getParameter("conid");
        String day = request.getParameter("day");
        String number =request.getParameter("number");
        String foodid = request.getParameter("food");
        int fid = Integer.parseInt(foodid);
        Optional<Food> c = FoodModel.findByID(fid);
        MenuModel.addNewSuggestMenu(conid,day,c.get().getFoodName(),number,sesstion);
        final String url = "/Admin/EditMenu?conid="+conid+"&day="+day;
        ServletUtils.redirect(url,request,response);
    }

    private void deleteMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String conid = request.getParameter("conid");
        String day = request.getParameter("day");
        String id = request.getParameter("id");
        MenuModel.deleteSuggestMenuByID(id);
        final String url = "/Admin/EditMenu?conid="+conid+"&day="+day;
        ServletUtils.redirect(url,request,response);
    }

    private void editDetailsMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String foodID = request.getParameter("food");
        String number = request.getParameter("number");
        String foodname = FoodModel.getFoodNameByID(foodID);
        MenuModel.updateSuggestMenu(foodname,number,id);
        ServletUtils.redirect("/Admin/EditDetailsMenu?id="+id,request,response);
    }

    private void doActiveUnactive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        UserModel.delete_activeUser(username);
        ServletUtils.redirect("/Admin/UserManagement",request,response);
    }

    private void doDeleteFoodRB(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        FoodModel.deleteFoodRB(foodID);
        ServletUtils.redirect("/Admin/RecycleBin",request,response);
    }

    private void doRestore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodID = request.getParameter("id");
        FoodModel.restoreFood(foodID);
        ServletUtils.redirect("/Admin/RecycleBin",request,response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path==null){
            path="/Home";
        }
        switch (path){
            case "/Home":
                ServletUtils.forward("/Views/vwAdmin/index.jsp",request,response);
                break;
            case "/FoodManagement":
                List<Food> lstFood = FoodModel.getAll();
                request.setAttribute("lstFood", lstFood);
                List<Category> lstCat = CategoryModel.getAll();
                request.setAttribute("lstCat", lstCat);
                ServletUtils.forward("/Views/vwAdmin/foodmanagement.jsp",request,response);
                break;
            case "/RecycleBin":
                List<Food> lstFoodDelete = FoodModel.getAll();
                request.setAttribute("lstFood", lstFoodDelete);
                List<Category> lstCategory = CategoryModel.getAll();
                request.setAttribute("lstCat", lstCategory);
                ServletUtils.forward("/Views/vwAdmin/recyclebin.jsp",request,response);
                break;
            case "/MenuManagement":
                doMenuManagement(request,response);
                break;
            case "/EditMenu":
                doEditMenu(request,response);
                break;
            case "/EditFood":
                List<Category> listCat = CategoryModel.getAll();
                int foodID = Integer.parseInt(request.getParameter("id"));
                List<Ingredient> ingredientList = IngredientModel.findIngredientByFoodID(foodID);
                Optional<Food> c = FoodModel.findByID(foodID);
                if (c.isPresent()) {
                    request.setAttribute("lstCat",listCat);
                    request.setAttribute("food", c.get());
                    request.setAttribute("ingredientoffood",ingredientList);
                    ServletUtils.forward("/Views/vwAdmin/editfood.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/MenuManagement", request, response);
                }
                break;
            case "/NewFood":
                ServletUtils.forward("/Views/vwAdmin/newfood.jsp",request,response);
                break;
            case "/CheckValidIngre":
                String fID = request.getParameter("foodid");
                String ingreID = request.getParameter("ingreid");
                System.out.println("ingre:" + ingreID);
                List<Ingredient> lstIngre = IngredientModel.checkIngredient(fID, ingreID);
                PrintWriter out = response.getWriter();
                String isExist = new Gson().toJson(false);
                if(lstIngre.size()!=0){
                    isExist = new Gson().toJson(true);
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.println(isExist);
                out.flush();
                break;
            case "/EditDetailsMenu":
                doEditDetailsMenu(request,response);
                break;
            case"/UserManagement":
                doUserManagement(request,response);
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }

    private void doMenuManagement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        ServletUtils.forward("/Views/vwAdmin/menumanagement.jsp",request,response);
    }

    private void doEditMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCat = CategoryModel.getAll();
        request.setAttribute("lstCat",listCat);
        String conid = request.getParameter("conid");
        String day = request.getParameter("day");
        List<SuggestMenu> lstMenu = MenuModel.getSuggestMenuByDay(conid,day);
        String conName = ConditionModel.getConditionNameByConID(conid);
        request.setAttribute("conid",conid);
        request.setAttribute("conditionName",conName);
        request.setAttribute("day",day);
        request.setAttribute("lstMenu",lstMenu);
        ServletUtils.forward("/Views/vwAdmin/editmenu.jsp",request,response);
    }

    private void doEditDetailsMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCat = CategoryModel.getAll();
        request.setAttribute("lstCat",listCat);
        String id = request.getParameter("id");
        Optional<SuggestMenu> m = MenuModel.getSuggestMenuByID(id);
        if (m.isPresent()) {
            request.setAttribute("menu",m.get());
            String conditon = ConditionModel.getConditionNameByConID(String.valueOf(m.get().getConID()));
            request.setAttribute("conditionName",conditon);
            request.setAttribute("day",m.get().getDayofweek());
            switch (m.get().getSession()){
                case "1":
                    request.setAttribute("session","Bữa sáng");
                    break;
                case "2":
                    request.setAttribute("session","Bữa trưa");
                    break;
                case "3":
                    request.setAttribute("session","Bữa phụ");
                    break;
                default:
                    request.setAttribute("session","Bữa tối");
                    break;
            }
            ServletUtils.forward("/Views/vwAdmin/editdetailsmenu.jsp",request,response);
        }
        else{
            ServletUtils.redirect("/Admin/MenuManagement", request, response);
        }
    }

    private void doUserManagement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<User> lstUsers = UserModel.getAllUser();
        request.setAttribute("lstUsers",lstUsers);
        ServletUtils.forward("/Views/vwAdmin/usermanagement.jsp",request,response);
    }

}
