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
[JSP]
[하] 1. session의 life cycle을 메서드와 함께 기술하세요.
[중] 2. 로그인 id : [    ] pass:[   ]로그인
        요청값 himan/7777일 session 값 처리를 설정하고, 그외에는 다시 로그인
        로그인 성공 후에는 session 값으로id 확인 @@@님 로그인중, 
        로그아웃 클릭시, session값을 없애고 다시 로그인 페이지 이동 처리하는
        기능을 구현하세요.
[하] 1. DB서버를 접속하기 위한 환경과 필요한 핵심 api의 기능을 서술하세요
--%>

<%--  
[js]
[하] 1. document.getElementXXXX() 메서드와 document.querySelectorXXX() 메서드를 
    선택자별로 비교하여 기술하세요.
[하] 2. DOM객체의 속성 설정 및 호출 2가지, 출력 처리 메서드를 2가지를 예제와 함께 기술하세요.
[중] 3. DOM 요소객체 생성 코드(createElement)와 속성값 접근을 활용하여, 2X2테이블을
        만들고 화면에 출력하세요.(특정한 cell 배경색상 노랑색 설정)
--%>

<body>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>