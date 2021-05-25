package Controllers;

import Models.CustomMenuModel;
import Models.UserModel;
import Utilties.ServletUtils;

import at.favre.lib.crypto.bcrypt.BCrypt;
import beans.*;
import com.google.gson.Gson;

import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "AccountServlet", urlPatterns = "/Account/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                postRegister(request, response);
                break;
            case "/Login":
                postLogin(request, response);
                break;
            case "/Logout":
                postLogout(request, response);
                break;
            case "/Update":
                updatePersonInfo(request, response);
                break;
            case "/ChangePassword":
                ChangePassword(request, response);
                break;
            case "/AddImage":
                addImage(request, response);
                break;
            default:
                ServletUtils.redirect("/NotFound", request, response);
                break;
        }

    }
    private void addImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String usernameimage = request.getParameter("usernameimage");
        String test = request.getParameter("test");
        String imagefile = request.getParameter("imagefile");

        String imgurl="";

        for (Part part : request.getParts()) {
            String contentDisp = part.getHeader("content-disposition");
            System.out.println(contentDisp);

            String[] items = contentDisp.split(";");
            for(String s : items){
                String tmp = s.trim();
                if (tmp.startsWith("filename")){
                    int idx = tmp.indexOf('=') + 2;
                    String filename = tmp.substring(idx, tmp.length() - 1);
                    String targetDir = this.getServletContext().getRealPath("Public/Imgs/Avts");
                    String destination = targetDir + "/" + filename;

                    part.write(destination);
                    imgurl ="/Public/Imgs/Avts/"+ filename;

                }
            }
        }

        UserModel.updateImage(test,imgurl);

        Optional<User> useraf = UserModel.findByUserName(test);
        HttpSession session = request.getSession();
        session.setAttribute("auth",true);
        session.setAttribute("authUser",useraf.get());
        ServletUtils.redirect("/Account/Profile", request, response);

    }


    private void ChangePassword(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{

        String curusername = request.getParameter("curusername");
        String curpassword = request.getParameter("curpassword");
        String newpassword = request.getParameter("newpassword");
        String renewpassword = request.getParameter("renewpassword");


        HttpSession session = request.getSession();
        session.getAttribute("auth");
        User u = (User)  session.getAttribute("authUser");
        BCrypt.Result resultlogin = BCrypt.verifyer().verify(curpassword.toCharArray(), u.getPassword());
        if(resultlogin.verified){

            String bcryptHashString = BCrypt.withDefaults().hashToString(12, newpassword.toCharArray());
            UserModel.updatePassword(curusername,bcryptHashString);
            /*Optional<User> useraf = UserModel.findByUserName(curusername);
            session.setAttribute("authUser",useraf.get());*/
            /*postLogout(request,response);
            ServletUtils.redirect("/Account/Login", request, response);*/
            Optional<User> useraf = UserModel.findByUserName(curusername);
            session.setAttribute("auth",true);
            session.setAttribute("authUser",useraf.get());
            postLogout(request,response);
        }
        else {
            System.out.println("ok mat khau khong giong nhau");
            request.setAttribute("hasError",true);
            request.setAttribute("errorMessage","Invalid password");
            ServletUtils.forward("/Views/vwAccount/profilesetting.jsp",request,response);

        }

    }

    private void updatePersonInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String usernameold = request.getParameter("usernameinfo");
        Optional<User> userold = UserModel.findByUserName(usernameold);
        int olduserid = userold.get().getUserID();
        double oldweight = userold.get().getWeight();
        double oldheight = userold.get().getHeight();

        long millis = System.currentTimeMillis();
        java.sql.Date dtnow = new java.sql.Date(millis);



        History history = new History(-1,olduserid,oldweight,oldheight,dtnow);

        System.out.println(history);


        UserModel.addHistorytodb(history);





        String usernameinfo = request.getParameter("usernameinfo");
        String fullnameinfo = request.getParameter("fullnameinfo");
        int ageinfo = Integer.parseInt(request.getParameter("ageinfo"));
        float heightinfo = Float.parseFloat(request.getParameter("heightinfo"));
        float weightinfo = Float.parseFloat(request.getParameter("weightinfo"));

        boolean sexinfo ;
        String sexxinfo =  request.getParameter("sexinfo");
        int check = Integer.parseInt(sexxinfo);

        if(check==0){
            sexinfo=false;
        }
        else {
            sexinfo=true;
        }



        UserModel.update(usernameinfo,fullnameinfo,ageinfo,heightinfo,weightinfo,sexinfo);
        Optional<User> useraf = UserModel.findByUserName(usernameinfo);
        System.out.println(useraf);
        HttpSession session = request.getSession();
        session.setAttribute("auth",true);
        session.setAttribute("authUser",useraf.get());
        ServletUtils.redirect("/Account/Profile", request, response);
    }

    private void postLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = request.getHeader("referer");
        if (url == null) url = "/Home";
        ServletUtils.redirect(url, request, response);

    }

    private void postLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usernamelogin = request.getParameter("emaillogin");
        String passwordlogin = request.getParameter("passwordlogin");

        Optional<User> user = UserModel.findByUserName(usernamelogin);

        if (user.isPresent()) {
            BCrypt.Result resultlogin = BCrypt.verifyer().verify(passwordlogin.toCharArray(), user.get().getPassword());

            if(user.get().isDelete()==true)
            {
                request.setAttribute("hasError",true);
                request.setAttribute("errorMessage","Your account has been disabled");
                ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
            }else {
                if (resultlogin.verified) {

                    HttpSession session = request.getSession();
                    session.setAttribute("auth",true);
                    session.setAttribute("authUser",user.get());

                    String url = (String) session.getAttribute("retUrl");
                    if(url ==null){
                        url = "/Home";
                    }
//                request.setAttribute("userafterlogin",user);
                    ServletUtils.redirect(url,request,response);

                }else {
                    request.setAttribute("hasError",true);
                    request.setAttribute("errorMessage","Invalid password");
                    ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
                }
            }

        }else {
            request.setAttribute("hasError",true);
            request.setAttribute("errorMessage","Invalid login");
            ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
        }
    }

    private void postRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());


        String username = request.getParameter("username");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));

        boolean sex ;
        String sexx =  (request.getParameter("sex"));
        if(sexx=="Female") {
            sex=true;
        }else
            sex=false;

        System.out.println(sex);
        System.out.println(sexx);
        int role=1;
        String urlImage = "/Public/Imgs/Avts/user-alt-512.png";


