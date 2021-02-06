<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"%>
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
<%
	//헤더 정보 출력 처리
Enumeration headerEnum = request.getHeaderNames();
while (headerEnum.hasMoreElements()) {
	String headerName = (String) headerEnum.nextElement();
	String headerValue = request.getHeader(headerName);
%>
<%=headerName%>=<%=headerValue%>
<%
	}
%>
<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th><td>내용</td></tr>
	</table>
</body>
</html>