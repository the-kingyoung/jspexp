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
 # jstl을 통한 검색 처리 
 1. useBean이용, 검색/dao 호출 
 2. forEach를 통한 처리 
 
--%>
//
   $(document).ready(function(){
	   
   });
</script>
</head>
<body>
   <h3>사원검색</h3>
   <form method="post">
   <table>
      <tr><th>사원명</th><td><input name="ename" value="${param.ename}"></td></tr>
      <tr><th>직책</th><td><input name="job" value="${param.job}"></td></tr>
      <tr><td colspan="2"><input type="submit" value="검색"></td></tr>
   </table>
   </form>
   <%--
   ?ename=@@&job=@@@
   ${param.ename},${param.job}를 통해서 요청값을 받는다.
   
   el에서 사용하는 요청값을 null일때는 ""으로 자동 변환 처리하여 nullpointerexception을 방지해준다.
   
   useBean을 통해서 dao 객체 생성..
   <c:set var="empList" value="${dao.empList2(param.ename,param.job)}">
   
   새로운 변수 empList에 요청값과 dao의 검색메서드를 통해서
   결과 ArrayList<Emp>를 할당 처리.
   
    --%>
   <jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"></jsp:useBean>
   <c:set var="empList" value="${dao.empList(param.ename,param.job)}"></c:set>
   <%--
   A01_Dao dao = new A01_Dao();
   ArrayList<Emp> empList = 
   		dao.empList21(request.getParameter("ename"),
   					  request.getParameter("job"));
    --%>
   <table>
	    <caption style="text-align:left">총건수: ${empList.size()}</caption>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책</th>
			<th>관리자번호</th>
			<th>입사일</th>
			<th>연봉</th>
			<th>보너스</th>
			<th>부서번호</th>
		</tr>
		<c:forEach var="emp" items="${empList}">
		<tr>
			<td>${emp.empno}</td>
			<td>${emp.ename}</td>
			<td>${emp.job}</td>
			<td>${emp.mgr}</td>
			<td>${emp.hiredate}</td>
			<td>${emp.sal}</td>
			<td>${emp.comm}</td>
			<td>${emp.deptno}</td>
		</tr>
		</c:forEach>
   </table>
   
	<%--
	회원리스트 검색처리
	 --%>
	 
	<h3>멤버 검색</h3>
   <form method="post">
   <table>
      <tr><th>아이디</th><td><input name="id" value="${param.id}"></td></tr>
      <tr><th>이름</th><td><input name="name" value="${param.name}"></td></tr>
      <tr><td colspan="2"><input type="submit" value="검색"></td></tr>
   </table>
   </form>
   <jsp:useBean id="memDao" class="jspexp.a03_database.A01_Dao"></jsp:useBean>
   <c:set var="memList" value="${dao.memberList(param.id,param.name)}"></c:set>
   <table>
	    <caption style="text-align:left">총건수: ${memList.size()}</caption>
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>포인트</th>
			<th>주소</th>
			<th>등록일</th>
			<th>권한</th>
		</tr>
		<c:forEach var="mem" items="${memList}">
		<tr>
			<td>${mem.id}</td>
			<td>${mem.pass}</td>
			<td>${mem.name}</td>
			<td>${mem.point}</td>
			<td>${mem.address}</td>
			<td>${mem.regdte}</td>
			<td>${mem.auth}</td>
		</tr>
		</c:forEach>
   </table>
</body>
</html>