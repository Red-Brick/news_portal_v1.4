package edu.training.news_portal.web.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.service.NewsService;
import edu.training.news_portal.web.Command;
import edu.training.news_portal.beans.User;
import edu.training.news_portal.service.ServiceException;
import edu.training.news_portal.service.ServiceProvider;
import edu.training.news_portal.service.UserSecurity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class DoAuth implements Command {

    private final UserSecurity security = ServiceProvider.getInstance().getSecurity();
    private final NewsService newsService = ServiceProvider.getInstance().getNewsService();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DoAuth");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("email: " + email + " password: " + password);

        User user;
        List<News> listNews;

        try {
            if((user = security.singIn(email,password)) == null ) {
                response.sendRedirect("Controller?command=page_auth&authError=true");
                return;
            }
            HttpSession session = request.getSession(true);
            user = security.infoUser(email);
            session.setAttribute("user",user);
            /*
            listNews = newsService.findByUserId(user.getUserId(),0,4);
            session.setAttribute("listNews",listNews);
            session.setAttribute("page",0);
            System.out.println(user);
            System.out.println(listNews);
            */
            response.sendRedirect("Controller?command=page_user_home&page=0");
            System.out.println("Ok");
        }catch (ServiceException ex){
            response.sendRedirect("error.jsp");
        }




    }
}
