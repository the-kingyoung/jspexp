package ex1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Program {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "SELECT * FROM member";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url,"scott","tiger");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			String ID = rs.getString("ID");
			String PASS	= rs.getString("PASS");
			String CIVILNUM	= rs.getString("CIVILNUM");
			int POINT = rs.getInt("POINT");
			String AUTH = rs.getString("AUTH");
			
			System.out.print(ID + "\t");
			System.out.print(PASS + "\t");
			System.out.print(CIVILNUM + "\t");
			System.out.print(POINT + "\t");
			System.out.print(AUTH);
		}
		
		rs.close();
		st.close();
		con.close();

	}

}
