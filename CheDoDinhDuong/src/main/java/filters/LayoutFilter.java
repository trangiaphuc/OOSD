package filters;

import Models.CategoryModel;
import beans.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LayoutFilter")
public class LayoutFilter implements Filter{
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        List<Category> listcat = CategoryModel.getAll();
        req.setAttribute("categoriesforcal", listcat);

        chain.doFilter(req, resp);
    }
    public void init(FilterConfig config) throws ServletException {

    }
}
