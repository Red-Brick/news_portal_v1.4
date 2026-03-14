package edu.training.news_portal.filters;

import edu.training.news_portal.beans.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String path = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        // Пропускаем статические ресурсы и JSP файлы
        if (path.endsWith(".jsp") || path.endsWith(".css") || path.endsWith(".js") ||
                path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".gif") ||
                path.endsWith(".ico") || path.endsWith(".woff") || path.endsWith(".woff2") ||
                path.startsWith(contextPath + "/WEB-INF/")) {
            filterChain.doFilter(request, response);
            return;
        }

        // Если запрос к корневому пути, перенаправляем на главную страницу
        if (path.equals(contextPath + "/") || path.equals(contextPath)) {
            httpResponse.sendRedirect(contextPath + "/Controller?command=page_main");
            return;
        }

        String command = httpRequest.getParameter("command");
        HttpSession session = httpRequest.getSession(false);

        User user = (session != null) ? (User) session.getAttribute("auth") : null;

        boolean isPublic = (command == null) || SecurityFilterConfig.PUBLIC_COMMANDS.contains(command.toUpperCase());

        if (!isPublic && user == null) {

            httpResponse.sendRedirect("Controller?command=page_auth&after_reg=true");
            return;
        }

        filterChain.doFilter(request, response);
    }
}
