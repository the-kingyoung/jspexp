package jspexp.a00_exp;

public class A01_0208_Dao {
	
	public static void main(String[] args) {
/*
[하] 1. jsp화면에서 Database를 처리한 결과를 출력할려고 한다. 처리하는 process를 정리하세요.
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
    
    # rs.next() 는 데이터베이스 테이블에서 행의 이동을 뜻하고
    # rs.getString() 는 열의 이동을 뜻한다.
    
[중] 6. select * from member를 데이터를 확인하고, 조회되는 메서드를 DAO로 구현하세요.
*/
		
		
		
	}

}
