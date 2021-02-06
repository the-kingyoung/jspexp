<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.Product"%>
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
	session.setAttribute("p01",new Product("사과",5000,3));
%>
<body>
	<h3>장바구니1</h3>
	<a href="a02_shop2.jsp">장바구니2로</a>
	<table>
		<tr><th>세션범위</th><td>
		<%
		if(session.getAttribute("p01")!=null){
		Product p01 = (Product)session.getAttribute("p01");
		p01.setCnt(p01.getCnt()+1);
		session.setAttribute("p01",p01);
		%>
		<%=p01.getName() %>:<%=p01.getPrice() %>:<%=p01.getCnt() %>
		<%} %>
		</td></tr>
	</table>
</body>
</html>