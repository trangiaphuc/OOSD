package Utilties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletUtils {
    public static void forward(String viewPath, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(viewPath);
        rd.forward(request, response);
    }

    public static void redirect(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ctxPath = request.getContextPath();
        int idx = url.indexOf(ctxPath);
        if (idx < 0) {
            response.sendRedirect(request.getContextPath() + url);
        } else {
            response.sendRedirect(url);
        }
    }
}
