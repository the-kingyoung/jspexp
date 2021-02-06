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
# 세션이란?
1. 웹컨테이너(서버)에서 클라이언트의 정보를 접속정보를 보관할 때 사용
2. 서버에서만 생성하여 저장한다.
3. 클라이언트 단위로 서버에 객체를 생성한다.
	1) 브라우저가 닫히면 세션이 자동 종료된다.
	2) 브라우저가 열려있으면, 계속 세션이 유지가 된다.
	3) 다른 브라우저를 통해서 세션을 확인할 수 없다.
4. session 기본 객체를 이용해서 접근 방법.
	1) page 속성 session=true이어야 하는데, default이다
	   명시적으로 session=false하지 않는 이상, session객체를 사용할 수 없다.
	2) session의 설정
		session.Attribute("세션명",할당할객체);
	3) session의 가져오기.
		session.getAttribute("세션명")
		객체일 경우 typecasting을 통해서 가져온다.
		(클래스명)session.getAttribute("세션명");
5. 세션 종류 / 타임 아웃.
	1) 프로그래밍으로 처리
		- 전체 session 종료 : session.invalidate()
		- 특정 유효기간으로 종료 setMaxInactiveInterval(초단위);
	2) web.xml 설정으로 처리
		<session-confing>
			<session-timeout>30</session-timeout>
 --%>
<body>
<%
//1. session 설정
//	1) 일반변수
	session.setAttribute("name","홍길동");
//	2) 객체설정.
	session.setAttribute("p01",new Product("사과",3000,2));
//		설정된 객체 가져오기
	Product p = (Product)session.getAttribute("p01");
//	ex1) Person 객체설정하고, 하단에 Person객체의 속성 가져오기.
	session.setAttribute("p",new Person("홍길동",29,"경기도수원"));
	
//	ex2) ArrayList<Person>으로 3명 등록하고 하단에 반복문으로 출력하세요
	ArrayList<Person> plist = new ArrayList<Person>();
	plist.add(new Person("홍길동",29,"경기도 인천"));
	plist.add(new Person("신길동",26,"경기도 수원"));
	plist.add(new Person("마길동",22,"경기도 안양"));
	session.setAttribute("plist",plist);
%>


	<h3>이름 : <%=session.getAttribute("name") %></h3>
	<table>
		<tr><th>과일명</th><td><%=p.getName() %></td></tr>
		<tr><th>가격</th><td><%=p.getPrice() %></td></tr>
		<tr><th>갯수</th><td><%=p.getCnt() %></td></tr>
	</table>
	<%Person p01 = (Person)session.getAttribute("p");%>
	<h3><%=p01.getName() %>-<%=p01.getAge() %>-<%=p01.getLoc() %></h3>
	<h3 onclick="location.href='a02_show.jsp'">리스트 session확인</h3>

</body>
</html>