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

	$(document).ready(function() {
		$("#regBtn").on("click", function() {
			// location.href="${path}/empInsert.do";
			// # jquery에서는 js코드를 사용가능
			$(location).attr("href", "${path}/prodIns.do");
		});

		$(".data").on("dblclick", function() {
			var pno = $(this).children().eq(0).text();
			location.href = "${path}/prodDetail.do?pno=" + pno;

		});
	});
</script>
</head>
<body>
	<h3>제목</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><th>가격</th>
			<td><input name="fr_price" value="${param.fr_price}"/>~
				<input name="to_price" value="${param.to_price}"/>
			</td></tr>
		<tr><td colspan="2"> <input type="submit" value="조회">
		<input type="button" value="등록" id="regBtn"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th>
			<th>등록일</th><th>생산지</th><th>최근입고일</th><th>입고담당자</th></tr>
			<c:forEach var="prod" items="${plist}">
			<tr class="data">
				<td>${prod.pno}</td>
				<td>${prod.name}</td>
				<td>${prod.price}</td>
				<td>${prod.cnt}</td>
				<td><fmt:formatDate value="${prod.credte}"/></td>
				<td>${prod.company}</td>
				<td><fmt:formatDate value="${prod.incomedate}"/></td>
				<td>${prod.inmanager}</td>
			</tr>
			</c:forEach>
	</table>
	<%--MVC패턴은 jsp에서 시작 x,
		controller를 호출하면 jsp가 호출된다. --%>
</body>
</html>