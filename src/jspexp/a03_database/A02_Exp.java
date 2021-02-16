package jspexp.a03_database;

import java.sql.*;

import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Pinfo;



public class A02_Exp {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//연결메서드
	public void setCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			con = DriverManager.getConnection(info, "scott", "tiger");
			System.out.println("접속완료^_<");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	// 전체리스트 읽어오기
	public ArrayList<Pinfo> pList(){

		ArrayList<Pinfo> list = new ArrayList<Pinfo>();
		try {
			setCon();
			String sql = "SELECT * FROM pInfo\r\n"
					+ "ORDER by pnum";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			Pinfo p = new Pinfo(rs.getInt(1),rs.getString(2),rs.getInt(3),
					rs.getInt(4),rs.getDate(5),rs.getString(6),
					rs.getDate(7),rs.getString(8));
			list.add(p);	
			}
			/*
			 (int pnum, String pname, int price, int pstock, Date pnewreg, String pcompany, Date prereg,
			String pdirector
			 */
		rs.close();
		stmt.close();
		con.close();
		}catch(SQLException e1){
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return list;		
	}

	//검색어 가져오기============================================================================================================
	public ArrayList<Pinfo> pList(String pname){

		ArrayList<Pinfo> list = new ArrayList<Pinfo>();
		try {
			setCon();
			String sql = "SELECT  * FROM pInfo\r\n"
					+ "WHERE pname like '%'||'"+pname+"'||'%'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			Pinfo p = new Pinfo(rs.getInt(1),rs.getString(2),rs.getInt(3),
					rs.getInt(4),rs.getDate(5),rs.getString(6),
					rs.getDate(7),rs.getString(8));
			list.add(p);	
			}			
		
		rs.close();
		stmt.close();
		con.close();
		}catch(SQLException e1){
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return list;		
	}

	//가격 가져오기============================================================================================================
	public ArrayList<Pinfo> pList(String from, String to){

		ArrayList<Pinfo> list = new ArrayList<Pinfo>();
		try {
			setCon();
			String sql = "SELECT * FROM pInfo\r\n"
					+ "WHERE price BETWEEN "+from+" and "+to+"";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			Pinfo p = new Pinfo(rs.getInt(1),rs.getString(2),rs.getInt(3),
					rs.getInt(4),rs.getDate(5),rs.getString(6),
					rs.getDate(7),rs.getString(8));
			list.add(p);	
			}			
		
		rs.close();
		stmt.close();
		con.close();
		}catch(SQLException e1){
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return list;		
	}
	
	//세개의 조건에 부합하는지
	public ArrayList<Pinfo> pList(String pname, String from, String to){

		ArrayList<Pinfo> list = new ArrayList<Pinfo>();
		try {
			setCon();
			String sql = "SELECT * FROM pInfo\r\n"
					+ "WHERE price BETWEEN "+from+" and "+to+"\r\n"
					+ "AND pname like '%'||'"+pname+"'||'%'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			Pinfo p = new Pinfo(rs.getInt(1),rs.getString(2),rs.getInt(3),
					rs.getInt(4),rs.getDate(5),rs.getString(6),
					rs.getDate(7),rs.getString(8));
			list.add(p);	
			}			
		
		rs.close();
		stmt.close();
		con.close();
		}catch(SQLException e1){
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return list;		
	}

	//디테일 검색
	public ArrayList<Pinfo> pList(int pnum){

		ArrayList<Pinfo> list = new ArrayList<Pinfo>();
		try {
			setCon();
			String sql = "SELECT * FROM pInfo\r\n"
					+ "WHERE pnum = "+pnum+"";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			Pinfo p = new Pinfo(rs.getInt(1),rs.getString(2),rs.getInt(3),
					rs.getInt(4),rs.getDate(5),rs.getString(6),
					rs.getDate(7),rs.getString(8));
			list.add(p);	
			}			
		
		rs.close();
		stmt.close();
		con.close();
		}catch(SQLException e1){
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return list;		
	}
	
	//등록하기
	public ArrayList<Pinfo> reg(int pnum, String pname, int price, int pstock,
								String pnewreg, String pcompany, String prereg, String pdirector){

		ArrayList<Pinfo> list = new ArrayList<Pinfo>();
		try {
			setCon();
			String sql = "INSERT INTO pInfo VALUES ("+pnum+", '"+pname+"',"+price+","+pstock+",'"+pnewreg+"',"
												+ "'"+pcompany+"','"+prereg+"','"+pdirector+"')";
			
			
			System.out.println(sql);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		
			stmt.close();
			con.close();
		}catch(SQLException e1){
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}

		return list;		
	}

	//====================================MAIN==================================================
	public static void main(String[] args) {
		A02_Exp p=new A02_Exp();
		ArrayList<Pinfo> asd = p.pList("100", "100000");
		for(Pinfo pList	: asd) {
			System.out.println(pList.getPname());
		}
	}
}

