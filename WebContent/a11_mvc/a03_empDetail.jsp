<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--


--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
   <h3>사원상세정보[${param.empno}]</h3>
   <form method="post">
      <input type="hidden" name="proc" value=""/>
	<table>
		<c:choose>
			<c:when test="${not empty emp.ename}">
				<tr><th>사원번호</th><td><input type="text" name="empno" value="${emp.empno}"></td></tr>
				<tr><th>사원명</th><td><input type="text" name="ename" value="${emp.ename}"></td></tr>
				<tr><th>직책</th><td><input type="text" name="job" value="${emp.job}"></td></tr>
				<tr><th>관리자번호</th><td><input type="text" name="mgr" value="${emp.mgr}"></td></tr>
				<tr><th>입사일</th><td>
					<input type="text" name="hiredate_s" value="<fmt:formatDate type='date' pattern='yyyy-MM-dd' 
								value='${emp.hiredate}'/>" placeholder="yyyy-MM-dd"></td></tr>
				<tr><th>급여</th><td><input type="text" name="sal" value="${emp.sal}"></td></tr>
				<tr><th>보너스</th><td><input type="text" name="comm" value="${emp.comm}"></td></tr>
				<tr><th>부서번호</th><td><input type="text" name="deptno" value="${emp.deptno}"></td></tr>
			</c:when>
		<c:otherwise>
				<tr><td colspan="2">데이터가 없습니다!</td></tr>
		</c:otherwise>
		</c:choose>
				<tr><td colspan="2">
				<input type="button" value="수정" id="uptBtn"/>
				<input type="button" value="삭제" id="delBtn"/>
				<input type="button" value="메인페이지이동" 
					onclick="location.href='a03_empList.jsp'"/>
	</table>
	</form>
</body>
</html>