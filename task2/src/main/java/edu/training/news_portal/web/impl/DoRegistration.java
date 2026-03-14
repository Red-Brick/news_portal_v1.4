package edu.training.news_portal.web.impl;

import edu.training.news_portal.web.Command;
import edu.training.news_portal.beans.RegistrationInfo;
import edu.training.news_portal.service.ServiceException;
import edu.training.news_portal.service.ServiceProvider;
import edu.training.news_portal.service.UserSecurity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DoRegistration implements Command {

    private final UserSecurity userSecurity = ServiceProvider.getInstance().getSecurity();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        System.out.println(email+" "+password+" "+name+" "+surname);


        RegistrationInfo.RegBuilder builder = new RegistrationInfo.RegBuilder();

        builder.email(request.getParameter("email"))
                .password(request.getParameter("password"))
                .name(request.getParameter("name"))
                .surname(request.getParameter("surname"));

        RegistrationInfo regInfo = builder.build();

        try {
            userSecurity.registratin(regInfo);
            response.sendRedirect("Controller?command=page_auth&after_reg=true");
        }catch (ServiceException e){

        }
    }
}
