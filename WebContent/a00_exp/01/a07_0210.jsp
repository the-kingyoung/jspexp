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
<%--
[하] 1. 데이터의 등록과 상세처리 프로세스의 순서에 대하여 기술하세요.
[하] 2. 부서 상세 정보를 처리하세요.
[중] 3. 쇼핑몰에서 관리자 현재 등록된 물건을 확인하고, 물건을 등록하고, 물건을 상세정보를 출력하는 웹화면을 구현하세요.

        물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일,제조사, 최근입고일, 입고책임자
        조회화면 출력 : 제품번호, 물건명, 물건가격, 물건재고량, 최근입고일 조회조건(물건명, 물건가격 from,to)
 --%>
<body>
	<h3>쇼핑몰</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>