package jspexp.a03_database;

import java.sql.*;

public class ProDao {
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try {
			con = DriverManager.getConnection(info, "scott", "tiger");
			System.out.println("접속 O");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void newPro(String product_name, int product_price) {
		try {
			setCon();
			String sql = "SELECT product_name, product_price FROM PRODUCTS\r\n"
					+ "WHERE product_id=(SELECT max(product_id)\r\n"
					+ "            FROM PRODUCTS)";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	
	public static void main(String[] args) {
		
	}
}
