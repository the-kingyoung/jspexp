package jspexp.a03_database;

import java.sql.*;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;

public class A00_DeptDao {
	
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
			System.out.println("scott로 접속 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}
	
	public ArrayList<Dept> display(String dname, String loc) {
		ArrayList<Dept> arry1 = new ArrayList<Dept>();
		try {
			setCon();
			String sql = "SELECT * FROM dept10\r\n"
					+ "WHERE dname LIKE '%'||upper(?)||'%'\r\n"
					+ "AND loc LIKE '%'||upper(?)||'%'\r\n"
					+ "ORDER BY deptno ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dept d = new Dept(rs.getInt(1), rs.getString(2), rs.getString(3));
				arry1.add(d);
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return arry1;
	}
	public void insertDept(String dname, String loc) {
		try {
			setCon();
			String sql = "INSERT INTO Dept10 values(Dept_SEQ.nextVal,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
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
	
	public Dept detailDept(int deptno) {
		Dept d = new Dept();
		try {
			setCon();
			String sql = "SELECT * FROM dept10\r\n"
					+ "WHERE deptno=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				d = new Dept(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return d;
	}

	public void updateDept(int deptno, String dname, String loc) {
		try {
			setCon();
			String sql = "UPDATE DEPT10 \r\n"
					+ "SET dname=?,\r\n"
					+ "	loc = ?\r\n"
					+ "WHERE deptno=?";
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.setInt(3, deptno);
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

	public void deleteDept(int deptno) {
		try {
			setCon();
			String sql = "DELETE dept10\r\n"
					+ "WHERE deptno=?";
	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
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
		A00_DeptDao dao = new A00_DeptDao();
		dao.updateDept(90,"생산","제주");
		


	}
	
	
	
	
}
