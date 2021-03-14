<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage Info</title>
<link type ="text/css" rel="stylesheet" href="${path}/inflearn/proView/cssfile.css">
<style type="text/css">
</style>
</head>
<body>
<h3 align="center">나의 정보</h3>
<div id="frame01">
	<div class="frame02">
		<table class="myInfoBox">
			<tr><th>아이디</th><td><input type="text" style="border:none;" maxlength="16" readonly="readonly" value="${userInfo.id}"/></td></tr>
			<tr><th>비밀번호</th><td><input type="password" maxlength="16" value="${userInfo.pass}"/></td></tr>
			<tr><th>이메일</th><td><input type="text" maxlength="16" value="${userInfo.email}"/></td></tr>
			<tr><th>전화번호</th><td><input type="text" maxlength="16" value="${userInfo.phonNum}"/></td></tr>
			<tr><th>주소</th><td><input type="text" maxlength="16" value="${userInfo.address}"/></td></tr>
		</table>
		<div class="footer">
			<a href="" class="btn_main">메인으로</a>
			<a href="" class="btn_update">정보수정</a>
		</div>
	</div>
</div>
</body>
</html>