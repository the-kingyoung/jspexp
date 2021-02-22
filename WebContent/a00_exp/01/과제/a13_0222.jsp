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

	일반 변수 선언 : <c:set var="ex2" value="100" scope="request"/>
	객체 할당 선언 : <c:set target="ex02" property="name" value="홍길동"/>

[하] 3. 기존 조건문과 else if 조건문에 해당하는 jstl의 조건 형식을 기술하세요.
	<c:choose>
		<c:when test="조건1">조건1=true</c:when>
		<c:when test="조건2">조건2=true</c:when>
		<c:when test="조건3">조건3=true</c:when>
		<c:otherwise>그외의 조건들</otherwise>
	</c:choose>

--%>
   $(document).ready(function(){
     // $("h3").text("시작");
   });
</script>
</head>
<body>
<%--
[하] 4. 임의의 구구단 문제를 form객체에 의해 정답값 입력에 따라, jstl에 의해 정답/오답을 구분하여 처리하세요.
 --%>
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
</form><%--못풀었습니다,,, --%>


<%--
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
</body>
</html>