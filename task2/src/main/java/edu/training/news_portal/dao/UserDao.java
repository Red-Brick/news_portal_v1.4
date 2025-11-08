package edu.training.news_portal.dao;

import edu.training.news_portal.beans.RegistrationInfo;
import edu.training.news_portal.beans.User;

public interface UserDao {

    User checkCredentials(String login, String password) throws DaoException;
    boolean registration(RegistrationInfo info) throws DaoException;
}
