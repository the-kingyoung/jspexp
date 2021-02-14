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
<%
	String pnum = request.getParameter("pnum");
	A02_Exp Dao =new A02_Exp();
	ArrayList<Pinfo> p = Dao.pList(new Integer(pnum));
	
%>
<body>
	<h3>과일 디테일</h3>
	<table>
		<tr><th>고유번호</th><th>과일이름</th><th>가격</th><th>재고량</th><th>신규등록일</th><th>제조사</th><th>최근입고일</th><th>책임자</th></tr>
		<%for(Pinfo pp : p){ %>
		<tr>
			<td><%=pp.getPnum() %></td>
			<td><%=pp.getPname() %></td>
			<td><%=pp.getPrice() %></td>
			<td><%=pp.getPstock() %></td>
			<td><%=pp.getPnewreg() %></td>
			<td><%=pp.getPcompany() %></td>
			<td><%=pp.getPrereg() %></td>
			<td><%=pp.getPdirector() %></td>
		</tr>
		<%} %>
	</table>

</body>
</html>