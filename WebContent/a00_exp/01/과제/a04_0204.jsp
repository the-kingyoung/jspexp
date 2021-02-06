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
[JSP]
[하] 1. 쿠키값의 life cycle과 필요한 메서드를 기술하세요.
		입력받은 요청값을 처리한다.
		request.getParameter(" ");
		요청값을 Cookie에 할당하고 클라이언트 전달을 해준다.
		response.addCookie();
		
		==>1) 쿠키생성 (서버) : Cookie c = new Cookie(이름, 값)
		   2) 쿠키 생성 내용 전달 (서버)
		   		response.addCookie(c);
		   3) 쿠키 저장(브라우저)
		   		브라우저의 특정 위치에 저장됨.
		   4) 쿠키 저장 내용 전달(브라우저)
		   		request에 의해 전달, 페이지 호출.
		   5) 전달 되어온 쿠키 확인처리(서버)
		   		Cookie[] c = request.getCookie();


[하] 2. 쿠키값을 요청값에 의해 삭제 처리되는 코드를 기술하세요
		setMaxAge(0) : 쿠키의 생성 시간을 0으로 맞춰주고
		response.addCookie(cookie)로 쿠키만료시간을 client에 전송한다.
		
		==> 1) 삭제할 쿠키값을 요청값으로 전달
				get방식/post방식으로 전달
				ex) <input type="checkbox" name="dcks"
							value="<%=c.getName%>">
				String dck = request.getParameterValues("dcks")
			2) 삭제할 요청된 쿠키값과 저장된 쿠키값을 비교
				for(Cookie c:request.getCookies())
					for(int idx=0; idx<dck.length; idx++){
						if(c.getName().equals(dck[idx])){
						}
					}
			3) 쿠키 사용 기간값 0으로 설정
				조건에 해당하는 쿠키의 기간
					c.setMaxAge(0)
			4) response객체로 해당 쿠키를 전송
					response.addCookie(c);

--%>
<%--   
[js]
[하] 1. 배열의 forEach(), map(), filter()의 기본 형식을 기술하세요.
			- 배열명.forEach(function(단위객체, index, array){
				
			  });
			
			- 배열명.map(function(단위객체){
				return 단위객체변경데이터처리.		
			  });
			
			- 배열명.filter(function(단위객체, index명, 전체배열){
				return 조건;
			  });

[하] 2. 1000단위 물건가격 5개를 임의로 만들어, 5000이상 고가 그외 저가 구분하여 표기하세요--%>
<script type="text/javascript">
// var price = [1000,4000,5500,7000,8000];
// var nPrice = price.map(function(element){
// 	return element +"는 "+ (element>=5000?"고가":"저가");
// });
// console.log(nPrice);
var prices=[];
for(var cnt=1;cnt<=5;cnt++){
	var price = Math.round(Math.random()*9+1);
	price *=1000;
	prices.push(price);
}
console.log(prices);

var Vprices = prices.map(function(price){
	return price>=5000?price+" : 고가":price+" : 저가";
});
console.log(Vprices);
</script>
<%--
[하] 3. json객체의 문자열 변환 및 객체 변환 메서드를 기본예제를 통해 기술하세요.--%>
<script>
var person = {name:"홍길동", age:27};
var jPerson = JSON.stringify(person);
console.log(jPerson);
var cPerson = JSON.parse(jPerson);
console.log(cPerson);
</body>
</html>