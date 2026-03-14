package edu.training.news_portal.web.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.beans.User;
import edu.training.news_portal.service.NewsService;
import edu.training.news_portal.service.ServiceProvider;
import edu.training.news_portal.web.Command;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

import edu.training.news_portal.web.Command;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class PageEditNews implements Command {
    private final NewsService newsService = ServiceProvider.getInstance().getNewsService();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session == null){
            response.sendRedirect("Controller?command=page_auth&message=need_auth");
            return;
        }
        User user = (User)session.getAttribute("user");
        if(user == null){
            response.sendRedirect("Controller?command=page_auth&message=need_auth");
            return;
        }
        int newsId = Integer.parseInt(request.getParameter("newsId"));

        News news;
        System.out.println("PageEditNews");

        try {
            //System.out.println(newsService.findNewsId(newsId));
            news = newsService.findNewsId(newsId);
            session.setAttribute("news",news);
            System.out.println(news);
            request.getRequestDispatcher("WEB-INF/jsp/pageEditNews.jsp").forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("error.jsp");
        }
    }
}
