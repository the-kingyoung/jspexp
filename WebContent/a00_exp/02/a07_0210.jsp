<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
    %>
   
<%request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<%--
[하] 1. 데이터의 등록과 상세처리 프로세스의 순서에 대하여 기술하세요.
	# 데이터 등록
	1. 사용자 화면 interface 결정 - 요구사항에 의해 화면 설계
	2. 등록 기능 버튼 클릭과 함께 등록화면 호출 및 구현
		1) 입력값에 대한 validation js로 처리
		2) 전송 후, 요청값에 대한 확인
		3) 요청값 내용 담는 DTO(Data Transaction Object)객체 작성 및 VO객체에 담기.
	3. DAO 작성
		1) 공통 : 필드, 연결메서드
		2) insert기능메서드 구현
			- 연결
			- setAutocommit(false)
			- sql 작성 및 매개값 문자열로 concat
				숫자형 " +dto.getXXX()+"
				문자열형 '"+dto.getXXX()+"'
			- stmt.executeQuery(sql)
			- con.commit()
			- 예외처리
				con.rollback();
	4. js
		정상입력처리 alert("등록성공")
	
	# 상세처리 프로세스
	1. 화면에서 상세처리를 위한 사용자 인터페이스 결정
	2. js로 함수정의 매개값으로 key 전달 onclick="go(<%=key%>)"
		전달할 데이터가 문자열인 경우와 숫자인 경우 반드시 구분하여 처리할 것!!!!!!!!!!!!!!
	3. location.href="이동할페이지?key="+전달 key값;
	4. 이동한 페이지에서 key값으로 요청값 받아서 정상여부 확인.
	5. DAO 작성.
		1) return이 단일객체인 메서드와 key 매개변수로 처리되는 메서드 구현
			public Vo detail(키){
				Vo객체 참조변수 = null;
				return 참조변수
			}
		2) 연결
		3) sql처리
		4) 대화객체
		5) resultset
		6) if(rs.next)
		7) 참조변수 = new VO객체생성자(rs.getXXX()./.....);
		8) 자원해제
		9) 예외처리.
		
	6. jsp에서 dao호출 입력값 전달 처리
		1) VO객체 getXXX() 메서드 value=""로 할당처리.


	

		1) 화면 인터페이스 구현
			- 등록 버튼을 통해서 등록페이지로 이동시킨다.
		2) 등록페이지 화면 구성
			- 등록할 항목을 form 객체를 통해서 등록, 요청값 확인
		3) 데이터 처리
			sql작성
			DAO공통
			기능메서드 public void insertEmp(Emp e){}
				- 접근 con의 autoCommit(false)로 처리를 한다.
				- 대화객체.executeUpdate(sql)로 실행시킬 sql을 설정
				- commit() 확정명령을 해주고
				- 자원해제
				- 예외처리 .rollback()
		4) jsp
			- 요청 처리 페이지를 구현!
			- DAO객체를 호출하고
			- 요청값을 Emp에 할당 처리
			- Dao 기능메서드 호출 처리를 완료한다.

[하] 2. 부서 상세 정보를 처리하세요.
======================================searchDeptList dept리스트(더블클릭으로 상세정보를 알수 있다)=============================================
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A02_DeptDao"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<%
   String dname = request.getParameter("dname");
   String loc = request.getParameter("loc");
   if(dname==null) dname = "";
   if(loc==null) loc = "";
   log("#### dname:"+dname);
   log("#### loc:"+loc);
%>
<body>
   <h3>부서정보검색</h3>
   <form method="post">
   <table>
      <tr><th>부서명</th>
         <td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
      <tr><th>지역</th>
         <td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
      <tr><td colspan="2">
      	<input type="submit" value="검색"/>
      	<input type="button" value="등록" onclick="location.href='a20_deptInsForm.jsp'"/></td></tr>
   </table>
   </form>
<%   
   A02_DeptDao dao = new A02_DeptDao();
   ArrayList<Dept> dlist = dao.deptList(new Dept(dname, loc));
%>
   <table>
      <tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
      <%for(Dept d:dlist){%>
      	<tr ondblclick="detail(<%=d.getDeptno()%>)">
      		<td><%=d.getDeptno()%></td>
      		<td><%=d.getDname()%></td>
            <td><%=d.getLoc()%></td></tr>
      <%}%>
   </table>   
   <script>
   	function detail(deptno){
   		alert("요청 부서 번호 : " +deptno);
   		location.href = "a12_deptDetail.jsp?deptno="+deptno;
   	}
   </script>
