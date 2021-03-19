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
	
	<%--
	[js]
	[하] 1. 생성자 함수의 기본형식을 선언하고, weekendSch(주말 계획-날짜/시간/일과내용/shMySche())를 예제로 출력해보세요.
		function Object01(param1, param2)
		this.속성1 = param1
		this.속성2 = param2
		this.메서드명 = function(){ 동작처리 할 내용 };			--%>	
		function weekendSch(day,time,content){
			this.day=day;
			this.time=time;
			this.content=content;
			this.shMySche = function(){
				return this.day+", "+this.time+", "+this.content;
			};
		};
		var show = new weekendSch('토요일','16시반','친구들 만나기');
		console.log(show.shMySche());

<%--
	[하] 2. class 형태로 Car객체를 선언하고, 종류, 배기량, 최고 속도, 현재 속도, speedUp(), speedDown() 속성을 선언하고, 각 기능에 따라
	    출력되게 하세요.	 --%>
	    class Car{
	    	constructor(kind,engine, maxSpeed, speed){
	    		this.kind = kind;
	    		this.engine = engine;
	    		this.maxSpeed = maxSpeed;
	    		this.speed = speed;
	    	}
	    	speedDown(){
	    		this.speed--;
	    	}
	    	speedUp(){
	    		this.speed++;
	    	}
	    	carFunction(){
	    		return "차량 종류 : "+this.kind+"\n배기량 : "+this.engine+"\n최고속도 : "+this.maxSpeed+
	    		"\n현재속도 : " + this.speed;
	    	}
	    	
	    };
	    var car = new Car("머스탱","5.0",260,150);
	   	console.log(car.carFunction());
	   	car.speedUp();
	   	console.log(car.carFunction());
	   	car.speedDown();
	   	console.log(car.carFunction());    
</script>
</head>
<body>

<h2></h2>

<!-- 
[jsp]
[하] 1. 파일관리하는 서버 정보를 fileServer/124.243.3.5 로, 특정 이미지의 경로 정보를 설정하여, 화면에 출력하게 하세요.
  	<context-param>
  		<description>파일서버</description>
  		<param-name>fileServer</param-name>
  		<param-value>124.243.3.5</param-value>
  	</context-param>
  	<context-param>
  		<description>이미지경로</description>
  		<param-name>imgPath</param-name>
  		<param-value>a01_img</param-value>
  	</context-param>
<h3>fileServer : <%=application.getInitParameter("fileServer") %></h3>
<h3>fileServer : <%=application.getInitParameter("imgPath") %></h3>
-->

<!-- 
[하] 2. 서버 안에 log에 대한 여러가지 출력 형식을 기술하세요.
	- log("jsp접두어 로그") : 프로그램을 실행하였을 때, INFO: jsp: 내용 형태로 Console에 내용이 출력된다.
	- application.log("서버단위log") : 프로그램을 실행하였을 때, INFO: 내용 형태로 Console에 내용이 출력된다.
	- System.out.println("콘솔로그") : 실행 시켰을 때, Console창에 검은색 글씨로 내용이 출력된다.
	- out.println() : 실행 시켰을 때, 브라우저 안에 괄호안의 내용들이 출력이 된다.

[중] 3. jsp:include 액션 태그를 이용해서 상단/하단이 나뉘어지고, 상단에 메뉴 하단에 페이지가 만들어 지면, 상단의 로그인/상품/관리자 메뉴에 클릭에 따라
       하단의 페이지가 변경되게 처리하세요.  
       <div>
       <jsp:include page="top.jsp">
       		<jsp:param name="key" value="전송할값"/></div>
       
       <div>
       <jsp:include page="buttom.jsp"></div>
       
       
       
           
<h3>상단</h3>
<nav id="menubar">
	<ul>
		<li><a href="a07_login.jsp">로그인</a></li>
      	<li><a href="a07_product.jsp">상품</a></li>
     	<li><a href="a07_manage.jsp">관리자</a></li>
   	</ul>
</nav>-->

</body>
</html>