<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
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
#menubar ul li{
   display : inline-block;
   list-style-type : none;
   padding : 0px 15px;
}
</style>
<script>
	window.onload=function(){

	};
</script>
</head>

<body>
	<h3>상단</h3>
	<nav id="menubar">
   <ul>
      <li><a href="a07_login.jsp">로그인</a></li>
      <li><a href="a07_product.jsp">상품</a></li>
      <li><a href="a07_manage.jsp">관리자</a></li>
   </ul>
</nav>
<hr>

</body>
</html>