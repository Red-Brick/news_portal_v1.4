package edu.training.news_portal.service.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.dao.DaoException;
import edu.training.news_portal.dao.DaoProvider;
import edu.training.news_portal.dao.NewsDao;
import edu.training.news_portal.service.NewsService;
import edu.training.news_portal.service.ServiceException;

import java.util.List;

public class NewsServiceImpl implements NewsService {

    private final NewsDao newsDao = DaoProvider.getInstance().getNewsDao();

    private final int MAX_AVAILABLE_TOP_NEWS = 10;

    @Override
    public List<News> takeTopNews(int count) throws ServiceException {
        //доделать
        if(count <= 0 || count > MAX_AVAILABLE_TOP_NEWS){
            throw new ServiceException("Error message");
        }

        try {
            return newsDao.topNews(count);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }

    @Override
    public List<News> findByUserId(int userId, int offset, int limit) throws ServiceException {
        if(limit <= 0 || limit > MAX_AVAILABLE_TOP_NEWS){
            throw new ServiceException("Error message");
        }

        try {
            return newsDao.findByUserId(userId,offset,limit);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }

    @Override
    public void addNews(News news) throws ServiceException {
        try {
            newsDao.addNews(news);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }

    @Override
    public void deleteNews(int newsId) throws ServiceException {
        try {
            newsDao.deleteNews(newsId);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }

    @Override
    public News findNewsId(int newsId) throws ServiceException {
        try {
            return newsDao.findNewsId(newsId);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }

    @Override
    public void editNews(News news) throws ServiceException {
        try {
            newsDao.editNews(news);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }


}
