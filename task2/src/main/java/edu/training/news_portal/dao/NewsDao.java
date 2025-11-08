package edu.training.news_portal.dao;

import edu.training.news_portal.beans.News;

import java.util.List;

public interface NewsDao {

    List<News> topNews(int count)throws DaoException;
}
