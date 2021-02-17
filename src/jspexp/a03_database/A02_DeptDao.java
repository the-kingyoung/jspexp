package jspexp.a03_database;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;

public class A02_DeptDao {

	//DAO : database access object
	   // 1. 데이터베이스 연결 처리		도로를 깔아주고
	   private Connection con;
	// 2. 대화
	   private Statement stmt;
	   private PreparedStatement pstmt;
	// 3. 결과값 받는 객체
	   private ResultSet rs;

	// # 연결 처리 기능메서드
	   public void setCon() {
	      // 1. driver 메모리 로딩
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }															//에러가 안나면 캐치문은 그냥 넘어감
	      // 2. 특정 서버
	      //      - 접속 정보 : 드라이버명:@ip:port:sid						뭘타고 갈건지 정해준다.
	      String info = "jdbc:oracle:thin:@localhost:1521:xe";
	      //드라이버 매니저 객체를 통해서 Connection객체를 생성 
	      try {
	         con = DriverManager.getConnection(info, "scott", "tiger");
	         System.out.println("접속 성공");
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         System.out.println(e.getMessage());
	      }
	   }

	public ArrayList<Dept> deptList(Dept sch){
		   ArrayList<Dept> dlist = new ArrayList<Dept>();
		   //1. 연결
		   try {
			   setCon();
		   //2. 대화  sql
			   String sql="SELECT * \r\n"
			   		+ "from dept10\r\n"
			   		+ "WHERE dname LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
			   		+ "AND loc LIKE '%'||'"+sch.getLoc()+"'||'%'"
			   		+ "ORDER BY deptno DESC";
			   stmt = con.createStatement();
		   //3. 결과
			   rs = stmt.executeQuery(sql);
			   while(rs.next()) {
				   dlist.add(new Dept(rs.getInt(1),
						   				rs.getString(2),
						   				rs.getString(3)));
			   }
			   System.out.println("데이터 크기 : "+dlist.size());
		   //4. 자원해제
			   rs.close();
			   stmt.close();
			   con.close();
		   //5. 예외 처리.
		   }catch(SQLException e) {
			   e.printStackTrace();
			   System.out.println("## db처리 예외 ##");
			   System.out.println(e.getMessage());
			   try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		   }catch(Exception e) {
			   e.printStackTrace();
			   System.out.println("## 일반 예외 ##");
			   System.out.println(e.getMessage());
		   }
		
		   return dlist;
	   }	
//=====================================================================================================================	
	public void insertDept(Dept ins){
		//연결
		try {
			setCon();
			con.setAutoCommit(false);
			stmt=con.createStatement();
			String sql="INSERT INTO dept10 values("+ins.getDeptno()+
					",'"+ins.getDname()+"','"+ins.getLoc()+"')";
			//대화
			stmt.executeUpdate(sql);
			System.out.println(sql);
			//commit
			con.commit();
			//자원해제
			
			stmt.close();
			con.close();			
			//예외처리
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
//=====================================================================================================================		
public Dept getDept(int deptno) {
	Dept dept = null;														//지역변수를 초기화해주는것이다.
	try {
		setCon();
		String sql = "SELECT * FROM DEPT10 WHERE deptno = '"+deptno+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()) {
			dept = new Dept(rs.getInt(1),rs.getString(2),rs.getString(3));
		}
		rs.close();
		stmt.close();
		con.close();
		
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return dept;
}
//=====================================================================================================================	
public ArrayList<Dept> deptList2(String dname, String loc){
	   ArrayList<Dept> dlist = new ArrayList<Dept>();
	   try {
		   setCon();
		   String sql="SELECT * FROM DEPT\r\n"
		   		+ "WHERE dname LIKE '%'||(?)||'%'\r\n"
		   		+ "AND loc LIKE '%'||(?)||'%'";
		   
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, dname);
		   pstmt.setString(2, loc);
		   rs = pstmt.executeQuery(sql);
		   while(rs.next()) {
			   dlist.add(new Dept(rs.getInt(1),
					   			rs.getString(2),
					   			rs.getString(3)));
		   }
		   System.out.println("데이터 크기 : "+dlist.size());
		   rs.close();
		   pstmt.close();
		   con.close();
		   
	   }catch(SQLException e) {
		   e.printStackTrace();
		   System.out.println("## db처리 예외 ##");
		   System.out.println(e.getMessage());
		   try {
			con.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	   }catch(Exception e) {
		   e.printStackTrace();
		   System.out.println("## 일반 예외 ##");
		   System.out.println(e.getMessage());
	   }
	
	   return dlist;
}	
//=====================================================================================================================	
public void updateDept(Dept upt) {
	   //1. 접속 autocommit(false)
	   try {
		   setCon();
		   con.setAutoCommit(false);
		   //2. 대화

		   String sql = "UPDATE DEPT10 \r\n"
		   		+ "SET dname=?,\r\n"
		   		+ "	loc=?\r\n"
		   		+ "	WHERE deptno =?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, upt.getDname());
		   pstmt.setString(2, upt.getLoc());
		   pstmt.setInt(3, upt.getDeptno());
		   pstmt.executeUpdate();
		   //3. commit
		   con.commit();
		   //자원해제
		   pstmt.close();
		   con.close();
		   //4. 예외처리
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
		System.out.println("db 처리 에러");
		try {
			con.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}catch(Exception e) {
		System.out.println("일반에러");
	}
}
//=====================================================================================================================	
public void deleteDept(int deptno) {
	   //1. 접속 autocommit(false)
	   try {
		   setCon();
		   con.setAutoCommit(false);
		   //2. 대화

		   String sql = "DELETE FROM dept10 WHERE deptno=?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setInt(1, deptno);

		   pstmt.executeUpdate();
		   //3. commit
		   con.commit();
		   //자원해제
		   pstmt.close();
		   con.close();
		   //4. 예외처리
	} catch (SQLException e) {
		// TODO: handle exception
		e.printStackTrace();
		System.out.println("db 처리 에러");
		try {
			con.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}catch(Exception e) {
		System.out.println("일반에러");
	}
}

	//=====================================================================================================================	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_DeptDao dao = new A02_DeptDao();
		dao.insertDept(new Dept(70,"IT part","경기 수원"));
	
	}

}
