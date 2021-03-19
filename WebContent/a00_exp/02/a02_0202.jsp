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
<%--
[js]
[하] 1. 주민번호를 문자열 메서드에 의해서 생년월일을 추출하여, 출력하세요
        주민번호[      ][생년월일추출]==> 클릭시,
        @@@년 @@월 @@일 생.
    	function birthCheck(){
    		var numberObj = document.querySelector("[name=iNumber]");
    		var year= numberObj.value.slice(0,2);
    		var month= numberObj.value.slice(2,4);
    		var day= numberObj.value.slice(4,6);
    		if(numberObj.value.length>6 || numberObj.value.length<6){
    			alert('6자리를 입력해주세요')
    		}else{
    			numberObj.value = "19"+year+"년 "+month+"월 "+day+"일 생";
    		}
    	}--%>
        <%--
[중] 2. 물건정보 [사과^바나나^딸기]
       가격정보 [3000,4000,5000] [등록] ==> 클릭시 데이터 추출 후, 아래 테이블에 리스트
        물건명   가격
        사과    3000
        바나나   4000
        딸기    5000
	function addData(){
		var pname = document.querySelector("[name=data01]").value; //value넣고 안넣고 차이점 : 재활용될게 아니라면 value입력
		var price = document.querySelector("[name=data02]").value;
		var list01 = pname.split("^");
		var list02 = price.split(",");

		var addTab = "";
		list01.forEach(function(ele,idx){
			addTab += "<tr><td>"+ele+"</td><td>"+list02[idx]+"</td></tr>"
		});
		document.querySelector("#tab").innerHTML += addTab;
	}--%>
        
<%--
[하] 3. 임의의 점수 1~100을 한반에 30명에 할당한 후, 내림차순과 오름 차순으로 출력하세요.
var num01 = new Array(30);
for (var i=0;i<30;i++){
	num01[i]=Math.floor(Math.random()*100+1);
	//console.log(i+1+" : "+num01[i])
}
num01.sort(function(left,right){
	return left - right;
});
console.log("# 예제(오름차순) #"); 
console.log(num01);
num01.sort(function(left,right){
	return right - left;
});
console.log("# 예제(내림차순) #"); 
console.log(num01);--%>
<%--
[중] 4. 학생번호와 국어,영어,수학 점수의 속성화 함수로 avg()로 선언하고, 30명에게 각각 임의의 점수(1~100)
    까지 할당하게 하고, 전체과목기준 평균점수 기준으로 rank3을 출력하세요.
    function students(no, kor, eng, math){
    	this.번호 = no;
    	this.국어 = kor;
    	this.영어 = eng;
    	this.수학 = math;
    };
    students.prototype.avg = function(){
    	return (this.국어+this.영어+this.수학)/3;
    };
    var stuInfo = [];
    for (var i = 1; i<=30; i++){
    	var korNum = Math.floor(Math.random()*100+1);
    	var engNum = Math.floor(Math.random()*100+1);
    	var mathNum = Math.floor(Math.random()*100+1);
    	stuInfo.push(new students(i,korNum,engNum,mathNum));
    };
    console.log(stuInfo);
    var rank3=[];
    rank3 = stuInfo.sort(function(left,right){
    	return right.avg() - left.avg();	
    }).slice(0,3);
    console.log(rank3);--%>
<%--
[하] 5. 배열 삭제 메서드의 prototype선언과 삭제 위치에 대한 역순위 처리의 이유에 대하여 기술하세요. 
		- splice는 이후의 내용으로 삭제가 되기 때문에, 마지막 요소부터 접근하여야 정상 삭제가 된다.
		
		==> Array.prototype.remove = function(index){
				return this.splice(index,1);
			}
			삭제 위치는 index순위로 삭제하면 index위치가 조정이 되기에, 마지막 index부터 삭제하여야
			정삭적으로 처리될 수 있다.
		--%>
		

</script>
</head>

<body>
<%--js_ex1) 
	주민번호<input name="iNumber" placeholder="6자리를 입력해주세요."/><br>
	<input type="button" value="생년월일 추출" onclick="birthCheck()"><br>
	<hr>--%>
