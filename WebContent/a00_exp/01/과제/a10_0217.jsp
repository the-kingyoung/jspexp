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
<%--        
[JSP]
[하] 1. 웹화면에서 데이터를 삭제할 때, 진행되는 순서를 간단하게 기술하세요.
1. 수정화면 처리
   1) 삭제 버튼 클릭시, 요청값을 proc 속성에 속성값 del로 처리하고 요청값 전송.
   2) proc=del와 함께 수정할 데이터 입력 받아 출력 처리한다.
   
2. DAO 처리
   1) 수정할 sql확인 ex) DELETE FROM 테이블명 WHERE 기준이되는 컬럼명=컬럼값;
   2) 기능 메서드 public void delete메서드(값) 구현..
   
3. jsp 화면 처리
   1) 넘겨온 요청값을 기능 메서드의 매개변수로 넘기기 위해 객체 처리
   2) dao에 선언할 메서드로 처리.
   
4. js
   삭제 처리 완료, 메인화면 이동 처리.

[하] 2. 물건객체에서 삭제처리하는 프로세스에 의해 삭제 처리하세요
[하] 3. useBean에서 property와 필드를 구분하여 기술하세요.
	
	예를들어 setName()이라는 메서드에서 property는 name이라는 값을,
	setXXX()이라는 메서드가 저장을 위한 필드로 구분할 수 있다.
	
[하] 4. 아이디, 패스워드, 이름, 포인트, 권한이 있는 Member Vo객체를 만들고,
        회원등록페이지와 useBean을 이용해서, 등록버튼 클릭시 등록 회원을
        확인할 수 있게 처리하세요.
--%>

<%--  
[js]
[하] 1. 윈도우창 로딩시, 매개변수에 따른 기본 옵션을 기술하세요.
[하] 2. 윈도창이 왼쪽 상단에 로딩되어, 오른쪽으로 하단으로 다시 왼쪽으로
        위로 이동하여 멈추게 처리하세요.(자동으로 이동)
--%>
<body>

	<h3>회원 등록</h3>
	<form method="post" action="memberReg.jsp">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass"/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>
</body>
</html>