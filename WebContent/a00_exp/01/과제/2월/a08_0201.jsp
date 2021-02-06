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
[하] 1. prototype의 개념에 대하여 Book(도서명,저자,가격)의 생성자형 객체를 기준으로 배열형(구매 도서3권)으로 선언하여 기술하세요.
prototype은 상속과 배열의 공유메모리를 활용하여 기능메서드를 정의한다.
메모리 효율을 추구할 수 있다.
--%>
function Book(bname, author, price){
	this.bname=bname;
	this.author=author;
	this.price=price;
}
Book.prototype.bookInfo=function(){
	return this.bname+"의 저자는 "+this.author+"이고 가격은 "+this.price+"원 입니다.";
}
var book = new Book("삼국지","황석영",18000);
console.log(book.bookInfo());

var buyList=[];
buyList.push(new Book("자바기초","자바맨",28000));
buyList.push(new Book("jsp기초","웹개발자",30000));
buyList.push(new Book("스프링으로 마침","스프링개발자",32000));
for(var idx in buyList){
	buyList[idx].bookInfo();
}

<%--
[하] 2. Object의 하위의 공통 메서드를 기술하고, Duck(오리종류, 색상, 날수있는지여부)를 선언하여,

        종류가 속성에 포함되는지, 수영을 할 수 있는지 여부, 속성을 포함되는지 호출하고, 색상이 접근가능
        여부를 하위 공통메서드 기반으로 선언하세요.
        ##Object 하위의 공통 메서드##
		constructor() : 생성자 함수
		hasOwnProperty(name) : name 속성이 있는지 확인
		isPrototypeof(object) : object 프로토 타입인지 검사
		propertyIsEnumerable(name) : 반복문으로 열거할 수 있는지 확인
		toLocaleString() : 객체를 호스트 환경에 맞는 언어의 문자열 변환
		toString() : 문자열 변환
		valueOf() : 객체 값 리턴
      
		var duck = {kind : "천둥", color : "녹색", fly : "yes"}
		console.log("종류가 속성에 포함되는가? : "+duck.hasOwnProperty("kind")); 
		console.log("수영이 속성에 포함 되는가?:"+duck.hasOwnProperty("swim")); 
		console.log("수영을 할수 있는가? :"+duck.propertyIsEnumerable("swim")); 
		console.log("색상 접근이 가능한가? :"+duck.propertyIsEnumerable("color"));   --%>
		function Duck(kind, color, isFlying){
			this.kind=kind;
			this.color=color;
			this.isFlying=isFlying;
		}
		var obj = new Duck("천둥오리","알록달록",true);
		console.log("kind속성 포함 여부: "+obj.hasOwnProperty("kind"));
		console.log("isSwimming 속성 포함 여부: "+obj.hasOwnProperty("isSwimming"));
		
		
		
<%--
[하] 3. Number의 소숫점 이하 표현 메서드를 이용해서, 아래와 같이 출력을 클릭시, 화면에 처리되게 하세요.
       입력데이터[0.34222  ]
       소숫점자리수[3   ] [출력]
       0.342						--%>
</script>
</head>

<body>
	<h2>숫자형 자릿수 확인</h2>
	입력데이터 <input type="text" name="data01"/><br>
	소숫점자리수 <input type="text" name="pt"/>
	<input type="button" value="출력" onclick="showData()"/><br>
	<p id="show"></p>
<script type="text/javascript">
	function showData(){
		//입력된 데이터를 숫자형으로 변환.
		var data01 = Number(document.querySelector("[name=data01]").value);
		var pt = Number(document.querySelector("[name=pt]").value);
		var output=data01.toFixed(pt);
		document.querySelector("#show").innerHTML = output;
	}

</script>
	


	
<%--
[jsp]
[하] 1. jsp:forward의 기본 코드를 request.getRequestDispatcher비교하세요.
		기본코드 : <jsp:forward page="이동할 페이지"/>
			
		RequestDispatcher rd = request.getRequestDispatcher("페이지");
		rd.forward(request, response);
		둘다, 해당 페이지로 이동하면서 request(요청객체), response(반응객체)도 함꼐 전달된다.
		request객체가 전달되기에 form이나 url로 요청한 요청값, 쿠키값 등을 함께 전송할 수 있다.
		조건문을 이용해서 요청값이 있는 페이지 전송에 유용하게 사용한다.

[하] 2. 물건명,물건가격, 물건갯수를 입력받아, 1000000이상은 VVIP, 50만이상 VIP 
        그외에는 일반고객으로 각각의 페이지를 구현하여 처리하세요. 고객 이름과 함께 처리하세요.
        @@님 총구매금액 @@@원으로 VVIP 페이지에 접속하셨습니다. --%>
	<h3>구매에 따른 등급 페이지 이동</h3>      
		<form method="post">
		<table>
		<tr><td>구매자</td><td><input type="text" name="name"></td></tr>
		<tr><td>물건명</td><td><input type="text" name="pname"></td></tr>
		<tr><td>가격</td><td><input type="text" name="price"></td></tr>
		<tr><td>갯수</td><td><input type="text" name="cnt"></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"></td></tr>
		</table>
		</form>
		<%
			String priceS = request.getParameter("price");
			String cntS = request.getParameter("cnt");
			if(priceS!=null && cntS!=null){
				int price = Integer.parseInt(priceS);
				int cnt = Integer.parseInt(cntS);
				int tot= price*cnt;
				//요청값을 기준으로 새로운 데이터를 할당하고
				//이동된 페이지에서 해당데이터를 사용하고자 할때
				//request.setAttribute("저장할 키", 저장할 데이터);
				//이동한 페이지에서는 request.getAttribute("호출할키");
				request.setAttribute("tot",tot);
				String page1 = "";	
				//page : jsp에서 내장된 keyword와 동일할 때 에러 발생
				if(tot>=1000000){
					page1="a08_VVIP.jsp";
				}else if(tot>=500000){
					page1="a08_VIP.jsp";
				}else{
					page1="a08_normal.jsp";
				}
		%>
		<jsp:forward page="<%=page1 %>"/>
			<%} %>
</body>
<script>

var number01 = function(num01, num02){
    return num01.toFixed(num02);`
}
var answer = function(){
    var num01 = prompt("소수입력",0.00);
    var num02 = prompt("소수자리수 입력",0);

    document.querySelector("div").innerHTML += "<h2>정답 : "+ number01(Number(num01),num02)+"</h2>";
};
</script>
</html>