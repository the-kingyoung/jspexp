<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
# 객체형 배열의 list 처리..
1. ArrayList<VO>객체형 데이터를 forEach 구분을 통해서 처리
	1) 데이터만들기 : DAO나 ArrayList<VO>로 만들기
	2) <c:forEach var="단위객체" items="${배열}>
		${단위객체.프로퍼티}

--%>
//
   $(document).ready(function(){

   });
</script>
</head>
<body>
<%
	A01_Dao dao = new A01_Dao();
	pageContext.setAttribute("dlist", dao.deptList());
%>
	<h3>부서정보</h3>
	<table>
		<tr
			><th>부서번호</th><th>부서명</th><th>부서위치</th>
		</tr>
		<c:forEach var="dept" items="${dlist}">
		<tr>
			<td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td>
		</tr>
		</c:forEach>
	</table>
	<%--
	ex1) dao 하위 empList()를 이용해서 화면 출력 처리하세요
	 --%>
<%
pageContext.setAttribute("emplist", dao.empList());
%>
<table>
	<tr>
	<th>사원번호</th><th>사원명</th><th>직책</th><th>관리자번호</th>
		<th>입사일</th><th>급여</th><th>보너스</th><th>부서번호</th>
	</tr>
	<c:forEach var="emp" items="${emplist}">
	<tr>
		<td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td><td>${emp.mgr}</td>
		<td>${emp.hiredate}</td><td>${emp.sal}</td><td>${emp.comm}</td><td>${emp.deptno}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>