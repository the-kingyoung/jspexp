package jspexp.a00_exp;

import java.sql.*;

public class A01_0208_Dao {

	public static void main(String[] args) {
/*
[하] 1. jsp화면에서 Database를 처리한 결과를 출력할려고 한다. 처리하는 process를 정리하세요.
	==> 1) 화면구성
			회원리스트
			이름 : [     ]
			권한 : [     ]
			[조회]
			번호	이름	권한	포인트....
		2) 요청값 처리..
		3) DB처리
			- sql 작성 select * from member where name like'%%'..
			- VO 객체 생성.
			- DAO, 공통 connection메서드, 기능 메서드 선언.
				public ArrayList<Member> getMemList(String name, String auth){}
			- 기능 메서드 상세 내용 처리 연결, 대화, 결과처리, 자원해제, 예외처리
		4)) jsp화면
			- Dao import
			- 요청값에 의한 객체 생성 Dao
			- ArrayList<Member> mlist = dao.getMemList(name, auth)
			- for문을 통한 화면 처리.



		1) 데이터베이스 연결처리
		2) 대화
		3) 결과값 받는 객체
		4) 자원의 해제
		5) 예외 처리
		
[하] 2.    SELECT ename, 
        to_char(hiredate,'YYYY') year,
        to_char(hiredate,'MM') month,
        to_char(hiredate,'W') weekyear,
        to_char(hiredate,'DAY') day
       FROM emp
       WHERE to_char(hiredate,'W') = '1';에 해당하는 vo 객체과 DAO 메서드를 선언해보세요.
       
       ==>
       VO 객체
       class EmpExp{
       	private String ename;
		private String year;
		private String month;
		private String weekyear;
		private String day;
		
		생성자
		set/get메서드 생성
       }
       기능 메서드.
       public ArrayList<Member> getMemberList(String weekyear){}
       
       
       
       
       
       package jspexp.z01_vo;

## VO 객체 생성 ##

public class Ex2 {
	private String ename;
	private String year;
	private String month;
	private String weekyear;
	private String day;
	public Ex2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ex2(String ename, String year, String month, String weekyear, String day) {
		super();
		this.ename = ename;
		this.year = year;
		this.month = month;
		this.weekyear = weekyear;
		this.day = day;
	}
	public Ex2(String weekyear) {
		super();
		this.weekyear = weekyear;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getWeekyear() {
		return weekyear;
	}
	public void setWeekyear(String weekyear) {
		this.weekyear = weekyear;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
}
## DAO 메서드 선언 ##
	public ArrayList<Ex2> ex2List(){
		ArrayList<Ex2> elist = null;
		
		return elist;
	}
	 
[하] 4. Connection, Statement, ResultSet 객체의 생성과정을 메서드와 함께 기술하세요.
	==>
	1) Connection : jdbc 드라이버 매니저에 의해 객체 생성 setConn()메서드
		con = DriverManager.getConnection(접속정보, 계정, 비밀번호);
	2) Statement : 생성된 Connection객체의 createStatement() 메서드로 생성된다.
		stmt = con.createStatement();
	3) ResultSet : Statement객체에  의해 executeQuery(sql문) 생성.
		rs = stmt.executeQuery(sql);


	
	public class Example{	//DAO
	1. 데이터베이스 연결 처리
	private Connection con;
	
	2. 대화
	private Statement stmt;
	private PrepareStatement pstmt;
	
	3. 결과값 받는 객체
	private ResultSet rs;
	

[하] 5. ResultSet 객체의 rs.next(), rs.getString()의 기능을 구체적으로 기술하고, while()과의
    관계를 기술하세요.
    
    # rs.next() : 다음 행에 데이터가 있는지 여부를 boolean으로 return 행단위로 이동 처리.
    				1번 호출 첫번째 행으로 커서 이동.
    				2번 호출 두번째 행으로 커서 이동.
    # rs.get컬럼의데이터유형(순서/컬럼명) : 열단위로 이동하여 해당 데이터를 가져오는 처리를 한다.
    
    while(rs.next()){
	    //데이터가 있는 행의 갯수만큼 반복 수행, 호출한 후에 마지막,
	    //블럭(})에서
	    //다시, while(rs.next())계속 호출하여 준다.
	    rs.getString(1); select의 첫번째 컬럼의 문자열 데이터를 가져온다.
	    rs.getInt("empno") : select의 컬럼명이 empno인 정수형 데이터를 가져온다.
    
[중] 6. select * from member를 데이터를 확인하고, 조회되는 메서드를 DAO로 구현하세요.
		1) sql 확인
		2) vo 작성
		3) 메서드 선언
		4) 메서드 상세 내용
			- 연결
			- statement
			- resultset
			- while문
			- 자원해제 
			- 예외처리.

*/
		
		
		
	}

}
