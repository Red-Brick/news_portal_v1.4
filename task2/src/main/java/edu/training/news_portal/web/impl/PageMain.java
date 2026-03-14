package edu.training.news_portal.web.impl;

import edu.training.news_portal.beans.Page;
import edu.training.news_portal.web.Command;
import edu.training.news_portal.beans.News;
import edu.training.news_portal.service.NewsService;
import edu.training.news_portal.service.ServiceException;
import edu.training.news_portal.service.ServiceProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class PageMain implements Command {

    private final NewsService newsService = ServiceProvider.getInstance().getNewsService();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            List<News> newsPage = newsService.takeTopNews(4);
            request.setAttribute("topNews",newsPage);
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
            dispatcher.forward(request,response);
        }catch (ServiceException e){
            throw new ServletException("error");
        }

    }
}
