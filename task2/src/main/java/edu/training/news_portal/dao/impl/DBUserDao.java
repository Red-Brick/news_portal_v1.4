package edu.training.news_portal.dao.impl;

import edu.training.news_portal.beans.RegistrationInfo;
import edu.training.news_portal.beans.User;
import edu.training.news_portal.dao.DaoException;
import edu.training.news_portal.dao.UserDao;
import edu.training.news_portal.pool.ConnectionPool;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

public class DBUserDao implements UserDao {

    private final ConnectionPool pool = ConnectionPool.getInstance();

    private static final String SQL_SELECT_USERS_BY_EMAIL = "SELECT us.password, usd.name FROM users us, user_details usd WHERE us.email = ? and us.id = usd.users_id";

    @Override
    public User checkCredentials(String login, String password) throws DaoException {
        try(Connection con = pool.takeConnection();
            PreparedStatement pStSelectUsersEmailPassword = con.prepareStatement(SQL_SELECT_USERS_BY_EMAIL)
            ) {
            pStSelectUsersEmailPassword.setString(1,login);
            ResultSet rs = pStSelectUsersEmailPassword.executeQuery();
            rs.next();
            rs.getString(1);
            System.out.println(BCrypt.checkpw(password,rs.getString(1)));
            System.out.println(password);
            System.out.println(rs.getString(1));
            if(BCrypt.checkpw(password,rs.getString(1))){
                return new User(rs.getString(2));
            }
            return null;

        }catch (SQLException e) {
            throw new DaoException(e);
        }
    }

    private static final String SQL_INSERT_USER = "INSERT INTO users(email, password, roles_id) VALUES(?, ?, ?)";
    private static final String SQL_INSERT_USER_DETAILS = "INSERT INTO user_details(users_id, name, surname) VALUES(?, ?, ?)";
    private static final String SQL_SELECT_ROLE_ID_BY_NAME = "SELECT id FROM roles WHERE name = ?";

    private final int ROLE_ID;
    {
        try(Connection con = pool.takeConnection();
            PreparedStatement pStRoleIdByName = con.prepareStatement(SQL_SELECT_ROLE_ID_BY_NAME)) {

            pStRoleIdByName.setString(1,"user");
            ResultSet rs = pStRoleIdByName.executeQuery();
            rs.next();
            ROLE_ID = rs.getInt(1);


        }catch (SQLException ex){
            throw new RuntimeException("error");
        }
    }

    @Override
    public boolean registration(RegistrationInfo info) throws DaoException {
        Connection con = null;
        try {
            con = pool.takeConnection();
            con.setAutoCommit(false);

            try(PreparedStatement pStInsertUser = con.prepareStatement(SQL_INSERT_USER, Statement.RETURN_GENERATED_KEYS);
                PreparedStatement pStInsertUserDetails = con.prepareStatement(SQL_INSERT_USER_DETAILS);
                ) {


                pStInsertUser.setString(1,info.getEmail());
                pStInsertUser.setString(2,BCrypt.hashpw(info.getPassword(), BCrypt.gensalt()));
                pStInsertUser.setInt(3,ROLE_ID);

                pStInsertUser.executeUpdate();

                int userId;
                try(ResultSet rs = pStInsertUser.getGeneratedKeys()) {
                     if(!rs.next()){
                         throw  new DaoException("error insert bd user");
                     }
                     userId = rs.getInt(1);
                }

                pStInsertUserDetails.setInt(1,userId);
                pStInsertUserDetails.setString(2,info.getName());
                pStInsertUserDetails.setString(3,info.getSurname());

                pStInsertUserDetails.executeUpdate();

                con.commit();
                return true;

            }catch (SQLException e) {
                con.rollback();
            }
        }catch (SQLException e) {
            throw new DaoException(e);
        }
        finally {
            if(con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                }catch (SQLException ex) {
                    throw new DaoException(ex);
                }
            }
        }
        return false;
    }
}
