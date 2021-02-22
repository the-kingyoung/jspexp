package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Member;
import jspexp.z01_vo.Member5;

public class A04_MemberDao {


	   private Connection con;
	   private Statement stmt;
	   private PreparedStatement pstmt;
	   private ResultSet rs;


	   public void setCon() {
	      // 1. driver 메모리 로딩
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

	// 조회 처리 메서드.. (매개변수 없는 처리)
	   public ArrayList<Member5> memberList(String id, String name){
	      ArrayList<Member5> list = new ArrayList<Member5>();

	      try {
	         setCon();

	         String sql = "	SELECT * \r\n"
	         		+ "FROM member5\r\n"
	         		+ "WHERE id LIKE '%'||'"+ id +"'||'%'\r\n"
	         		+ "AND name LIKE '%'||'"+name+"'||'%'";
	         stmt = con.createStatement();

	         rs = stmt.executeQuery(sql);
	         while(rs.next()) {
	
			 Member5 m =new Member5(	rs.getString(1), 
					 					rs.getString(2),rs.getString(3),
										rs.getInt(4), rs.getString(5), 
										rs.getDate(6), rs.getString(7));

	        	 list.add(m);     	 
	         }
	         System.out.println("데이터 건수 : "+list.size());
	         System.out.println("두번째행 : "+list.get(1).getName());

	         rs.close();
	         stmt.close();
	         con.close();
	      } catch (SQLException e1) {
	         e1.printStackTrace();
	         System.out.println(e1.getMessage());
	      }catch(Exception e) {
	    	  System.out.println(e.getMessage());
	      }
	
	      String info = "jdbc:oracle:thin:@localhost:1521:xe";
	      try {
	         con = DriverManager.getConnection(info, "scott", "tiger");
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      System.out.println("접속 성공");
	      
	      return list;
	   }
//=======================================================================================
	   public Emp getEmp(int empno){
			Emp emp = null;
			try {
				setCon();
				String sql = "SELECT * FROM emp2 WHERE empno = '"+empno+"'";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
		               emp = new Emp(rs.getInt("empno"), 
		                       rs.getString(2),rs.getString(3),
		                       rs.getInt(4), rs.getDate("hiredate"),
		                       rs.getDouble(6), rs.getDouble(7),
		                       rs.getInt(8) );
				}
				
				rs.close();
				stmt.close();
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
				
			return emp;
		}
//==========================로그인 메서드=======================
	   //데이터가 있을 때, 데이터가 할당된 Member 객체를 return
	   //데이터가 없을 때, null을 return
	   public Member login(Member login) {
		   Member m = null;
		try {
			setCon();
			String sql = "SELECT * \r\n"
					+ "FROM MEMBER5\r\n"
					+ "WHERE id=?\r\n"
					+ "AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login.getId());
			pstmt.setString(2, login.getPass());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("## 데이터 있음");
				m = new Member(rs.getString("id"),
							   rs.getString("pass"),
							   rs.getInt("point"),
							   rs.getString("name"),
							   rs.getString("auth"));
			}else {
				
				System.out.println("## 데이터 없음");
				
			}
			System.out.println("데이터가 있음 이름 : "+m.getName());
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB에러"+e.getMessage());
		}catch (Exception e) {
			System.out.println("일반에러"+e.getMessage());
		}
		   
		   
		   return m;
	   }

		//==========================로그인 메서드=======================
		public Member douCheck(String id) {
			Member m = null;
			try {
				setCon();
				String sql = "SELECT * FROM member5\r\n" + "WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					System.out.println("## 데이터 있음");
					m = new Member(rs.getString("id"));
				} else {
					System.out.println("## 데이터 없음");
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				System.out.println("DB에러" + e.getMessage());
			} catch (Exception e) {
				System.out.println("일반에러" + e.getMessage());
			}
			return m;
		}

		//==========================로그인 메서드=======================
		//데이터가 있는지 여부를 boolean을 확인
		public boolean hasMember(String id) {
			boolean hasMem=false;
			try {
				setCon();
				String sql = "SELECT * FROM member5\r\n" + "WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				hasMem = rs.next();
				
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {} catch (Exception e) {
		
				System.out.println("DB에러" + e.getMessage());
					System.out.println("일반에러" + e.getMessage());
			}
			return hasMem;
		}

		public static void main(String[] args) {

		}
}
