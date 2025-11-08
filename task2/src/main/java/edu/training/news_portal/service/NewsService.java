package edu.training.news_portal.service;

import edu.training.news_portal.beans.News;

import java.util.List;

public interface NewsService {
    List<News> takeTopNews(int count) throws ServiceException;

}
