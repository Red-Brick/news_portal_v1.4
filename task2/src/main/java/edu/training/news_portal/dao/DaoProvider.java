package edu.training.news_portal.dao;

import edu.training.news_portal.dao.impl.DBNewsDao;
import edu.training.news_portal.dao.impl.DBUserDao;

public class DaoProvider {
    private static final DaoProvider instance = new DaoProvider();

    private final NewsDao newsDao = new DBNewsDao();
    private final UserDao userDao = new DBUserDao();

    public DaoProvider() {

    }

    public static DaoProvider getInstance() {
        return instance;
    }

    public NewsDao getNewsDao() {
        return newsDao;
    }

    public UserDao getUserDao() {
        return userDao;
    }
}
