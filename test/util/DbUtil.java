package com.training.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**.
*
* @author Wilmar Paul A. Carinan
*
*/

public class DbUtil {
  private static Connection connection = null;

  /** Method for the connection
  *   to the Oracle Database.
  */
  public static Connection getConnection() {
    final String url = Constants.URL;
    final String username = Constants.USERNAME;
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
