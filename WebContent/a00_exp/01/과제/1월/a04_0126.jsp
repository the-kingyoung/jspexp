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
<%--
[jsp]
[하] 1. request, response 참조변수의 원래 객체의 명은 무엇인가?(servlet클래스 참조)
[하] 2. jsp에서 객체선언없이 사용하는 내장된 참조객체를 기술하세요.
		- request, response, out, session
		
[하] 3. request객체의 메서드의 각자 특징과 내용을 기술하세요.
==============================================================================	
	ex) http://243.211.18.42:7080/context명/폴드/파일.jsp?key=value&key=value
==============================================================================	
	1) request.getParameter("key")
		-client가 주소창이나 form객체를 통해서 전송하는 매개값을 처리하는 객체를 말한다.
			페이지명?key=value&key=value (GET)
			form method="post"
			name="key"	value="value"	(POST)
	2) request.getParameter()
		웹서버에 연결된 클라이언트의 ip주소를 구한다.
		ex) 웹서버에 접속된 여러 클라이언트 정보를 저장할 때, 사용된다.
	3) request.getMethod()
		요청값을 전달할때, 전송하는 방식을 가져온다. (get/post)
	4) request.getContextPath():(*)
		위 주소에 해당하는 context명을 말한다. 웹서버에 등록하여 할당하는 프로젝트명이기도 하다.
		WebContent 폴드를 기본경로로 하여 다른 자원을 호출할 때 사용된다.
	5) request.getRequestURI():
		웹브라우저가 요청한 url경로 : 
		위 주소에서 context명/폴드/파일.jsp에 해당한다.
	6) request.getServerPort()
		위 주소기준이면 7080에 해당한다.
	7) request.getServerName() 연결할때, 사용한 서버이름.

[하] 4. request객체의 메서드 가운데 요청값을 처리하는 메서드의 특징을 기술하세요.
	1) request.getParameter("key")
	- key값에 해당하는 value를 받아올 수 있다.
	2) request.getParameterValues("key")
		- 동일한 이름의 key값으로 여러 value값을 받을 때, 배열로 데이터를 받을 수 있다.
	3) request.getParameterName()
		- 요청되는 모든 내용을 key값을 가져온다.
	4) request.getParameterMap();
		- 요청된 모든 내용을 key/value형식으로 map에 할당되어 가져온다.

[중] 5. 구매할물건과 갯수를 queryString으로 페이지와 함께 만들고, 해당 페이지에서 
        데이터를 처리하세요 
        page.jsp?name=사과&cnt=2&price=3000&name=바나나&cnt=5&prcie=4000&pay=신용카드&pay=현금&pay=포인트
        1) get방식으로 바로 출력
        2) form 처리 방식 입력 후, 출력.
            구매물건
            물건명   갯수
            [   ]  [  ]
            [   ]  [  ]
            [   ]  [  ]
            구매방법 []신용카드[]현금[]포인트--%>
<body>
<%
String pname = request.getParameter("pname"); if(pname==null) pname="X";
String cntS = request.getParameter("cnt"); if(cntS==null) cntS="0";
int cnt = Integer.parseInt(cntS);
String priceS = request.getParameter("price"); if(priceS==null) priceS="0";
int price = Integer.parseInt(priceS);
String pay = request.getParameter("pay"); if(pay==null) pay="현금";
%>
<h3>ex5)구매물건</h3>
<table>
	<col width="33%"><col width="33%"><col width="33%">
	<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
	<tr><td><%=pname %></td><td><%=price %></td><td><%=cnt %></td></tr>
	<tr><td colspan="3">구매방법 : <%=pay %></td></tr>
	<tr><td colspan="3">총계 : <%=cnt*price %></td></tr>
<%--
http://localhost:7080/jspexp/a00_exp/01/a04_0126.jsp
	?pname=사과&cnt=2&price=3000&name=바나나&cnt=5&prcie=4000&pay=신용카드&pay=현금&pay=포인트
 --%>
</table>
</body>
</html>