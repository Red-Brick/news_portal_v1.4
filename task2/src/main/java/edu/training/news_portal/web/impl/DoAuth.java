package edu.training.news_portal.web.impl;

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

public class DoAuth implements Command {

    private final UserSecurity security = ServiceProvider.getInstance().getSecurity();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DoAuth");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("email: " + email + " password: " + password);

        User user;

        try {
            if((user = security.singIn(email,password)) == null ) {
                response.sendRedirect("Controller?command=page_auth&authError=true");
                return;
            }
            HttpSession session = request.getSession(true);
            session.setAttribute("auth",user);
            session.setAttribute("userName",user.getName());
            response.sendRedirect("Controller?command=page_user_home&name="+user.getName());
            System.out.println("Ok");
        }catch (ServiceException ex){
            response.sendRedirect("error.jsp");
        }




    }
}
