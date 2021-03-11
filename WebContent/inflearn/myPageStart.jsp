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
<style type="text/css">
.selectBox{
	width:30vw;
	height:30vh;
	background-color:white;
	margin : 0 auto;
	border:2px solid lightgray;
}
.selectBox>.goMyInfo{
	display : block;
	width : 70%;
	height : 48px;
	border : 1px solid #cd595a;
	background-color : #cd595a;
	border-radius : 3px;
	text-align:center;
	font-size:0;
	margin:60px 85px;
}
.selectBox>.goMyInfo>.text{
	display: inline-block;
    height: 100%;
    font-weight: 700;
    font-size: 17px;
    color: white;
    line-height: 51px;
    text-align: center;
    font-family: 돋움, Arial, sans-serif;
}
.selectBox>.goMyWrite{
	display : block;
	width : 70%;
	height : 48px;
	border : 1px solid gray;
	background-color : gray;
	border-radius : 3px;
	text-align:center;
	font-size:0;
	margin:0px 85px;
}
.selectBox>.goMyWrite>.text{
	display: inline-block;
    height: 100%;
    font-weight: 700;
    font-size: 17px;
    color: white;
    line-height: 51px;
    text-align: center;
    font-family: 돋움, Arial, sans-serif;
}

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
	<a href="myWrite.jsp" class="goMyWrite"><span class="text">내가 쓴 글</span></a>

</div>
</body>
</html>