package edu.training.news_portal.service;

import edu.training.news_portal.service.impl.NewsPortalUserSecurity;
import edu.training.news_portal.service.impl.NewsServiceImpl;

public final class ServiceProvider {
    private static final ServiceProvider instance = new ServiceProvider();

    private final NewsService newsService = new NewsServiceImpl();
    private final UserSecurity security = new NewsPortalUserSecurity();

    private ServiceProvider() {}

    public UserSecurity getSecurity() {
        return security;
    }

    public static ServiceProvider getInstance() {
        return instance;
    }

    public NewsService getNewsService() {
        return newsService;
    }
}
