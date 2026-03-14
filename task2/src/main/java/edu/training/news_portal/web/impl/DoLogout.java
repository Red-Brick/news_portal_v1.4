package edu.training.news_portal.web.impl;

import edu.training.news_portal.web.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class DoLogout implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Удаляем cookie "remember-me" ПЕРЕД удалением сессии
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("remember-me".equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    cookie.setValue("");
                    response.addCookie(cookie);
                    System.out.println("[DoLogout] Cookie 'remember-me' deleted");
                    break;
                }
            }
        }

        // Удаляем сессию
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("auth");
            session.invalidate();
            System.out.println("[DoLogout] Session invalidated");
        }

        response.sendRedirect("Controller?command=page_main&logout=true");

    }
}