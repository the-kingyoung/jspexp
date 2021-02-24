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
# forTokens
1. 구분자에 의해서 데이터를 처리하는 것을 말한다.
2. 기본 형식
	<c:forTokens var="변수명" items="구분자포함데이터"
		delims="구분자"
		${변수명} : 단위데이터
3. 속성
	1) var : 구분자에 의해서 추출된 하나의 데이터
	2) items : 구분자가 있는 문자열
	3) delims : 구분자

--%>
//
   $(document).ready(function(){

   });
</script>
</head>
<body>
	<h3>구분자처리</h3>
	<c:forTokens var="color" items="red, green, blue"
		delims=",">
		<h2>${color}</h2>	
	</c:forTokens>
<%-- ex) 과일명 사과;오렌지;수박 --%>
<c:set var="cnt" value="1"/>
	<table>
		<c:forTokens var="fruit" items="사과;오렌지;수박;딸기" delims=";" 
			varStatus="sts">
			<c:if test="${cnt%2==1}"><tr></c:if>
				<td>${fruit}[${sts.index}]</td>
			<c:if test="${cnt%2==0}"></tr></c:if>
			<c:set var="cnt" value="${cnt+1}"/>
		</c:forTokens>
	</table>
</body>
</html>