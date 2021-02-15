<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A03_ShopDao"
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
	String pnoS = request.getParameter("pno");
	int pno=0;
	if(pnoS!=null&&!pnoS.equals(""))pno = Integer.parseInt(pnoS);
	A03_ShopDao dao = new A03_ShopDao();
	Product2 pro = dao.getProd(pno);
%>
<body>
	<h3>상세화면</h3>
	<form method="post">
	<table>
		<%if(pro!=null){ %>
		<tr><th>물건번호</th><td><input type="text" name="pno" value="<%=pro.getPno()%>"></td></tr>
		<tr><th>물건번호</th><td><input type="text" name="name" value="<%=pro.getName()%>"></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value="<%=pro.getPrice()%>"></td></tr>
		<tr><th>물건재고량</th><td><input type="text" name="cnt" value="<%=pro.getCnt()%>"></td></tr>
		<tr><th>제조사</th><td><input type="text" name="company" value="<%=pro.getCompany()%>"></td></tr>
		<tr><th>입고책임자</th><td><input type="text" name="inmanager" value="<%=pro.getInmanager()%>"></td></tr>
		<tr><th>신규등록일</th><td><input type="text" name="credteS" value="<%=pro.getCredte()%>"></td></tr>
		<tr><th>최근입고일</th><td><input type="text" name="incomedteS" value="<%=pro.getIncomedate()%>"></td></tr>
		
		<%}else{ %>
		<tr><td colspan="2">데이터가 없습니다.</td></tr>
		<%} %>
		<tr><td colspan="2">
			<input type="submit" value="수정">
			<input type="submit" value="삭제">
			<input type="button" value="메인화면이동"
		 		onclick="location.href='a07_0210_with.jsp'"/></td></tr>
	</table>
	</form>
</body>
</html>