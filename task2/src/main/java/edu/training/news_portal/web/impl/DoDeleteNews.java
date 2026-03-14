package edu.training.news_portal.web.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.beans.User;
import edu.training.news_portal.service.NewsService;
import edu.training.news_portal.service.ServiceException;
import edu.training.news_portal.service.ServiceProvider;
import edu.training.news_portal.web.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class DoDeleteNews implements Command {

    private final NewsService newsService = ServiceProvider.getInstance().getNewsService();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null){
            response.sendRedirect("Controller?command=page_auth&message=need_auth");
            return;
        }
        User user = (User)session.getAttribute("user");
        if(user == null){
            response.sendRedirect("Controller?command=page_auth&message=need_auth");
            return;
        }
        System.out.println(user);
        System.out.println("DoDeleteNews");
        int newsId = Integer.parseInt(request.getParameter("newsId"));

        try {
            newsService.deleteNews(newsId);
        }catch (ServiceException ex){
            response.sendRedirect("error.jsp");
        }

        try {
            request.getRequestDispatcher("WEB-INF/jsp/pageUserHome.jsp").forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("error.jsp");
        }
    }
}