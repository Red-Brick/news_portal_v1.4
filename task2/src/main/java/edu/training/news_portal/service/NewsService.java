package edu.training.news_portal.service;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.dao.DaoException;

import java.util.List;

public interface NewsService {
    List<News> takeTopNews(int count) throws ServiceException;
    List<News> findByUserId(int userId, int offset, int limit) throws ServiceException;
    void addNews(News news) throws ServiceException;
    void deleteNews(int newsId) throws ServiceException;
    News findNewsId(int newsId) throws ServiceException;
    void editNews(News news) throws ServiceException;
}
