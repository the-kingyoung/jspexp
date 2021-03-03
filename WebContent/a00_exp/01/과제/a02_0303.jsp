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
[JSP]
[하] 1. MVC 패턴에서 list에서 상세화면 처리시, 요청값 처리방식에 대하여 기술하세요
[하] 2. MVC 패턴에서 상세화면에서 수정과 삭제 처리시 요청값의 내용과 조건에 따른 처리를 기술하세요.
[중] 3. MVC 패턴으로 물품 상세화면/수정 처리를 해보세요.
  
[js]
[하] 1. 좋아요/싫어요 버튼을 클릭시, 하단에 하트가♥ 하나씩 늘어나든지/줄어들던지 하세요(단 한번만)
[중] 2. 임의의 구구단 문제를 나오게 하고, 정답확인을 클릭시 정답여부를 나오게 한다.
        5초가 지나도 정답여부를 출력하게 처리하세요.
--%>
//
	$(document).ready(function(){
		$("#favor").one("click","button",function(){
			$("div#show1").append("<h4>♥</h4>");
		});
	});
</script>
</head>
<body>
	<div id="favor">
		<button>좋아요</button>
		<button>싫어요</button>
	</div>
	<div id="show1"></div>
</body>
</html>