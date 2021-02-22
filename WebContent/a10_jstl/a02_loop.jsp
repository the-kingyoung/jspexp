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
# jstl의 반복문 처리.
1. 기본 형식
	<c:forEach var="cnt" begin="시작변수" end="마지막변수" step="증감단위">
2. 기타 옵션..
	1) varStatus="sts"
		${sts.index} : 반복문에서 0부터 시작하는 index를 출력
		${sts.count} : 반복문에서 1부터 시작하는 카운트 출력
		${sts.first} : boolean을 첫번째 값인지 여부를 나타냄..
		${sts.last} : boolean을 마지막 값인지 여부를 나타냄..
--%>
//
   $(document).ready(function(){
      $("h3").text("반복문");
   });
</script>
</head>
<body>
	<h3>제목</h3>
	<h2>1~15까지 출력</h2>
	<c:forEach var="cnt" begin="1" end="15">
		<h4>${cnt}</h4>
	</c:forEach>
	<%--ex1) 1~7까지 출력하면서 h5로 안녕하세요 표시 하세요. --%>
	<%--ex2) 테이블의 열 1열...3열까지 출력하여 표시 하세요. --%>
	<%--ex3) 테이블의 행 1행...3헹까지 출력하여 표시 하세요. --%>
	<%--ex4) 4X4테이블을 출력하여 표시 하세요. --%>
	<c:forEach var="ex1" begin="1" end="7">
		<h5>${ex1}번째 안녕하세요!</h5>
	</c:forEach>
	
	<h5>ex2</h5>
	<table>
	<tr>
		<c:forEach var="row" begin="1" end="3">
			<td>${row}</td>
		</c:forEach>
		</tr>
	</table>
	
	<h5>ex3</h5>
	<table>
		<c:forEach var="col" begin="1" end="3">
			<tr><th>${col}</th><tr>
		</c:forEach>

	</table>
	
	<h5>ex4</h5>
	<table>
	
		<c:forEach var="row" begin="1" end="4">
			<tr>
				<c:forEach var="col" begin="1" end="4">
				<td>${row}행 ${col}열</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>
	
	
	
	
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>