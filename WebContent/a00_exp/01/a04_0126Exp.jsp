<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="a04_0126.jsp" method="post">
	<table>
		<tr><th>상품명</th><td><input type="text" name="pname"></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt"></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"></td></tr>
		<tr><th>결제방법</th>
		<td>
		<label><input type="radio" name="pay" value="신용카드" size="100%"/>신용카드</label>
		<label><input type="radio" name="pay" value="현금"/>현금</label>
		<label><input type="radio" name="pay" value="포인트"/>포인트</label></td></tr>
		<tr><td colspan="2"><input type="submit" value="결제"/></td></tr>
		
	</table>
</form>
</body>
</html>