package edu.training.news_portal.dao;

public class DaoException extends Exception {
    public DaoException() {
        super();
    }

    public DaoException(Exception ex){
        super(ex);
    }

    public DaoException(String message){
        super(message);
    }
    public DaoException(String message,Exception ex){
        super(message,ex);
    }
}
