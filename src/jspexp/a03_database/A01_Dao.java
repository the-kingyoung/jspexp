package jspexp.a03_database;
//jspexp.a03_database.A01_Dao
import java.sql.*;





import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Emp3;
import jspexp.z01_vo.Emp4;
import jspexp.z01_vo.Emp5;
import jspexp.z01_vo.Member5;
import jspexp.z01_vo.jobSalary;


public class A01_Dao {   //DAO : database access object
   // 1. 데이터베이스 연결 처리
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
      //      - 접속 정보 : 드라이버명:@ip:port:sid
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
/*
1. sql작성
2. VO 객체 생성 : sql의 결과값에 따른 컬럼명과 type을 확인하여 작성.
3. 기능 메서드 선언.
	1) 요청에 의한 입력 : 매개변수로 활용.
	2) 데이터의 결과에 따라 리턴값 지정.
		- update, delete, insert : void
			ex) public void insetEmp(Emp ins)
		- 단위 변수나 한개의 데이터
			ex)
			회원이 등록된 여부
			public boolean void isMember(String id, String pass)
			상품의 갯수 : select count(*) from member where...
			public int memCount(Member sch)
			회원 상세정보 : select * from member where id=@@@
			public Member getMember(String id)
		- 여러개의 데이터
			ex)
			공지사항
			public ArrayList<Board> boardList(Board sch)
			회원정보리스트
			public ArrayList<Member> mlist(Member sch)
			
		
*/
   
