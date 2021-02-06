<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.Member"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
<%--
ex)
page변수 : show "안녕하세요"
request변수 : prodName "사과"
session변수 : id(himan), point(5000)
applicatoin변수 : DBServer "192.243.32.12"

a05_pageScope.jsp
a06_requestScope.jsp
a07_sessionScope.jsp
a08_applicationScope.jsp
각 페이지별 해당 범위에 따른 내용 출력
--%>
<%
	pageContext.setAttribute("show", "안녕하세요");
	request.setAttribute("prodName", "사과");
	session.setAttribute("m01",new Member("himan",5000));
	application.setAttribute("DBServer","192.243.32.12");
	
	request.getRequestDispatcher("a06_requestScope.jsp").forward(request,response);
%>
	<h3>page scope</h3>
	<table>
		<tr><th>페이지범위</th><td><%=pageContext.getAttribute("show") %></td></tr>
		<tr><th>요청범위</th><td><%=request.getAttribute("prodName") %></td></tr>
		<tr><th>세션범위</th><td>
		<%
		if(session.getAttribute("m01")!=null){
		Member m01 = (Member)session.getAttribute("m01");
		m01.setPoint(m01.getPoint()+1);
		session.setAttribute("m01",m01);
		%>
		<%=m01.getId() %>:<%=m01.getPoint() %>
		<%} %>
		</td></tr>
		<tr><th>어플리케이션범위</th><td><%=application.getAttribute("DBServer") %></td></tr>
	</table>
</body>
</html>