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