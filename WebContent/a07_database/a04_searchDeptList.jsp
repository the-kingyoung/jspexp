<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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
1. 화면구성
2. 요청값 확인
3. sql 작성
SELECT * 
FROM dept
WHERE dname LIKE '%'||upper('e')||'%'
AND loc LIKE '%'||upper('a')||'%';
4. vo
5. Dao : 필드, 공통메서드, 기능메서드
6. 기능메서드 상세내용 처리, main()통해서 확인
7. jsp화면
	1) import
	2) 객체 생성.
	3) 요청값 null에 대한 default설정 ""
	4) DB처리 메서드 호출.
	5) for문을 통한 화면처리.
	
 --%>
 <%
 	String dname = request.getParameter("dname");
 	String loc = request.getParameter("loc");
 	if(dname==null)dname="";
 	if(loc==null)loc="";
 	log("#### dname : "+ dname);
 	log("#### loc : "+ loc);
 	
 %>
<body>
	<h3>부서 정보 검색</h3>
	<form method="post">
	<table>
		<tr><th>부서</th><td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
		<tr><th>지역</th><td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
 <%
 
 	A01_Dao dao = new A01_Dao();
 	ArrayList<Dept> dlist = dao.deptList(new Dept(dname, loc));
 %>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept d : dlist){ %>
		<tr><td><%=d.getDeptno()%></td><td><%=d.getDname()%></td><td><%=d.getLoc()%></td></tr>
		<%} %>
	</table>
</body>
</html>