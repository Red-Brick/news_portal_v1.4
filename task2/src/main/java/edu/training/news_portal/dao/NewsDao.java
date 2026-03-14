package edu.training.news_portal.dao;

import edu.training.news_portal.beans.News;

import java.util.List;
import java.util.Optional;

public interface NewsDao {

    List<News> topNews(int count)throws DaoException;
    List<News> findByUserId(int userId, int offset, int limit) throws DaoException;
    void addNews(News news) throws DaoException;
    void deleteNews(int newsId) throws DaoException;
    News findNewsId(int newsId) throws DaoException;
    void editNews(News news) throws DaoException;
    /*
    void updateNews(News news) throws DaoException;
    Optional<News> findById(int id) throws DaoException;
    List<News> findPage(int offset, int limit) throws DaoException;
    */
}
