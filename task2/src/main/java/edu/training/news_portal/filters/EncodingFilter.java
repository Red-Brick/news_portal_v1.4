package edu.training.news_portal.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class EncodingFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        System.out.println("CharacterEncodingFilter before");
        filterChain.doFilter(request, response);
        System.out.println("CharacterEncodingFilter after");
    }
}
