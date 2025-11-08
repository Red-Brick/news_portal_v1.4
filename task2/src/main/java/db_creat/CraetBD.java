package db_creat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CraetBD {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nova_news_4?useSSL=false&allowPublicKeyRetrieval=false","root","admin");
        String sql_insert_roles = "INSERT INTO roles(name) VALUES(?)";

        PreparedStatement pSt = connection.prepareStatement(sql_insert_roles);

        pSt.setString(1,"admin");
        pSt.executeUpdate();

        pSt.setString(1,"user");
        pSt.executeUpdate();

        pSt.setString(1,"reporter");
        pSt.executeUpdate();

        pSt.setString(1,"moderator");
        pSt.executeUpdate();

        pSt.setString(1,"super_admin");
        pSt.executeUpdate();

        connection.close();
    }
}
