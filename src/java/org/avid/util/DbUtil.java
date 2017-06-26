/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Wilmar Paul
 */
public class DbUtil {
    private static Connection connection = null;

    /** Method for the connection
    *   to the MySQL Database.
    */
    public static Connection getConnection() {
      final String url = Constants.URL;
      final String username = Constants.USER;
      final String password = Constants.PASSWORD;
      if (connection != null) {
        return connection;
      } else {
        try {
          Class.forName(Constants.DRIVER);
          connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        } catch (SQLException e) {
          e.printStackTrace();
        }
        return connection;
      }
    }
}
