<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
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
	ex) 전형적인 board 형태의 화면에 각 데이터가 전송되게 처리하세요.
	상단에 아이디 부분은 현재 main에서 전송하여 처리하게 하고,
	왼쪽 메뉴도 전자/잡화/식품류/관리 중에 메인에서 전송한 데이터를 선택하여 처리하세요.
	페이지는 main포함 총 3개..
	a03_main.jsp a03_top.jsp a03_left.jsp
	-------------------
	상단포함  @@@님 로그인
	-------------------
	왼쪽	|	
	메뉴	|	메인내용
			|
	 --%>
	<jsp:include page="a03_top.jsp">
		<jsp:param name="id" value="홍길동"></jsp:param>
	</jsp:include>
	<hr>
	<table>
		<col width="20%">
		<col width="80%">
		<tr>
			<td>
				<!-- 왼쪽 메뉴에 선택한 index값을 넘겨줌 -->
				<jsp:include page="a03_left.jsp"></jsp:include>
			</td>
			<td>
				<!--  받은 text를 출력 처리.. -->
				<h3 align="center">메인!</h3>		
			</td>
		</tr>		
	</table>
</body>
</html>