<%--js_ex2)안풀림  
	물건정보 : <input name="data01"/><br>
	가격정보 : <input name="data02"/>
	<input type="button" value="등록" onclick="addData()">
	<table id="tab">
		<tr><th>물건명</th><th>가격</th></tr>
	</table>--%>
	<h3>제목</h3>
	<table>
		<tr><th>주민번호</th>
		<td><input type="text" name="civilCode" size="3"/>
		<input type="button" value="생년월일 추출" onclick="call1()"/>
		</td></tr>
		<tr><td id="show1" colspan="2"></td></tr>
	</table>
	<script type="text/javascript">
	/*
	DOM객체 접근
		document.querySelector("[속성=속성값]");
		document.querySelector("태그");
		document.querySelector("#아이디명");
		document.querySelectorAll(".클래스");
		.innerHTML : 화면 태그로 출력
		.value : form하위객체 요소값 접근.
		
	onclick="함수명()"
	*/
		function call1(){
			//<input type="text" name="civilCode" size="3"/> 이 요소객체 전체에 대한 선언..
			// 추후 속성을 활용하거나 변경할 수 있다.
			var civilCodeObj = document.querySelector("[name=civilCode]");
			//<input type="text" name="civilCode" size="3" value=""/>
			//요소객체의 속성 중에  value입력된 값만 추출하여 처리..
			// 입력된 데이터를 읽기 위한 작업만 할때..
			//var civilCode = document.querySelector("[name=civilCode]").value;
			//추후에 이 객체에 대한 처리를 못한다. 데이터 읽는 것만 가능
			
			
			//substr(index위치, index위치로부터 갯수);
			var yy = civilCodeObj.value.substr(0,2);
			var mm = civilCodeObj.value.substr(2,2);
			var dd = civilCodeObj.value.substr(4,2);
			yy=yy.charAt(0)=='0'?'20'+yy : '19'+yy;
			document.querySelector("#show1").innerHTML=yy+"년 "+mm+"월 "+dd+"일";

		}
	</script>
	
	<h3>물건정보등록처리</h3>
		<table>
			<tr><th>물건정보</th><td><input type="text" name="pnameinfo" size="3"/></td></tr>
			<tr><th>물건정보</th><td><input type="text" name="priceinfo" size="3"/></td></tr>
			<tr><td colspan="2">
			<input type="button" value="등록" onclick="register()"/>
			</td></tr>
		</table>
		<table id="tab">
			<tr><th>물건명</th><th>가격</th></tr>
		</table>
		<script type="text/javascript">
		//for(var idx=0; idx<nameArr.length; idx++){ : 배열과 for와 만남.
		//		nameArr[idx]
			function register(){
				var pnames = document.querySelector("[name=pnameinfo]").value;
				var prices = document.querySelector("[name=priceinfo]").value;
				var nameArr = pnames.split("^");
				var priceArr = prices.split(",");
				var tabObj = document.querySelector("#tab");
				var show = "";
				for(var idx=0; idx<nameArr.length; idx++){
					show+="<tr><td>"+nameArr[idx]+"</td><td>"
							+priceArr[idx]+"</td></tr>"
				}
				tabObj.innerHTML += show;
			}
		</script>
		<h2 id="sort1"></h2>
		<h2 id="sort2"></h2>
		<h2 id="sort3"></h2>
		<script>
			var cls01 = [];
			for(var cnt=1;cnt<=30;cnt++){	//1~30
			//Math.random()*100+1 : 1~100 경우의 수 100가지, 시작수 1
			//Math.floor() : 정수로 내림처리 cf) 자바의 (int)동일
			//						parseInt()도 가능하다.
			// 배열명.push(추가할 데이터);
				cls01.push(Math.floor(Math.random()*100+1));
			}
			document.querySelector("#sort1").innerHTML=cls01;
			var ascCls01 = cls01.sort(function(left, right){
				return left - right;
			});
			document.querySelector("#sort2").innerHTML=ascCls01;

			var ascCls01 = cls01.sort(function(left, right){
				return right - left;
			});
			document.querySelector("#sort3").innerHTML=ascCls01;
		</script>
		<table id="list01"></table>
		<table id="rank3"></table>
		<script>
			function Student(no, kor, eng, math){
				this.no = no;
				this.kor = kor;
				this.eng = eng;
				this.math=math;			
			}
			// 객체명.prototype.함수명 = function(){};
			Student.prototype.avg = function(){
				return (this.kor+this.eng+this.math)/3;
			}
			var stuList = [];
			//30명
			for(var cnt=1; cnt<=30; cnt++){
				//배열 안에 객체가 할당 배열명.push(new 객체명());
				var kor = Math.floor(Math.random()*100+1);
				var eng = Math.floor(Math.random()*100+1);
				var math = Math.floor(Math.random()*100+1);
				stuList.push(new Student(cnt,kor,eng,math));
			}
			var desList = stuList.sort(function(left,right){
				return right.avg() - left.avg();
			});
			var list01 = document.querySelector("#list01");
			var show01 = "<tr><th>번호</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th></tr>"
			desList.forEach(function(stud,idx){
				show01 +="<tr><td>"+stud.no+"</td>";
				show01 +="<td>"+stud.kor+"</td>";
				show01 +="<td>"+stud.eng+"</td>";
				show01 +="<td>"+stud.math+"</td>";
				show01 +="<td>"+stud.avg().toFixed(1)+"</td></tr>";
			});
			list01.innerHTML=show01;
			
			var rankData3 = desList.slice(0,3); //배열을 1,2,3 순위 추출..
			var rank3 = document.querySelector("#rank3");
			var show01 = "<tr><th>번호</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th></tr>"
				rankData3.forEach(function(stud,idx){
				show01 +="<tr><td>"+stud.no+"</td>";
				show01 +="<td>"+stud.kor+"</td>";
				show01 +="<td>"+stud.eng+"</td>";
				show01 +="<td>"+stud.math+"</td>";
				show01 +="<td>"+stud.avg().toFixed(1)+"</td></tr>";
			});
			rank3.innerHTML=show01;
			
			
			
		
		</script>
