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
<jsp:useBean id="m1" class="jspexp.z01_vo.Member" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="m1"/>
<jsp:useBean id="list" class="java.util.ArrayList" scope="session"></jsp:useBean>
<body>
<%if(m1.getId()!=null){
	list.add(m1);
}
	%>
	<h3>등록된 회원정보(<%=list.size() %>)</h3>
	<table>
		<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>포인트</th><th>권한</th></tr>
		<%for(int idx=0;idx<list.size(); idx++){
				Member mem = (Member)list.get(idx);
		%>
		<tr><td><%=m1.getId() %></td>
		<td><%=m1.getPass() %></td>
		<td><%=m1.getName() %></td>
		<td><%=m1.getPoint() %></td>
		<td><%=m1.getAuth() %></td></tr>
	</table>
	<%} %>
</body>
</html>