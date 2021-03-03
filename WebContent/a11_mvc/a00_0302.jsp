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
	<h3>물건 리스트</h3>
	<%--
	action의 default(설정되지 않았을 때)는 현재 화면을 호출한 jsp, controller을 처리해준다.
	ex) /product.do로 된 controller가 현재 jsp(view)를 호출하였으면
	submit할때도 다시 action="/product.do"로 호출하여 해당 controller에 요청값을 전송한다.
	 --%>
	<form method="post">
	<table>
		<tr><th>부서명</th>
		<td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><th>지역</th>
		<td><input type="text" name="company" value="${param.company}"/></td></tr>
		<tr><td colspan="2">
		<input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>갯수</th>
			<th>신규등록일</th>
			<th>제조사</th>
			<th>최신입고일</th>
			<th>상품담당자</th></tr>
	<c:forEach var = "pro" items="${plist}">
		<tr>
		<td>${pro.pno}</td>
		<td>${pro.name}</td>
		<td>${pro.price}</td>
		<td>${pro.cnt}</td>
		<td>${pro.credte}</td>
		<td>${pro.company}</td>
		<td>${pro.incomedate}</td>
		<td>${pro.inmanager}</td></tr>
	</c:forEach>
	</table>
</body>
</html>