//        User user = new User(-1,role,age,username,bcryptHashString,name,height,weight,sex,urlImage);

        User user = (User) new ConcreteBuilderUser()
                .buildUID(-1)
                .buildRole(role)
                .buildAge(age)
                .buildUName(username)
                .buildPass(bcryptHashString)
                .buildName(name)
                .buildSex(sex)
                .build();

        System.out.println(user);

        UserModel.add(user);

        ServletUtils.redirect("/Account/Login",request,response);

    }
    private void getMyMenu(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        List<CustomMenu> lstCusMenu = CustomMenuModel.getMenuFromNowByUserID(user.getUserID());
        request.setAttribute("lstCusMenu",lstCusMenu);
        List<CustomMenu> lstDate = CustomMenuModel.getDateFromNowByUserID(user.getUserID());
        request.setAttribute("lstDate",lstDate);
        List<CustomMenu> lstDate2loop = CustomMenuModel.getDateforloopFromNowByUserID(user.getUserID());
        request.setAttribute("lstDate2loop",lstDate2loop);
        System.out.println(lstDate);
        ServletUtils.forward("/Views/vwAccount/MyMenu.jsp",request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null){
            path="/Profile";
        }
        switch (path){

            case "/MyMenu":
                getMyMenu(request,response);
                break;
            case "/History":
                HttpSession session = request.getSession();
                User u = (User)  session.getAttribute("authUser");
                List<History> lst = UserModel.getHistorybyUserId(u.getUserID());

                /*PrintWriter writer  = response.getWriter();
                String ggson = new Gson().toJson(lst);
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                writer.println(ggson);
                writer.flush();*/

                System.out.println(lst);
                request.setAttribute("lsthistory",lst);
                ServletUtils.forward("/Views/vwAccount/history.jsp",request,response);
                break;
            case "/Profile":
                ServletUtils.forward("/Views/vwAccount/profile.jsp",request,response);
                break;
            case "/ProfileSetting":
                ServletUtils.forward("/Views/vwAccount/profilesetting.jsp",request,response);
                break;
            case "/Login":

                request.setAttribute("hasError", false);
                HttpSession session2 = request.getSession();
                boolean auth = (boolean) session2.getAttribute("auth");
                if(auth==true){
                    String url = (String) session2.getAttribute("retUrl");
                    if(url ==null){
                            url = "/Home";
                    }
                    ServletUtils.redirect(url,request,response);
                }
                else
                {
                    ServletUtils.forward("/Views/vwAccount/login.jsp",request,response);
                }



                break;
            case "/Register":

                request.setAttribute("hasError", false);
                HttpSession session3 = request.getSession();
                boolean auth2 = (boolean) session3.getAttribute("auth");
                if(auth2==true){
                    String url = (String) session3.getAttribute("retUrl");
                    if(url ==null){
                        url = "/Home";
                    }
                    ServletUtils.redirect(url,request,response);
                }
                else
                {
                    ServletUtils.forward("/Views/vwAccount/register.jsp",request,response);
                }


                break;
            case "/IsAvailable":
                String username = request.getParameter("user");
                Optional<User> user = UserModel.findByUserName(username);
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                out.print(!user.isPresent());
                out.flush();
                break;
            default:
                ServletUtils.redirect("/NotFound",request,response);
                break;
        }
    }
}