<%--[jsp]
[하] 1. jsp에서 에러페이지의 지정 속성과 실제 에러가 발생한 페이지에 대한 속성을 선언하세요.
		<@ page isErrorPage="true" %> => 에러가 났을때 지정 페이지
		<%@ page errorPage="페이지지정.jsp" %> => 에러 가망성이 있는 페이지
		
		==> 현재페이지가 에러페이지 여부 : isErrorPage="ture"
			현재페이지가 에러가 발생했을때, 처리할 에러페이지 : errorPage="에러페이지"
		
		
[하] 2. String [] s= {""}; s[3]; 코드를 호출하여, 에러가 발생했을 때, 나타날 페이지를 
        지정하여 처리하세요. 
        ==> 에러페이지 : error.jsp
        			isErrorPage="true"
        			<%=exception.getMessage() %>
        			<%exception.printStackTrace() %>
        			
        	발생하는페이지 : errorPage="error.jsp" 
        		String [] s= {""}; s[3];
        
        	에러 : java.lang.ArrayIndexOutOfBoundsException
			나타날 페이지 지정 : <%@ errorPage="a02_whenError.jsp">
        
[하] 3. 서버단위 에러와 페이지 단위 에러처리의 차이점을 기술하세요.
		==> 페이지 단위 에러 처리 : 해당 페이지에서 에러가 발생했을 때,
			에러를 처리할 페이지를 지정.
			각 페이지마다 처리할 에러페이지를 지정.
			
			서버단위 에러 처리 : web.xml에서 모든 페이지에 발생할 에러를 응답코드나 예외 클래스를
			지정하고 처리할 페이지를 선언하면, 프로젝트에 있는 모든 jsp에서 발생하는 에러를
			처리할 수 있다.
		
[하] 4. ArrayIndexOutOfBoundsException를 확인하고, 해당 내용일 때, 처리할 페이지를 구현하고,
        web.xml에 등록하여, 처리되게 하세요.
        ==> ArrayIndexOutOfBoundsException : 특정한 배열의 위치 범위를 초과해서 호출할 때 발생
        	ex) String [] s= {""}; s[3]; 
        	배열의 크기가 1개인데, index로 4번째를 호출할때 발생한다.
        
        <error-page>
			<exception-type>java.lang.ArrayIndexOutOfBoundsException</exception-type>
			<location>/a00_exp/a07_0202/a02_whenError.jsp</location>
		</error-page>
 --%>

</body>
</html>