   // 조회 처리 메서드.. (매개변수 없는 처리)
   public ArrayList<Emp> empList(){
      ArrayList<Emp> list = new ArrayList<Emp>();
      // 1. 공통메서드 호출
      try {
         setCon();
      // 2. Statement 객체 생성 (연결객체 - Connection)
         String sql = "select * from emp2";
         stmt = con.createStatement();
      // 3. ResultSet 객체 생성 (대화객체 - Statement)
         rs = stmt.executeQuery(sql);
         /*
         System.out.println(rs.next());
      // 1행의 데이터가 있는지 여부 확인
      // 1행의 데이터를 사용할 준비
         System.out.println("1행 1열: " + rs.getInt(1));
         System.out.println("1행 2열: " + rs.getString(2));
         //rs.get데이터 유형(컬럼의 순서)
         System.out.println(rs.next());
      // 2행의 데이터가 있는지 여부 확인
      // 2행의 데이터를 사용할 준비
         
      System.out.println("2행 JOB열: " + rs.getString("JOB"));
      //rs.get데이터유형(컬럼명)
      System.out.println("2행 SAL열: " + rs.getDouble("SAL"));
       */
         int cnt=1;
         while(rs.next()) {
        	 
        	 System.out.print(cnt++ + ":" + rs.getInt(1)+"\t");
        	 System.out.print(rs.getString("ename")+"\t");
        	 System.out.print(rs.getString("job")+"\t");
        	 System.out.print(rs.getInt("mgr")+"\t");
        	 System.out.print(rs.getDate("hiredate")+"\t");
        	 System.out.print(rs.getDouble("sal")+"\t");
        	 System.out.print(rs.getDouble("comm")+"\t");
        	 System.out.print(rs.getInt("deptno")+"\n");
        	
        	 //1. 객체 생성과 할당.
        	 Emp e = new Emp(rs.getInt("empno"),rs.getString(2),
        			 rs.getString(3),rs.getInt(4),rs.getDate("hiredate"),
        			 rs.getDouble(6),rs.getDouble(7),rs.getInt(8));
        	 //2. ArrayList에 할당.
        	 list.add(e);
        	 
         }
         System.out.println("객체의 갯수:"+list.size());
         System.out.println("첫번째 행의 ename : "+list.get(0).getEname());
         System.out.println("두번째 행의 ename : "+list.get(1).getEname());
         //ex1) deptList() 기능메서드를 통해 ArrayList<Dept>데이터를 담아서
         //		데이터 건수와 두번째 부서이름을 출력하세요..
//         Dept d = new Dept(rs.getInt(0),rs.getString(1),rs.getString(2));
//         dlist.add(d);
//     	}
//     	System.out.println("객체의 갯수 : "+dlist.size());
//     	System.out.println("두번째 부서 이름 : "+ dlist.get(1).getDeptno());
         
      // 4. 자원의 해제
         rs.close();
         stmt.close();
         con.close();
      // 5. 예외 처리
      } catch (SQLException e1) {
         // TODO Auto-generated catch block
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
   // ex) emp5
   //public ArrayList<Emp5> elist2(int part){

// 조회 처리 메서드.. (매개변수 없는 처리)
   public ArrayList<Emp> empList(String ename, String job){
      ArrayList<Emp> list = new ArrayList<Emp>();
      // 1. 공통메서드 호출
      try {
         setCon();
      // 2. Statement 객체 생성 (연결객체 - Connection)
         String sql = "	SELECT *\r\n"
         		+ "	from emp2 e\r\n"
         		+ "	WHERE ename like '%'||upper('"+ ename+"')||'%'\r\n"
         		+ "	AND job LIKE '%'||upper('"+job+"')||'%'"
         		+ " ORDER BY empno desc";
         stmt = con.createStatement();
      // 3. ResultSet 객체 생성 (대화객체 - Statement)
         rs = stmt.executeQuery(sql);
         /*
         System.out.println(rs.next());
      // 1행의 데이터가 있는지 여부 확인
      // 1행의 데이터를 사용할 준비
         System.out.println("1행 1열: " + rs.getInt(1));
         System.out.println("1행 2열: " + rs.getString(2));
      // rs.get데이터 유형(컬럼의 순서)
         System.out.println(rs.next());
      // 2행의 데이터가 있는지 여부 확인
      // 2행의 데이터를 사용할 준비
         
      System.out.println("2행 JOB열: " + rs.getString("JOB"));
      //rs.get데이터유형(컬럼명)
      System.out.println("2행 SAL열: " + rs.getDouble("SAL"));
       */
         int cnt=1;
         while(rs.next()) {
        	 
        	 System.out.print(cnt++ + ":" + rs.getInt(1)+"\t");
        	 System.out.print(rs.getString("ename")+"\t");
        	 System.out.print(rs.getString("job")+"\t");
        	 System.out.print(rs.getInt("mgr")+"\t");
        	 System.out.print(rs.getDate("hiredate")+"\t");
        	 System.out.print(rs.getDouble("sal")+"\t");
        	 System.out.print(rs.getDouble("comm")+"\t");
        	 System.out.print(rs.getInt("deptno")+"\n");
        	
        	 //1. 객체 생성과 할당.
        	 Emp e = new Emp(rs.getInt("empno"),rs.getString(2),
        			 rs.getString(3),rs.getInt(4),rs.getDate("hiredate"),
        			 rs.getDouble(6),rs.getDouble(7),rs.getInt(8));
        	 //2. ArrayList에 할당.
        	 list.add(e);
        	 
         }
         System.out.println("객체의 갯수:"+list.size());
         System.out.println("첫번째 행의 ename : "+list.get(0).getEname());
         System.out.println("두번째 행의 ename : "+list.get(1).getEname());
         //ex1) deptList() 기능메서드를 통해 ArrayList<Dept>데이터를 담아서
         //		데이터 건수와 두번째 부서이름을 출력하세요..
//         Dept d = new Dept(rs.getInt(0),rs.getString(1),rs.getString(2));
//         dlist.add(d);
//     	}
//     	System.out.println("객체의 갯수 : "+dlist.size());
//     	System.out.println("두번째 부서 이름 : "+ dlist.get(1).getDeptno());
         
      // 4. 자원의 해제
         rs.close();
         stmt.close();
         con.close();
      // 5. 예외 처리
      } catch (SQLException e1) {
         // TODO Auto-generated catch block
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

// ex) emp5
   //public ArrayList<Emp5> elist2(int part){
/*
# PreparedStatement 객체 활용하기.
1. SQL의 틀을 미리 정해놓고, 나중에 값을 지정하는 방식.
	select *
	from emp
	where ename like'%'||?||'%'
	and job like '%'||?||'%'
	pstmt.setString(1,"홍");	 ?의 순서 1부터 붙여서 사용한다.
	pstmt.setString(2,"A");
 2. 왜 사용하는가 ?
 	1) sql injection을 막기위해 사용된다.
 	2) db 서버의 sql 해석 속도를 향상시켜 빠른 처리를 한다.
 	
 */
// 조회 처리 메서드.. (매개변수 있는 처리)
   public ArrayList<Emp> empList2(String ename, String job){
      ArrayList<Emp> list = new ArrayList<Emp>();
      // 1. 공통메서드 호출
      try {
         setCon();
      // 2. Statement 객체 생성 (연결객체 - Connection)
         String sql = "	SELECT *\r\n"
         		+ "	from emp2 e\r\n"
         		+ "	WHERE ename like '%'||upper( ? )||'%'\r\n"
         		+ "	AND job LIKE '%'||upper( ? )||'%'"
         		+ " ORDER BY empno desc";
         
         System.out.println(sql);
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, ename);
         pstmt.setString(2, job);
         rs = pstmt.executeQuery(sql);
         /*
         System.out.println(rs.next());
      // 1행의 데이터가 있는지 여부 확인
      // 1행의 데이터를 사용할 준비
         System.out.println("1행 1열: " + rs.getInt(1));
         System.out.println("1행 2열: " + rs.getString(2));
      // rs.get데이터 유형(컬럼의 순서)
         System.out.println(rs.next());
      // 2행의 데이터가 있는지 여부 확인
      // 2행의 데이터를 사용할 준비
         
      System.out.println("2행 JOB열: " + rs.getString("JOB"));
      //rs.get데이터유형(컬럼명)
      System.out.println("2행 SAL열: " + rs.getDouble("SAL"));
       */
         int cnt=1;
         while(rs.next()) {
        	 
        	 System.out.print(cnt++ + ":" + rs.getInt(1)+"\t");
        	 System.out.print(rs.getString("ename")+"\t");
        	 System.out.print(rs.getString("job")+"\t");
        	 System.out.print(rs.getInt("mgr")+"\t");
        	 System.out.print(rs.getDate("hiredate")+"\t");
        	 System.out.print(rs.getDouble("sal")+"\t");
        	 System.out.print(rs.getDouble("comm")+"\t");
        	 System.out.print(rs.getInt("deptno")+"\n");
        	
        	 //1. 객체 생성과 할당.
        	 Emp e = new Emp(rs.getInt("empno"),rs.getString(2),
        			 rs.getString(3),rs.getInt(4),rs.getDate("hiredate"),
        			 rs.getDouble(6),rs.getDouble(7),rs.getInt(8));
        	 //2. ArrayList에 할당.
        	 list.add(e);
        	 
         }
         System.out.println("객체의 갯수:"+list.size());
         System.out.println("첫번째 행의 ename : "+list.get(0).getEname());
         System.out.println("두번째 행의 ename : "+list.get(1).getEname());
         //ex1) deptList() 기능메서드를 통해 ArrayList<Dept>데이터를 담아서
         //		데이터 건수와 두번째 부서이름을 출력하세요..
//         Dept d = new Dept(rs.getInt(0),rs.getString(1),rs.getString(2));
//         dlist.add(d);
//     	}
//     	System.out.println("객체의 갯수 : "+dlist.size());
//     	System.out.println("두번째 부서 이름 : "+ dlist.get(1).getDeptno());
         
      // 4. 자원의 해제
         rs.close();
         pstmt.close();
         con.close();
      // 5. 예외 처리
      } catch (SQLException e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
         System.out.println(e1.getMessage());
      }catch(Exception e) {
    	  System.out.println(e.getMessage());
      }
      
      return list;
   }

// ex) Dept를 조회하는 메서드를 선언하세요 Dept VO객체 활용
   // ex)select * from dept2; 처리
   public ArrayList<Dept> deptList(){
      ArrayList<Dept> dlist = new ArrayList<Dept>();
      // 1. 연결
      try {
    	setCon();  
      // 2. 대화
    	String sql = "select * from dept2";
    	stmt = con.createStatement();
      // 3. 결과
    	rs=stmt.executeQuery(sql);
    	while(rs.next()) {	//행단위 변경
    		System.out.print(rs.getInt(1)+"\t");
    		System.out.print(rs.getString(2)+"\t");
    		System.out.println(rs.getString("loc"));
    		dlist.add(new Dept(rs.getInt(1),rs.getString(2),rs.getString(3)));
    		
    	}
    	System.out.println("데이터의 건수 : "+ dlist.size());
    	System.out.println("두번째 행의 부서명 : "+ dlist.get(1).getDname());
      // 4. 자원해제 : 마지막부터 없애준다.
    	rs.close();
    	stmt.close();
    	con.close();
      // 5. 예외처리
      }catch(SQLException e) {
    	  e.printStackTrace();
    	  System.out.println(e.getMessage());
      }catch(Exception e) {
    	  System.out.println(e.getMessage());
      }
      return dlist;
   }
   
   public ArrayList<Dept> deptList(Dept sch){
	   ArrayList<Dept> dlist = new ArrayList<Dept>();
	   //1. 연결
	   try {
		   setCon();
	   //2. 대화  sql
		   String sql="SELECT * \r\n"
		   		+ "from dept2\r\n"
		   		+ "WHERE dname LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
		   		+ "AND loc LIKE '%'||'"+sch.getLoc()+"'||'%'";
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
	   }catch(Exception e) {
		   e.printStackTrace();
		   System.out.println("## 일반 예외 ##");
		   System.out.println(e.getMessage());
	   }
	
	   return dlist;
   }
   public ArrayList<jobSalary> jobSalList(int salary){
	   ArrayList<jobSalary> list = new ArrayList<jobSalary>();
	   try {
		   //1.연결
		   setCon();
		   //2, 대화
		   String sql="select job, count(*) 사원수,\r\n"
		   		+ "round(avg(sal)) avgsal\r\n"
		   		+ "from emp2 e\r\n"
		   		+ "group by job\r\n"
		   		+ "having round(avg(sal))>=2000\r\n"
		   		+ "order by job";
		   
		   stmt=con.createStatement();
		   //3. 결과
		   rs=stmt.executeQuery(sql);
		   while(rs.next()) {
			   list.add(new jobSalary(rs.getString(1),
					   rs.getInt(2),rs.getInt(3)));
		   }
		   //4. 해제
		   rs.close();
		   stmt.close();
		   con.close();
		   //5. 예외 처리
	   }catch(SQLException e) {
		   e.printStackTrace();
		   System.out.println(e.getMessage());
	   }catch(Exception e) {
		   System.out.println(e.getMessage());
	   }
	   return list;
   }
   
   
   
   
   /*
   public Emp getEmp2(ArrayList<Emp> a) {
      double[] sal;
      int[] deptno;
      double msal = 0,  mtmp10 = 0,mtmp20 = 0;
      double asal = 0, atmp10 = 0,atmp20 = 0;
      for (int i=0;i<a.size();i++) {
         if(a.get(i).getSal() > mtmp10)
            mtmp10 = a.get(i).getSal();
         atmp10 += a.get(i).getSal();
      }
      atmp10 = atmp10/a.size();
      e.setDeptno(deptno);
      e.setSal(sal);
      return ;
   }
   */
   // ex) emp3
   public ArrayList<Emp3> elist(int msal){
      ArrayList<Emp3> elist=null;
      return elist;
   }
   // ex) emp4
   public ArrayList<Emp4> elist(int fromDate, int toDate){
      ArrayList<Emp4> emplist = null;
      
      return emplist;
   }
   // ex) emp5
   //public ArrayList<Emp5> elist2(int part){

/*
1. sql작성
2. VO 객체 생성
3. 기능 메서드 선언.
	1) 요청에 의한 입력 : 매개변수로 활용.
	2) 데이터의 결과에 따라 리턴값 지정.
		- update, delete, insert : void
			ex) public void insetEmp(Emp ins)
		- 단위 변수나 한개의 데이터
			ex)
			회원이 등록된 여부
			public boolean void isMember(String id, String pass)
			상품의 갯수 : select count(*) from member where...
			public int memCount(Member sch)
			회원 상세정보 : select * from member where id=@@@
			public Member getMember(String id)
		- 여러개의 데이터
			ex)
			공지사항
			public ArrayList<Board> boardList(Board sch)
			회원정보리스트
			public ArrayList<Member> mlist(Member sch)
			
		
*/
   
   /*
1. sql작성
2. VO 객체 생성
3. 기능 메서드 선언.
	1) 요청에 의한 입력 : 매개변수로 활용.
	2) 데이터의 결과에 따라 리턴값 지정.
		- update, delete, insert : void
			ex) public void insetEmp(Emp ins)
		- 단위 변수나 한개의 데이터
			ex)
			회원이 등록된 여부
			public boolean void isMember(String id, String pass)
			상품의 갯수 : select count(*) from member where...
			public int memCount(Member sch)
			회원 상세정보 : select * from member where id=@@@
			public Member getMember(String id)
		- 여러개의 데이터
			ex)
			공지사항
			public ArrayList<Board> boardList(Board sch)
			회원정보리스트
			public ArrayList<Member> mlist(Member sch)
			
		
*/
   
   // ex) emp5
   //public ArrayList<Emp5> elist2(int part){

// ex) emp5
   //public ArrayList<Emp5> elist2(int part){

// 조회 처리 메서드.. (매개변수 없는 처리)
   public ArrayList<Member5> memberList(String id, String name){
      ArrayList<Member5> list = new ArrayList<Member5>();
      // 1. 공통메서드 호출
      try {
         setCon();
      // 2. Statement 객체 생성 (연결객체 - Connection)
         String sql = "	SELECT * \r\n"
         		+ "FROM member5\r\n"
         		+ "WHERE id LIKE '%'||'"+ id +"'||'%'\r\n"
         		+ "AND name LIKE '%'||'"+name+"'||'%'";
         stmt = con.createStatement();
      // 3. ResultSet 객체 생성 (대화객체 - Statement)
         rs = stmt.executeQuery(sql);
         while(rs.next()) {

		 Member5 m =new Member5(	rs.getString(1), 
				 					rs.getString(2),rs.getString(3),
									rs.getInt(4), rs.getString(5), 
									rs.getDate(6), rs.getString(7));
        	 //2. ArrayList에 할당.
        	 list.add(m);     	 
         }
         System.out.println("데이터 건수 : "+list.size());
         System.out.println("두번째행 : "+list.get(1).getName());
         //ex1) deptList() 기능메서드를 통해 ArrayList<Dept>데이터를 담아서
         //		데이터 건수와 두번째 부서이름을 출력하세요..
//         Dept d = new Dept(rs.getInt(0),rs.getString(1),rs.getString(2));
//         dlist.add(d);
//     	}
//     	System.out.println("객체의 갯수 : "+dlist.size());
//     	System.out.println("두번째 부서 이름 : "+ dlist.get(1).getDeptno());
         
      // 4. 자원의 해제
         rs.close();
         stmt.close();
         con.close();
      // 5. 예외 처리
      } catch (SQLException e1) {
         // TODO Auto-generated catch block
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
   /*
    INSERT INTO emp2 values(
	emp21_seq.nextval,'홍길동','사원',7780,
	to_date('2021/05/01','YYYY/MM/DD'),
	3500,100,10)
    */
public void insertEmp(Emp ins) {
	   
	   try {
		   setCon();
		   stmt = con.createStatement();
		   String sql = "INSERT INTO emp2 values(emp21_seq.nextval,"
		   		+ "'"+ins.getEname()+"',"
		   		+ "'"+ins.getJob()+"',"
   				+ ""+ins.getEmpno()+","
		   		+ "to_date('"+ins.getHiredate_s()+"', 'YYYY-MM-DD'),"
   				+ ""+ins.getSal()+","+ins.getComm()+","
				+ ""+ins.getDeptno()+")";
		   
		   System.out.println("####");
		   System.out.println(sql);
		   stmt.executeUpdate(sql);
		   con.commit();
		   stmt.close();
		   con.close();
		   
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db 처리 에리");
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반에러");
		}
   }

   // ex) emp5
   //public ArrayList<Emp5> elist2(int part){

/*
    INSERT INTO emp2 values(
	emp21_seq.nextval,'홍길동','사원',7780,
	to_date('2021/05/01','YYYY/MM/DD'),
	3500,100,10)
    */
public void updateEmp(Emp upt) {
	   
	   try {
		   setCon();
		   con.setAutoCommit(false);
		   
		   String sql = "UPDATE EMP2\n"
		   		+ "   SET ename = ?,\n"
		   		+ "   	   job = ?,\n"
		   		+ "   	   mgr = ?,\n"
		   		+ "   	   hiredate = to_date(?, 'YYYY-MM-DD'),\n"
		   		+ "   	   sal = ?,\n"
		   		+ "   	   comm = ?,\n"
		   		+ "   	   deptno = ?\n"
		   		+ "WHERE empno = ?";
		   
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, upt.getEname());
		   pstmt.setString(2, upt.getJob());
		   pstmt.setInt(3, upt.getMgr());
		   pstmt.setString(4, upt.getHiredate_s());
		   pstmt.setDouble(5, upt.getSal());
		   pstmt.setDouble(6, upt.getComm());
		   pstmt.setInt(7, upt.getDeptno());
		   pstmt.setInt(8, upt.getEmpno());
		   
		   pstmt.executeUpdate();
		   		   
		   con.commit();
		   pstmt.close();
		   con.close();
		   
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반에러");
		}
}

// ex) emp5
   //public ArrayList<Emp5> elist2(int part){

// ex) emp5
   //public ArrayList<Emp5> elist2(int part){

/*
    INSERT INTO emp2 values(
	emp21_seq.nextval,'홍길동','사원',7780,
	to_date('2021/05/01','YYYY/MM/DD'),
	3500,100,10)
    */
public void deleteEmp(int empno) {
	   
	   try {
		   setCon();
		   con.setAutoCommit(false);
		   
		   String sql = "DELETE FROM emp2 WHERE empno=?";
		   
		   pstmt = con.prepareStatement(sql);
		   pstmt.setInt(1, empno);
		   
		   pstmt.executeUpdate();
		   		   
		   con.commit();
		   pstmt.close();
		   con.close();
		   
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db 처리 에러");
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반에러");
		}
}

/*
    INSERT INTO dept2 values(
	10,'ACCOUNT','NEW YORK')
    */
   public void insertDept(Dept ins) {
	   //1. 접속 autocommit(false)
	   try {
		   setCon();
		   //2. 대화
		   stmt = con.createStatement();
		   String sql = "    INSERT INTO dept2 values(\r\n"
		   		+ "	'"+ins.getDeptno()+"','"+ins.getDname()+"','"+ins.getLoc()+"')";
		   System.out.println("###");
		   System.out.println(sql);
		   stmt.executeUpdate(sql);
		   con.commit();
		   stmt.close();
		   con.close();
		   //3. commit
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

   //SELECT * FROM emp2 where empno=7369;
   
// ex) emp5
   //public ArrayList<Emp5> elist2(int part){

/*
    INSERT INTO dept2 values(
	10,'ACCOUNT','NEW YORK')
    */


// ex) emp5
   //public ArrayList<Emp5> elist2(int part){
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
// ex) emp5
   //public ArrayList<Emp5> elist2(int part){

// ex) emp5
   //public ArrayList<Emp5> elist2(int part){

public static void main(String[] args) {
      // TODO Auto-generated method stub
      A01_Dao dao = new A01_Dao();
      ArrayList<Emp> elist = dao.empList2("","");
      System.out.println("크기 : "+elist.size());
      System.out.println("첫번째 : " +elist.get(0).getEname());
//      Emp ins = new Emp(0,"김길동4","대리",7800,"2010/12/12",4000,100,20);
//      dao.insertEmp(ins);
		
//		A01_Dao dao = new A01_Dao();
//		Dept ins = new Dept(10,"회계","서울 강남");
//		dao.insertDept(ins);
      
      
      //dao.empList();
      //dao.deptList();
     // dao.empList("","");
     //dao.deptList(new Dept("",""));
      //dao.jobSalList(0);
      //dao.memberList("", "");
   }
   
   //}
}