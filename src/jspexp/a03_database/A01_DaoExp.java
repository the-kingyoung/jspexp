package jspexp.a03_database;

import java.sql.*;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Emp;

public class A01_DaoExp {				//DAO : Database Access Object
	private Connection con;				//데이터베이스 연결 처리
	private Statement stmt;				//대화
	private PreparedStatement pstmt;
	private ResultSet rs;				//결과값 받는 객체
	
	//# 연결 처리 기능메서드
	public void setCon() {
		try {								//드라이버 메모리 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){	//이건 이해가 잘안감
			e.printStackTrace();		 	//에러가 났다는 표시를 띄워주는건가?
		}
											//특정서버 -접속정보:드라이버명:@ip:prot:sid
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			con=DriverManager.getConnection(info,"scott","tiger");
			System.out.println("접속 성공!!");
			
		} catch (SQLException e) {			//아무래도 에러가 났다는 표시를 해주는건가보다.
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	//# 조회 처리 메서드..(매개변수 없는 처리의 예시를 보여준다.)
	public ArrayList<Emp> empList(){
		ArrayList<Emp> list = new ArrayList<Emp>();
		try {
			setCon();
			String sql = "select * from emp";	//Statement 객체 생성(연결 객체 - Connection)
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);		//ResultSet 객체 생성(대화 객체 - Statement)
			
			int cnt=1;
			while(rs.next()) {
				System.out.print(cnt++ + " : " + rs.getInt("empno")+ "\t");
				System.out.print(rs.getString("ename")+"\t");
				System.out.print(rs.getString("job")+"\t");
				System.out.print(rs.getInt("mgr")+"\t");
				System.out.print(rs.getDate("hiredate")+"\t");
				System.out.print(rs.getDouble("sal")+"\t");
				System.out.print(rs.getDouble("comm")+"\t");
				System.out.print(rs.getInt("deptno")+"\n");
				
				Emp e = new Emp(rs.getInt("empno"), rs.getString(2),
						rs.getString(3),rs.getInt(4),rs.getDate(5),
						rs.getDouble(6), rs.getDouble(7), rs.getInt(8));
				list.add(e);
			}
			System.out.println("객체의 갯수 : " + list.size());
			System.out.println("첫번째 행의 ename : " + list.get(0).getEname());
			System.out.println("두번째 행의 ename : " + list.get(1).getEname());
			
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
//======================================================================================================================================	

	public ArrayList<Dept> deptlist(){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		try {
			setCon();
			String sql = "select * from dept";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				System.out.print(rs.getInt(1)+"\t");
				System.out.print(rs.getString(2)+"\t");
				System.out.println(rs.getString(3)+"\t");
				dlist.add(new Dept(rs.getInt(1),rs.getString(2),rs.getString(3)));
				// .add의 과정이 dlist라는 ArrayList에 값을 넣어주는건가보다.
			}
			System.out.println("데이터의 건수 : " + dlist.size());
			System.out.println("두번째 행의 부서명 : "+ dlist.get(1).getDname());
			
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();					//이거 쓰는 이유만 좀 알면 될듯?
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return dlist;
//======================================================================================================================================	
	}
	public ArrayList<Dept> deptList(Dept sch){
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		
		try {
			setCon();
			String sql = "SELECT * \r\n"
					+ "FROM dept\r\n"
					+ "WHERE dname LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
					+ "AND loc LIKE '%'||'"+sch.getLoc()+"'||'%'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dlist.add(new Dept(rs.getInt(1),rs.getString(2),rs.getString(3)));
			}
			System.out.println("데이터의 크기 : " + dlist.size());
			
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("## db처리 예외 ##");
			System.out.println(e.getMessage());
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("## 일반 예외 ##");
			System.out.println(e.getMessage());
		}
		return dlist;
	}
//======================================================================================================================================	
	
	
	
	
		public static void main(String[] args) {
		      A01_Dao dao = new A01_Dao();
		      dao.empList();
		      dao.deptList();
		      dao.deptList(new Dept("",""));

	}
}
