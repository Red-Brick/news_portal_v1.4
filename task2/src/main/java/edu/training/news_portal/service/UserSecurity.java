package edu.training.news_portal.service;

import edu.training.news_portal.beans.RegistrationInfo;
import edu.training.news_portal.beans.User;

public interface UserSecurity {

    User singIn(String email, String password) throws ServiceException;

    boolean registratin(RegistrationInfo info) throws ServiceException;
}
