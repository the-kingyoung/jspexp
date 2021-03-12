<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<style type="text/css">
.wFrame1 { 
	width: 70%; 
	background: lightgray; 
	margin: 0 auto; 
	background: white; 
	padding: 30px; 
	color: gray;
}
.wFrame1 > .text-List{
	width: 70%; 
	text-align: center; 
	border : 1px solid lightgray;
	margin:0 auto;
	margin-bottom: 40px;
}
.wFrame1 > .text-List td,th{
	padding: 20px;
}
.wFrame1 > .text-List th{
	background : gray;
	color:white;
}
.wFrame1 > .text-List td{
	border-bottom: 0.5px solid #e9e9e9; 
}

</style>
</head>
<body>

<h3 align="center">내가 쓴 게시글</h3>
	<div class="wFrame1">
		<table class="text-List">
			<col width="10%"><col width="20%"><col width="50%"><col width="20%">
			<tr><th>번호</th><th>게시판</th><th>제목</th><th>작성일</th><tr>
			<tr>
				<td>1</td>
				<td>자유게시판</td>
				<td>안녕하세요</td>
				<td>2021.03.01</td>
			<tr>		
			<tr>
				<td>2</td>
				<td>자바게시판</td>
				<td>질문있습니다</td>
				<td>2021.02.16</td>
			<tr>		
			<tr>
				<td>3</td>
				<td>파이썬게시판</td>
				<td>파이썬 맵 다운받고싶은데요</td>
				<td>2021.01.19</td>
			<tr>		
		</table>
	</div>
<!-- ////////////////////////////////////////////////////////////////////////////////// -->	
	<h3 align="center">내가 쓴 댓글</h3>
	<div class="wFrame1">
		<table class="text-List">
			<col width="10%"><col width="20%"><col width="50%"><col width="20%">
			<tr><th>번호</th><th>게시판</th><th>제목</th><th>작성일</th><tr>
			<tr>
				<td>1</td>
				<td>자유게시판</td>
				<td>저도 사실 코딩 잘모르겠습니다.</td>
				<td>2021.03.17</td>
			<tr>		
			<tr>
				<td>2</td>
				<td>자바게시판</td>
				<td>대단하십니다.</td>
				<td>2021.02.06</td>
			<tr>		
			<tr>
				<td>3</td>
				<td>파이썬게시판</td>
				<td>파이썬은 하나도 모르겠네요 ㅠ</td>
				<td>2021.01.09</td>
			<tr>		
			<tr>
				<td>4</td>
				<td>자바게시판</td>
				<td>저도 아직 못풀었습니다 :(</td>
				<td>2021.01.08</td>
			<tr>		
		</table>
	</div>
</body>
</html>