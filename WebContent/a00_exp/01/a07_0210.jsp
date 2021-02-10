<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
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
 --%>
<body>
	<h3>쇼핑몰</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>