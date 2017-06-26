import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.avid.model.Employee;

public class SampleConnection {

	public static void main(String args[]) throws ParseException{
            List<Employee> employees = new ArrayList<Employee>();
            try {
                StringBuilder query = new StringBuilder();
                query.append("Select ");
                query.append("* ");
                query.append("FROM ");
                query.append("employees ");
                System.out.println(query);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_mvcjsp","root","");

                Statement stmt=con.createStatement();

                ResultSet rs = stmt.executeQuery(query.toString());
              while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmpId(rs.getInt("EMPLOYEE_ID"));
                employee.setfirstName(rs.getString("FIRST_NAME"));
                employee.setlastName(rs.getString("LAST_NAME"));
                employee.sethireDate(rs.getDate("HIRE_DATE"));
                employee.setEmail(rs.getString("EMAIL"));
                employee.setManager("");
                employee.setPhone(rs.getString("PHONE_NUMBER"));
                employee.setDepartment("");
                employee.setjobTitle("");
                employees.add(employee);
              }

              System.out.println(employees.get(0));


              con.close();
              stmt.close();

            } catch (SQLException e){
                    e.printStackTrace();
            } catch (ClassNotFoundException e) {
                    e.printStackTrace();
            }
            
            java.util.Date date = new SimpleDateFormat("MM/dd/yyyy").parse("06/13/2017");
            String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
            System.out.println(date);
	}
}