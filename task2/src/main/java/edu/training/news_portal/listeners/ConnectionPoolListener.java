package edu.training.news_portal.listeners;

import edu.training.news_portal.pool.ConnectionPool;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.SQLException;

@WebListener
public class ConnectionPoolListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {

        try {
            ConnectionPool poll = ConnectionPool.getFirstInstance("jdbc:mysql://localhost:3306/nova_news_4?useSSL=false&allowPublicKeyRetrieval=true","root","admin",5);

        }catch (SQLException | ClassNotFoundException e){
            throw new RuntimeException("Ошибка инициализации пула соединения", e);
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        try {
            ConnectionPool.getInstance().close();

        }catch (SQLException e){
            //error
            throw new RuntimeException("Ошибка при запуске соединений", e);
        }
    }
}