</body>
</html>

======================================deptDetail 더블클릭후 넘어온 상세화면(다시 메인페이지로 이동이 가능하다)=======================================
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A02_DeptDao"
    %>
<%request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<%
String deptno = request.getParameter("deptno");
A02_DeptDao dao = new A02_DeptDao();

Dept dept = dao.getDept(new Integer(deptno));
%>
<body>
	<h3>[<%=deptno %>]부서 정보</h3>
	<from method="post">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%=dept.getDeptno()%>"></td></tr>
		<tr><th>부서이름</th><td><input type="text" name="dname" value="<%=dept.getDname()%>"></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="<%=dept.getLoc()%>"></td></tr>
		<tr><td colspan="2">
		<input type="button" value="수정"/>
		<input type="button" value="삭제"/>
		<input type="button" value="메인페이지이동" onclick="location.href='a04_searchDeptList.jsp'"/>
		
	</table>
	</from>
</body>
</html>
======================================deptDao 상세화면을 나타낼 수 있는 Dao========================================================
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
=====================================================================================================================
[중] 3. 쇼핑몰에서 관리자 현재 등록된 물건을 확인하고, 물건을 등록하고, 물건을 상세정보를 출력하는 웹화면을 구현하세요.

        물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일,제조사, 최근입고일, 입고책임자
        조회화면 출력 : 제품번호, 물건명, 물건가격, 물건재고량, 최근입고일 조회조건(물건명, 물건가격 from,to)
=====================================================================================================================
1) 조회화면
2) sql 작성

 --%>
<%
	A02_Exp Dao =new A02_Exp();						//A02_Exp를 담는 객체 Dao를 생성한다.
	ArrayList<Pinfo> plist = null;		//Dao객체에 있는 plist()를 실행하고 그에 반환값을 plist<-(ArrayList<Pinfo>)에 담는다
	
	
	String pname = request.getParameter("pname");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	if(pname==null && from == null && to == null){
		plist = Dao.pList();
	} else if( pname != null && from == null && to == null){
		plist = Dao.pList(pname);
	} else if( pname == null && from != null && to != null){
		plist = Dao.pList(from,to);
	} else if(pname != null && from != null && to != null){
		plist = Dao.pList(pname,from,to);
	}
%>
<body>
	<h3>과일 쇼핑몰</h3>
	<form method="post">
	<table>
		<tr><th>과일명</th><td><input type="text" name="pname" value="" style="width:200px"/></td></tr>
		<tr><th>과일가격</th><td><input type="text" name="from" value="" style="width:100px"/>~
			<input type="text" name="to" value="" style="width:100px"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/><input type="button" value="등록하긔" onclick="location.href='reg.jsp'"></td></tr>
	</table>
	</form>
	<h3>제품리스트</h3>
	<table>
		<tr><th>제품번호</th><th>물건명</th><th>물건가격</th><th>물건재고량</th><th>최근입고일</th></tr>
		<%for(Pinfo p : plist){%>
		<tr ondblclick="detail(<%=p.getPnum() %>)">
		<td><%=p.getPnum() %></td>
		<td><%=p.getPname() %></td>
		<td><%=p.getPrice() %></td>
		<td><%=p.getPstock() %></td>
		<td><%=p.getPrereg() %></td>
		
		</tr>
		<%} %>
	</table>
	<script>
		function detail(pnum){
			location.href="fruitDetail.jsp?pnum="+pnum;
		}
	</script>
<%--  ======================================vo Pinfo========================================================
package jspexp.z01_vo;

import java.util.Date;

public class Pinfo {
	private int pnum;
	private String pname;
	private int price;
	private int pstock;
	private Date pnewreg;
	private String pcompany;
	private Date prereg;
	private String pdirector;
	public Pinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pinfo(int pnum, String pname, int price, int pstock, Date pnewreg, String pcompany, Date prereg,
			String pdirector) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.price = price;
		this.pstock = pstock;
		this.pnewreg = pnewreg;
		this.pcompany = pcompany;
		this.prereg = prereg;
		this.pdirector = pdirector;
	}
	public Pinfo(String pname, int price) {
		super();
		this.pname = pname;
		this.price = price;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public Date getPnewreg() {
		return pnewreg;
	}
	public void setPnewreg(Date pnewreg) {
		this.pnewreg = pnewreg;
	}
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public Date getPrereg() {
		return prereg;
	}
	public void setPrereg(Date prereg) {
		this.prereg = prereg;
	}
	public String getPdirector() {
		return pdirector;
	}
	public void setPdirector(String pdirector) {
		this.pdirector = pdirector;
	}
	
	

}
======================================Dao========================================================
package jspexp.a03_database;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

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

	//검색어 가져오기
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

	//가격 가져오기
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
	
	
	
	public static void main(String[] args) {
		A02_Exp p=new A02_Exp();
		ArrayList<Pinfo> pp = p.reg(50, "포도", 700000, 150,
				"2020/03/21", "아시아컴퍼니", "2021/02/20", "이나");
		for(Pinfo o : pp) {
			System.out.println(o.getPname());
		}
	}
}
 ======================================fruitDetail page========================================================
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
    %>
