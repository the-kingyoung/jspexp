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
 	if(pnum==null) pnum="";
 	String pname = request.getParameter("pname");
 	if(pname==null) pname="";
 	String price = request.getParameter("price");
 	if(price==null) price="";
 	String pstock = request.getParameter("pstock");
 	if(pstock==null) pstock="";
 	String pnewreg = request.getParameter("pnewreg");
 	if(pnewreg==null) pnewreg="";
 	String pcompany = request.getParameter("pcompany");
 	if(pcompany==null) pcompany="";
 	String prereg = request.getParameter("prereg");
 	if(prereg==null) prereg="";
 	String pdirector = request.getParameter("pdirector");
 	if(pdirector==null) pdirector="";
 	
	A02_Exp Dao =new A02_Exp();
	if(pnum!="" && pname!="" && price!="" && pstock!=""
			 && pnewreg!="" && pcompany!="" && prereg!="" && pdirector!=""){
		Dao.reg(new Integer(pnum), pname, new Integer(price), new Integer(pstock), pnewreg, pcompany, prereg, pdirector);
	}
 %>
<body>
	<h3>제목</h3>
	<form method="post">
	<table>
			<tr><th>과일 번호</th><td><input type="text" name="pnum"/></td></tr>
			<tr><th>과일 이름</th><td><input type="text" name="pname"/></td></tr>
			<tr><th>과일 가격</th><td><input type="text" name="price"/></td></tr>
			<tr><th>과일 재고량</th><td><input type="text" name="pstock"/></td></tr>
			<tr><th>신규 등록일</th><td><input type="text" name="pnewreg"/></td></tr>
			<tr><th>제조사</th><td><input type="text" name="pcompany"/></td></tr>
			<tr><th>최근 입고일</th><td><input type="text" name="prereg"/></td></tr>
			<tr><th>입고책입자</th><td><input type="text" name="pdirector"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="등록" onclick="donot()"/></td></tr>
	</table>
	</form>
	<script type="text/javascript">
				var pnum="<%=pnum%>";
				var pname="<%=pname%>";
				var price="<%=price%>";
				var pstock="<%=pstock%>";
				var pnewreg="<%=pnewreg%>";
				var pcompany="<%=pcompany%>";
				var prereg="<%=prereg%>";
				var pdirector="<%=pdirector%>";
			if(pname!=""){
				alert("제품 등록 완료 !");
				
			if(confirm("조회페이지로 이동하시겠습니까 ? ")){
				location.href="a07_0210.jsp";
			}
		}
			
			function donot(){
				if(pnum=="" || pname=="" || price=="" || pstock==""
					 || pnewreg=="" || pcompany=="" || prereg=="" || pdirector==""){
					alert("모든 항목을 입력해주세요.");
				}
			}
	
	</script>
</body>
</html>