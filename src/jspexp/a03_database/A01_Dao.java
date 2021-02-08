package jspexp.a03_database;

import java.sql.*;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Emp3;
import jspexp.z01_vo.Emp4;
import jspexp.z01_vo.Emp5;

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
      }
      // 2. 특정 서버
      //      - 접속 정보 : 드라이버명:@ip:port:sid
      String info = "jdbc:oracle:thin:@localhost:1521:xe";
      try {
         con = DriverManager.getConnection(info, "scott", "tiger");
         System.out.println("접속 성공");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }
   
   public static void main(String[] args) {
      // TODO Auto-generated method stub
      A01_Dao dao = new A01_Dao();
      dao.empList();
   }
   // 조회 처리 메서드.. (매개변수 없는 처리)
   public ArrayList<Emp> empList(){
      ArrayList<Emp> list = null;
      // 1. 공통메서드 호출
      try {
         setCon();
      // 2. Statement 객체 생성 (연결객체 - Connection)
         String sql = "select * from emp";
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
        	 
         }
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
   // ex) Dept를 조회하는 메서드를 선언하세요 Dept VO객체 활용
   // ex)select * from dept; 처리
   public ArrayList<Dept> deptList(){
      ArrayList<Dept> dlist = null;
      // 1. 연결
      try {
    	setCon();  
      // 2. 대화
    	String sql = "select * from dept";
    	stmt = con.createStatement();
      // 3. 결과
    	rs=stmt.executeQuery(sql);
    	while(rs.next()) {	//행단위 변경
    		System.out.print(rs.getInt(1)+"\t");
    		System.out.print(rs.getInt(2)+"\t");
    		System.out.println(rs.getInt("loc"));
    	}
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
   // ex) select * from emp where empno=7780 (empno는 유일키) 처리 메서드
   public Emp getEmp(int empno) {
      Emp e = null;
      return e;
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
      
   //}
}