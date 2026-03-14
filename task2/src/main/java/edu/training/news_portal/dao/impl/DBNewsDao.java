package edu.training.news_portal.dao.impl;

import edu.training.news_portal.beans.News;
import edu.training.news_portal.dao.DaoException;
import edu.training.news_portal.dao.NewsDao;
import edu.training.news_portal.pool.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBNewsDao implements NewsDao {

    private final ConnectionPool pool = ConnectionPool.getInstance();

    private static final String SELECT_TOP_NEWS_SQL = "SELECT n.*, ns.category, ud.name, ud.surname FROM news n left JOIN news_status ns ON n.news_status_id = ns.id left JOIN authors au ON n.id = au.news_id left JOIN user_details ud ON au.users_id = ud.users_id LIMIT ?";


    @Override
    public List<News> topNews(int count) throws DaoException {
        List<News> topNews = new ArrayList<News>();

        try (Connection con = pool.takeConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_TOP_NEWS_SQL)) {
            ps.setInt(1, count);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    topNews.add(mapToNews(rs));
                }
            }catch (Exception exception){
                System.out.println("Ошибка при разборе SQL response");
            }

        } catch (SQLException e) {
            throw new DaoException("Ошибка при получении топ-новостей", e);
        }

        return topNews;
    }

    private static final String FIND_BY_USER_ID_SQL = "SELECT n.* , ns.category\n" +
            "FROM news n\n" +
            "LEFT JOIN authors a ON n.id = a.news_id\n" +
            "LEFT JOIN users u ON u.id = a.users_id\n" +
            "left JOIN news_status ns ON n.news_status_id = ns.id\n" +
            "WHERE u.id = ? LIMIT ? OFFSET ?";

    @Override
    public List<News> findByUserId(int userId, int offset, int limit) throws DaoException {
        List<News> newsList = new ArrayList<>();
        try (Connection con = pool.takeConnection();
             PreparedStatement ps = con.prepareStatement(FIND_BY_USER_ID_SQL)) {

            ps.setInt(1, userId);
            ps.setInt(2, limit);
            ps.setInt(3, offset);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    newsList.add(mapToNews(rs));
                }
            }

        } catch (SQLException e) {
            throw new DaoException("Ошибка при получении новостей пользователя", e);
        }
        return newsList;
    }

    private static final String INSERT_NEWS_SQL = "INSERT INTO news(title, brief, content_path, publish_date, news_status_id, created_at, updated_at, image, status) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String INSERT_AUTHORS_SQL = "INSERT INTO authors(users_id, news_id) VALUES ( ?, ?)";

    @Override
    public void addNews(News news) throws DaoException {

        Connection con = null;
        try {
            con = pool.takeConnection();
            con.setAutoCommit(false);
            int generatedNewsId = 0;

            try (PreparedStatement ps = con.prepareStatement(INSERT_NEWS_SQL, Statement.RETURN_GENERATED_KEYS)) {

                ps.setString(1, news.getTitle());
                ps.setString(2, news.getBrief());
                ps.setString(3, news.getContent());
                ps.setString(4, news.getDate());
                ps.setString(5, news.getCategory());
                ps.setString(6, news.getCreated_at());
                ps.setString(7, news.getUpdate_at());
                ps.setString(8, news.getImage());
                ps.setString(9, news.getStatus());

                //ps.setInt(10, news.getUserId());

                System.out.println("[NewsDaoImpl.addNews] Добавление новости: title=" + news.getTitle() +
                        ", brief=" + (news.getBrief() != null ? news.getBrief().substring(0, Math.min(30, news.getBrief().length())) : "null") +
                        ", content=" + (news.getContent() != null ? news.getContent().substring(0, Math.min(30, news.getContent().length())) : "null") +
                        ", statusId=" + news.getStatus() + ", userId=" + news.getUserId());

                int affectedRows = ps.executeUpdate();
                if (affectedRows == 0) {
                    throw new DaoException("Не удалось добавить новость, нет затронутых строк.");
                }

                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedNewsId = rs.getInt(1);
                    }
                }



            }
            try (PreparedStatement ps = con.prepareStatement(INSERT_AUTHORS_SQL)) {
                ps.setInt(1, news.getUserId());
                ps.setInt(2, generatedNewsId); // Используем локальную переменную
                int authorRows = ps.executeUpdate(); // Используем executeUpdate()!
                if (authorRows == 0) {
                    throw new DaoException("Не удалось добавить автора");
                }
            }
            con.commit();

        } catch (SQLException e) {
            System.err.println("[NewsDaoImpl.addNews] SQL Ошибка: " + e.getMessage());
            System.err.println("[NewsDaoImpl.addNews] SQL State: " + e.getSQLState());
            System.err.println("[NewsDaoImpl.addNews] Error Code: " + e.getErrorCode());
            e.printStackTrace();

            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    throw new DaoException("Ошибка при откате транзакции", ex);
                }
            }
            throw new DaoException("Ошибка при добавлении новости: " + e.getMessage(), e);
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    throw new DaoException(e);
                }
            }
        }
    }

    private static final String DELETE_NEWS_SQL = "DELETE FROM news WHERE id=?";
    private static final String INSERT_DELETE_NEWS_SQL = "INSERT INTO news(status) VALUES (?)";

    @Override
    public void deleteNews(int newsId) throws DaoException {
        Connection con = null;
        try {
            con = pool.takeConnection();
            con.setAutoCommit(false);

            try (PreparedStatement ps = con.prepareStatement(DELETE_NEWS_SQL)) {

                ps.setInt(1, newsId);

                int affectedRows = ps.executeUpdate();
                if (affectedRows == 0) {
                    throw new DaoException("Не удалось удалить новость, нет затронутых строк.");
                }
            }

        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    throw new DaoException("Ошибка при откате транзакции", ex);
                }
            }
            throw new DaoException("Ошибка при удалении новости", e);
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    throw new DaoException(e);
                }
            }
        }
    }

    private static final String FIND_NEWS_ID_SQL = "SELECT n.*, ns.category FROM news n left JOIN news_status ns ON n.news_status_id = ns.id WHERE n.id = ?";

    @Override
    public News findNewsId(int newsId) throws DaoException {
        News news = new News();
        try (Connection con = pool.takeConnection();
             PreparedStatement ps = con.prepareStatement(FIND_NEWS_ID_SQL)) {

            ps.setInt(1, newsId);

            try (ResultSet rs = ps.executeQuery()) {
                rs.next();
                news = mapToNews(rs);
            }

        } catch (SQLException e) {
            throw new DaoException("Ошибка при получении новости для редактирования", e);
        }
        return news;
    }

    private static final String UPDATE_NEWS_SQL = "UPDATE news SET title=?, brief=?, content_path=?, publish_date=?, news_status_id=?, created_at=?, updated_at=?, image=?, status=? WHERE id=?";

    @Override
    public void editNews(News news) throws DaoException {
        Connection con = null;
        try {
            con = pool.takeConnection();
            con.setAutoCommit(false);

            try (PreparedStatement ps = con.prepareStatement(UPDATE_NEWS_SQL)) {

                ps.setString(1, news.getTitle());
                ps.setString(2, news.getBrief());
                ps.setString(3, news.getContent());
                ps.setString(4, news.getDate());
                ps.setString(5, news.getCategory());
                ps.setString(6, news.getCreated_at());
                ps.setString(7, news.getUpdate_at());
                ps.setString(8, news.getImage());
                ps.setString(9, news.getStatus());
                ps.setInt(10, news.getId());

                int affectedRows = ps.executeUpdate();
                if (affectedRows == 0) {
                    throw new DaoException("Не удалось обновить новость, нет затронутых строк.");
                }
            }
            con.commit();

        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    throw new DaoException("Ошибка при откате транзакции", ex);
                }
            }
            throw new DaoException("Ошибка при обновлении новости", e);
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    throw new DaoException(e);
                }
            }
        }
    }


    private News mapToNews(ResultSet rs) throws SQLException {
        News news = new News();
        news.setId(rs.getInt("id"));
        news.setTitle(rs.getString("title"));
        news.setBrief(rs.getString("brief"));
        news.setContent(rs.getString("content_path"));
        news.setDate(rs.getString("publish_date"));
        news.setStatus(rs.getString("status"));
        news.setCreated_at(rs.getString("created_at"));
        news.setUpdate_at(rs.getString("updated_at"));
        news.setImage(rs.getString("image"));
        news.setCategory(rs.getString("category"));

        try {
            news.setAuthorName(rs.getString("name"));
            news.setAuthorSurname(rs.getString("surname"));
        } catch (SQLException e) {
            // Если колонки не существуют, игнорируем
        }

        return news;
    }
}
