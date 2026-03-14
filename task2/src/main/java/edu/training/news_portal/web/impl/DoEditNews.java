package edu.training.news_portal.web.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.beans.NewsBuilder;
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
import java.time.LocalDate;
import java.util.List;

public class DoEditNews implements Command {

    private final NewsService newsService = ServiceProvider.getInstance().getNewsService();


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("Controller?command=page_auth&authError=true");
            return;
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("Controller?command=page_auth&authError=true");
            return;
        }

        String title = request.getParameter("title");
        String brief = request.getParameter("brief");
        String content = request.getParameter("content_path");
        String category = request.getParameter("categoryId");
        String image = request.getParameter("image");
        String status = request.getParameter("status");
        int newsId = Integer.parseInt(request.getParameter("newsId"));

        // Проверяем, что обязательные поля не пустые
        if (title == null || title.trim().isEmpty() ||
                brief == null || brief.trim().isEmpty() ||
                content == null || content.trim().isEmpty()) {
            response.sendRedirect("Controller?command=PAGE_CREATE_NEWS&page=0");
            return;
        }

        News news = new NewsBuilder()
                .setTitle(title.trim())
                .setBrief(brief.trim())
                .setContent(content.trim())
                .setDate(LocalDate.now().toString())
                .setStatus(status.trim())
                .setImage(image.trim())
                .setCategory(category.trim())
                .setCreated_at(LocalDate.now().toString())
                .setUpdate_at(LocalDate.now().toString())
                .setUpdate_at(LocalDate.now().toString())
                .build();

        news.setId(newsId);
        try {
            newsService.editNews(news);
        }catch (ServiceException ex){
            response.sendRedirect("error.jsp");
        }
        response.sendRedirect("Controller?command=page_user_home&page=0");
    }
}