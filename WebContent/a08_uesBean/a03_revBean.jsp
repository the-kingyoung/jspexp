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
<%--
request.getParameter("name")
?name=사과&price=3000&cnt=5
setName() 이 있으면 자동으로 해당 요청key, set property를 확인해서 자동으로 할당.
setPrice(int price)
setCnt(int c) property에 해당하는 메서드가 있으면 자동할당된다.
 --%>
<jsp:useBean id="p01" class="jspexp.z01_vo.Product" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="p01"/>
<body>
	<h3>저장된 Product</h3>
	<table>
		<tr><th>물건명</th><td><%=p01.getName() %></td></tr>
		<tr><th>가격</th><td><%=p01.getPrice() %></td></tr>
		<tr><th>갯수</th><td><%=p01.getCnt() %></td></tr>
	</table>
</body>
</html>