package edu.training.news_portal.web.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.service.NewsService;
import edu.training.news_portal.service.ServiceException;
import edu.training.news_portal.service.ServiceProvider;
import edu.training.news_portal.web.Command;
import edu.training.news_portal.beans.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class PageUserHome implements Command {
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


            System.out.println("pageUserHome");
            List<News> listNews;

            try {
                Integer page = Integer.parseInt(request.getParameter("page"));

                // Проверяем на null и используем значение по умолчанию
                if (page == null) {
                    page = 0; // значение по умолчанию
                }

                // Используем значение page
                System.out.println("Текущая страница: " + page);

                listNews = newsService.findByUserId(user.getUserId(),page,4);
                session.setAttribute("listNews",listNews);
                session.setAttribute("page",page);
                System.out.println(listNews);
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
