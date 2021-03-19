<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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

<body>
	<h3>오답!</h3>
	<table>
		<tr><th>정답</th><td><%=request.getParameter("answer") %></td></tr>
		<tr><th>제출한 답</th><td><%=request.getParameter("innum") %></td></tr>
		
	</table>
</body>
</html>