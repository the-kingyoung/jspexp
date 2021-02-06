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

</style>
<script>
	window.onload=function(){

	};
</script>
</head>

<body>
<%--
ex) 사이트별 이동 및 나이에 따른 입장료 할인 처리
나이:[	] - 3미만 65이상 무료, 3~7 50% 8~13 40% 14-20 30%
사이트 : select
[놀이공원-50,000원] 	a07_site01.jsp	놀이공원
[뮤지엄-50,000원] 	a07_site01.jsp	뮤지엄
[아쿠아리움-50,000원] 	a07_site01.jsp	아쿠아리움
					a07_siteCom.jsp 나이에 따른 할인율 계산.
[입장]
@@@에 오신것을 환영합니다.
나이 @@ 할인율 @@ 입장료 @@@원입니다.
--%>
	<h2>사이트별 이동 및 나이에 따른 입장료 할인 처리</h2>
	<form method="post">
	나이 : <input type ="text" name="age" /><br>
	사이트 : 
	<select name="site">
			<option value="a07_site01.jsp">놀이공원-50,000원</option>
			<option value="a07_site02.jsp">뮤지엄-30,000원</option>
			<option value="a07_site03.jsp">아쿠아리움-40,000원</option>
		</select><br>
		<input type="submit" value="입장"/>
	</form>
	<%
		String site=request.getParameter("site");
		if(site!=null){	//초기페이지에 에러 제거
	%>
		<jsp:forward page="<%=site %>"></jsp:forward>
	<%}%>
</body>
</html>