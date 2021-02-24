<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
[JSP]
[하] 1. jstl의 환경 설정 방법에 대하여 기술하세요
		1) WebContent\WEB-INF\lib에 jstl-1.2.jar추가(알집파일형태)
		2) tag lib를 상단에 선언..
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
[하] 2. jstl의 일반 변수 선언, 객체할당 선언을 구분하여 처리한 기본 예제를 기술하세요.

	<c:set var="fname" value="사과" scope="request"/>
	<h2>과일명: ${fname}</h2>
	<jsp:useBean id="prod" class="vo.Fruit"/>
	<c:set target="${prod}" property="name" value="바나나"/>
	<c:set target="${prod}" property="price" value="3000"/>
	<c:set target="${prod}" property="cnt" value="2"/>
	<h3>과일명:${prod.name}</h3>
	<h3>과일가격:${prod.price}</h3>
	<h3>과일갯수:${prod.cnt}</h3>

	일반 변수 선언 : <c:set var="ex2" value="100" scope="request"/>
	객체 할당 선언 : <c:set target="ex02" property="name" value="홍길동"/>

[하] 3. 기존 조건문과 else if 조건문에 해당하는 jstl의 조건 형식을 기술하세요.
	<c:if test="조건">
		조건이 true일 때 처리할 내용,
	</c:if>

	<c:choose>
		<c:when test="조건1">조건1=true</c:when>
		<c:when test="조건2">조건2=true</c:when>
		<c:when test="조건3">조건3=true</c:when>
		<c:otherwise>그외의 조건들</otherwise>
	</c:choose>

--%>

</script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("[name]").css("text-align","center");
	$("[name=num01]").val(Math.floor(Math.random()*8+2));
	$("[name=num02]").val(Math.floor(Math.random()*9+1));
  });

</script>
<body>
<%--
[하] 4. 임의의 구구단 문제를 form객체에 의해 정답값 입력에 따라, jstl에 의해 정답/오답을 구분하여 처리하세요.
 --%>

<form method="post">
<table>
	<tr><th>문제</th>
	<td><input name="num01" size="2"/>
	X    <input name="num02" size="2"/>=
	<input name="reply" size="2"/></td></tr>
	<tr><td colspan="2"><input type="submit" value="제출"/></td></tr>
	</table>
</form>
<c:if test="${not empty param.num01}">
	<h4>입력한 내용 : ${param.num01} X ${param.num02} = ${param.reply}</h4>
	<h4>정답여부 : ${param.num01*param.num02==param.reply?'정답':'오답'}</h4>
</c:if>



<%--
<%
	request.setAttribute("ran1", (int)(Math.random()*8+2));
	request.setAttribute("ran2", (int)(Math.random()*9+1));
%>
<c:set var = "tot" value="${ran1*ran2}"/>
<form method="post">
<table>
   <tr><th>문제</th>
   <td><input type="text" name="num01" value="${ran1}" style="width:60px"/>
   X    <input type="text" name="num02" value="${ran2}" style="width:60px"/>=
   <input type="text" name="answer" value="${answer}" style="width:30px"/></td></tr>
   <tr><td colspan="2"><input type="submit" value="제출"/></td></tr>
   <tr><td colspan="2">
   
<c:if test="${not empty param.answer}">
   <c:if test="${tot == param.answer}">
      정답은 ${tot}이고 제출한 답은 ${param.answer}이므로 정답!
   </c:if>
   <c:if test="${tot != param.answer}">
      정답은 ${tot}이고 제출한 답은 ${param.answer}이므로 오답!
   </c:if>
   </c:if>
   </td></tr>
</table>
[하] 5. jstl 반복문으로 개당 물건값을 입력받아 10개까지 계산된 물건총계을 출력하세요
        물건명:[   ] 단가:[   ] [10개까지 출력]
            @@@  1개  @@@ 원
            @@@  2개  @@@ 원
            @@@  3개  @@@ 원
            ...
            @@@  10개  @@@ 원
             --%>
<form method="post">
<h3>물건명 : <input type="text" name="pname" style="width:60px"/></h3>
<h3>가격 : <input type="text" name="price" style="width:60px"/></h3><input type="submit" value="등록"/>
<c:forEach var="cnt" begin="1" end="10">
<c:if test="${not empty param.pname}">
<h5>${param.pname} ${cnt}개 ${param.price*cnt}원 </h5>
</c:if>
</c:forEach>
</form>

	<form method="post">
	<table>
		<tr><th>물건명</th><td><input name="name" size="2"/></td></tr>
		<tr><th>단가</th><td><input name="price" size="2"/></td></tr>
		<tr><th>갯수</th><td><input name="cnt" size="2"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="계산출력"/></td></tr>
		</table>
	</form>
	<table>
		<tr><th>물건명</th><th>갯수</th><th>계</th></tr>
		<c:forEach var="cnt" begin="1" end="${param.cnt}">
			<tr><td>${param.name}</td>
				<td>${cnt}</td>
				<td>${param.price*cnt }</td></tr>
		</c:forEach>
	</table>


</body>
</html>