package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.*;

public class Pdao {
	
//========================데이터베이스 연결 처리========================================================
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
	         System.out.println("접속 성공");
	      } catch (SQLException e) {
	         e.printStackTrace();
	         System.out.println(e.getMessage());
	      }
	   }
	   
//========================조회 처리 메서드(매개변수 없는 처리)=============================================
		public ArrayList<Emp200> eList() {
			ArrayList<Emp200> list = new ArrayList<Emp200>();
			try {
				setCon();
				String sql = "select * from emp200";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);

				int cnt = 1;
				while (rs.next()) {
					System.out.print(cnt++ + ":" + rs.getInt(1) + "\t");
					System.out.print(rs.getString("ename") + "\t");
					System.out.print(rs.getString("job") + "\t");
					System.out.print(rs.getInt("mgr") + "\t");
					System.out.print(rs.getDate("hiredate") + "\t");
					System.out.print(rs.getDouble("sal") + "\t");
					System.out.print(rs.getDouble("comm") + "\t");
					System.out.print(rs.getInt("deptno") + "\n");

					Emp200 e = new Emp200(rs.getInt("empno"), rs.getString(2), rs.getString(3), rs.getInt(4),
							rs.getDate("hiredate"), rs.getDouble(6), rs.getDouble(7), rs.getInt(8));

					list.add(e);
				}
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println(e1.getMessage());
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return list;
		}
//========================조회 처리 메서드(매개변수 있는 처리)====================================================================
		public ArrayList<Emp200> eList(String ename, String job) {
			ArrayList<Emp200> list = new ArrayList<Emp200>();
			try {
				setCon();
				String sql = "	SELECT *\r\n"
						+ "	FROM EMP200\r\n"
						+ "	WHERE ename like '%'||upper(?)||'%'\r\n"
						+ "	AND job LIKE '%'||upper(?)||'%'";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, ename);
				pstmt.setString(2, job);
				rs = pstmt.executeQuery(sql);

				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println(e1.getMessage());
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return list;
		}
//========================main====================================================================
	   public static void main(String[] args) {
		
	}
}
