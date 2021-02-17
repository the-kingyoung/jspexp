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
1. 화면구성

2. sql작성
	SELECT *
	FROM EMP200
	WHERE ename like '%'||upper('a')||'%'
	AND job LIKE '%'||upper('e')||'%'

3. vo : Emp200
4. dao단 기능메서드 선언
	public ArrayList<Emp> empList(String ename, String job){}
5. 요청값과 dao기능메서드 매개변수 데이터 처리
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	
6. 화면출력.
 --%>
<%
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	if(ename==null) ename="";
	if(job==null) job="";
	
	Pdao dao = new Pdao();
	ArrayList<Emp200> elist = dao.eList(ename, job);

%>
<body>
	<h3>사원 정보 검색</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/>
		<input type="button" value="등록" onclick="location.href='empInsert.jsp'"/></td></tr>
	</table>
	</form>
	<h3>사원 정보</h3>
	<table>
		<tr>
		<th>사원번호</th><th>사원명</th><th>직책</th><th>부서번호</th>
		</tr>
		<%
			for(Emp200 e : elist){
		%>
		<tr>
			<td><%=e.getEmpno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getJob() %></td>
			<td><%=e.getDeptno() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>