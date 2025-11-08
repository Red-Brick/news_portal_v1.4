package edu.training.news_portal.service.impl;

import edu.training.news_portal.beans.RegistrationInfo;
import edu.training.news_portal.beans.User;
import edu.training.news_portal.dao.DaoException;
import edu.training.news_portal.dao.DaoProvider;
import edu.training.news_portal.dao.UserDao;
import edu.training.news_portal.service.ServiceException;
import edu.training.news_portal.service.UserSecurity;

public class NewsPortalUserSecurity implements UserSecurity {

    private final UserDao userDao = DaoProvider.getInstance().getUserDao();

    @Override
    public User singIn(String email, String password) throws ServiceException {
        try {
            return userDao.checkCredentials(email,password);
        }catch (DaoException e){
            throw new ServiceException(e);
        }
    }

    @Override
    public boolean registratin(RegistrationInfo info) throws ServiceException {
        // валидация параметров
        try {
            return userDao.registration(info);
        }catch (DaoException e){
            throw new ServiceException(e);
        }
    }
}
