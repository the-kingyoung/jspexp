<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
    %>
<%request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path %>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){

	};
</script>
</head>
<jsp:useBean id="m1" class="jspexp.z01_vo.Member2" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="m1"/>
<body>
	<h3>등록된 회원정보</h3>
	<table>
		<tr><th>아이디</th><td><%=m1.getId() %></td></tr>
		<tr><th>비밀번호</th><td><%=m1.getPass() %></td></tr>
		<tr><th>이름</th><td><%=m1.getName() %></td></tr>
		<tr><th>포인트</th><td><%=m1.getPoint() %></td></tr>
		
	</table>
</body>
</html>