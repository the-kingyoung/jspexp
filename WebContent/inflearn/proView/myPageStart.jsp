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
<title>Mypage select</title>
<link type ="text/css" rel="stylesheet" href="${path}/inflearn/proView/cssfile.css">
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<h3 align="center">Mypage</h3>
<div class="selectBox">
	<a href="myInfo.jsp" class="goMyInfo"><span class="text">나의 정보</span></a>
	<a href="myWrite.jsp" class="goMyWrite"><span class="text">내가 쓴 게시글</span></a>
	<a href="myReply.jsp" class="goMyReply"><span class="text">내가 쓴 댓글</span></a>

</div>
</body>
</html>