package edu.training.news_portal.web.impl;

import edu.training.news_portal.web.Command;
import edu.training.news_portal.beans.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class PageUserHome implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null){
            response.sendRedirect("Controller?command=page_auth&message=need_auth");
            return;
        }

        User user = (User)session.getAttribute("auth");
        if(user == null){
            response.sendRedirect("Controller?command=page_auth&message=need_auth");
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/pageUserHome.jsp");
        dispatcher.forward(request, response);

    }
}