<%request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<%
	String pnum = request.getParameter("pnum");
	A02_Exp Dao =new A02_Exp();
	ArrayList<Pinfo> p = Dao.pList(new Integer(pnum));
	
%>
<body>
	<h3>과일 디테일</h3>
	<table>
		<tr><th>고유번호</th><th>과일이름</th><th>가격</th><th>재고량</th><th>신규등록일</th><th>제조사</th><th>최근입고일</th><th>책임자</th></tr>
		<%for(Pinfo pp : p){ %>
		<tr>
			<td><%=pp.getPnum() %></td>
			<td><%=pp.getPname() %></td>
			<td><%=pp.getPrice() %></td>
			<td><%=pp.getPstock() %></td>
			<td><%=pp.getPnewreg() %></td>
			<td><%=pp.getPcompany() %></td>
			<td><%=pp.getPrereg() %></td>
			<td><%=pp.getPdirector() %></td>
		</tr>
		<%} %>
	</table>

</body>
</html>
 ======================================reg page========================================================
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
    %>
<%request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
 <%
 	String pnum = request.getParameter("pnum");
 	if(pnum==null) pnum="";
 	String pname = request.getParameter("pname");
 	if(pname==null) pname="";
 	String price = request.getParameter("price");
 	if(price==null) price="";
 	String pstock = request.getParameter("pstock");
 	if(pstock==null) pstock="";
 	String pnewreg = request.getParameter("pnewreg");
 	if(pnewreg==null) pnewreg="";
 	String pcompany = request.getParameter("pcompany");
 	if(pcompany==null) pcompany="";
 	String prereg = request.getParameter("prereg");
 	if(prereg==null) prereg="";
 	String pdirector = request.getParameter("pdirector");
 	if(pdirector==null) pdirector="";
 	
	A02_Exp Dao =new A02_Exp();
	if(pnum!="" && pname!="" && price!="" && pstock!=""
			 && pnewreg!="" && pcompany!="" && prereg!="" && pdirector!=""){
		Dao.reg(new Integer(pnum), pname, new Integer(price), new Integer(pstock), pnewreg, pcompany, prereg, pdirector);
	}
 %>
<body>
	<h3>제목</h3>
	<form method="post">
	<table>
			<tr><th>과일 번호</th><td><input type="text" name="pnum"/></td></tr>
			<tr><th>과일 이름</th><td><input type="text" name="pname"/></td></tr>
			<tr><th>과일 가격</th><td><input type="text" name="price"/></td></tr>
			<tr><th>과일 재고량</th><td><input type="text" name="pstock"/></td></tr>
			<tr><th>신규 등록일</th><td><input type="text" name="pnewreg"/></td></tr>
			<tr><th>제조사</th><td><input type="text" name="pcompany"/></td></tr>
			<tr><th>최근 입고일</th><td><input type="text" name="prereg"/></td></tr>
			<tr><th>입고책입자</th><td><input type="text" name="pdirector"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="등록" onclick="donot()"/></td></tr>
	</table>
	</form>
	<script type="text/javascript">
				var pnum="<%=pnum%>";
				var pname="<%=pname%>";
				var price="<%=price%>";
				var pstock="<%=pstock%>";
				var pnewreg="<%=pnewreg%>";
				var pcompany="<%=pcompany%>";
				var prereg="<%=prereg%>";
				var pdirector="<%=pdirector%>";
			if(pname!=""){
				alert("제품 등록 완료 !");
				
			if(confirm("조회페이지로 이동하시겠습니까 ? ")){
				location.href="a07_0210.jsp";
			}
		}
			
			function donot(){
				if(pnum=="" || pname=="" || price=="" || pstock==""
					 || pnewreg=="" || pcompany=="" || prereg=="" || pdirector==""){
					alert("모든 항목을 입력해주세요.");
				}
			}
	
	</script>
</body>
</html>


--%>
</body>
</html>