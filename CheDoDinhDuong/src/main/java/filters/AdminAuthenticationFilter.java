package filters;

import Utilties.ServletUtils;
import beans.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminAuthenticationFilter")
public class AdminAuthenticationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        User user = (User) session.getAttribute("authUser");
        if (auth == false) {
//             System.out.println(request.getRequestURI());
            session.setAttribute("retUrl", request.getRequestURI());
            ServletUtils.redirect("/Account/Login", request, (HttpServletResponse) resp);
            return;
        }
        else{
            if(user.getRole()!=0){
                session.setAttribute("retUrl", request.getRequestURI());
                ServletUtils.redirect("/Home", request, (HttpServletResponse) resp);
                return;
            }
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
