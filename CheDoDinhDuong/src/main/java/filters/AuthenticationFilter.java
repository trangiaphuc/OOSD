package filters;

import Utilties.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter")
public class AuthenticationFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        if (auth == false) {
//             System.out.println(request.getRequestURI());
            session.setAttribute("retUrl", request.getRequestURI());
            ServletUtils.redirect("/Account/Login", request, (HttpServletResponse) resp);
            return;
        }
        else{
            session.setAttribute("retUrl", request.getRequestURI());

        }



        chain.doFilter(req, resp);
    }
}
