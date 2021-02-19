<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--  
[하] 1. 재귀적 함수 호출 개념과 toggleClass에 대하여 간단하게 기술하세요.
[하] 2. 재귀적 함수와 slideToggle를 이용하여 특정한 이미지가 보였다가 사라졌다가를 처리해보세요.

--%>
//
   $(document).ready(function(){
      $("h3").text("시작");
   });
</script>
</head>
<%--        
[하] 1. el태그를 이용한 4가지 범위의 데이터를 저장하고 객체로 저장하고, 4칙연산자에의 출력 처리하세요.--%>
<%
	pageContext.setAttribute("num01", 1);
	request.setAttribute("num02",2);
	session.setAttribute("num03",3);
	application.setAttribute("num04",4);
	
	int num1 = (int)Math.floor(Math.random()*10+1);
	int num2 = (int)Math.floor(Math.random()*10+1);

%>
<body>
<h1>${num04+num01-num03+num02}</h1>
<%-- 2. el에서 사용되는 조건논리연산자를 활용하여, 임의의 값에 정답을 입력한 후, 정답 여부를 true/false로 출력하세요.
        [ @@] * [ @@  ] = [ 정답입력  ] [정답확인]
            정답여부 @@@																				--%>
	<h3>정답 알아맞추기!</h3>
	<form method="post">
		<table>
			<tr><th>문제</th><td><input type="text" name="num1" value="<%=num1 %>" style="width:30px"> 
			* <input type="text" name="num2" value="<%=num2 %>" style="width:30px">
			=<input type="text" name="answer" style="width:30px"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="정답 제출!"></td></tr>
		</table>
	</form>
	<h2>${param.num1}X${param.num2}=${param.num1*param.num2}입니다.</h2>
	<h2>${empty param.answer?"":(param.num1*param.num2 == param.answer)?"
			따라서 정답입니다!":"따라서 오답입니다!"}</h2>
			
<%--3. useBean과 el을 이용하여 회원가입 정보입력과 가입된 정보를 출력 처리하세요.~--%>
<jsp:useBean id="info" class="jspexp.z01_vo.Person" scope="session"/>
<jsp:setProperty property="*" name="info"/>
	<h4>회원 등록</h4>
	<form method="post">
	<table>
		<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
		<tr><th>나이</th><td><input type="text" name="age"/></td></tr>
		<tr><th>사는곳</th><td><input type="text" name="loc"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>		
	</table>
	</form>
	<h4>이름 : ${info.name }</h4>
	<h4>나이 : ${info.age }</h4>
	<h4>사는곳 : ${info.loc }</h4>
</body>
</html>