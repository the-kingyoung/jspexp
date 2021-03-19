<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
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
[jsp]
[하] 1. 요청의 header에 들어가는 key와 value를 나열해보세요.
	- headerName과 headerValue	

	1) headerName : headerValue
	2) host : localhost:7080	ip주소와 port.
	3) connection : 연결유지. keep-alive
	4) upgrade-insecure-requests : 보안 요청 값. : 1 
	5) user-agent : 지원브라우저. Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36 FS
	6) accept : 전송가능한 형태 html, 파일..pdf
		text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
	7) sec-fetch-site : none
	8) sec-fetch-mode : navigate
	9) sec-fetch-user : ?1
	10) sec-fetch-dest : document
	11) accept-encoding : gzip, deflate, br
	12) accept-language : ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7
	13) cookie : JSESSIONID=FE11F7F7064DE876CF0B2AE8006299B9
		
[하] 2. jsp에서 result.jsp로 요청값 name=himan을 전송하는 경우와 js에서 동일한 내용을 처리하는 코드를 기술하세요.
		- 	form으로 전송
				<form action="result.jsp">
					<input name="name" value="himan"/>
			url로 전송
				response.sendRedirect("result.jsp?name=himan");
			js에서 전송
				location.href="result.jsp?name=himan";


[하] 3. jsp에서 요청값 한개 부터 시작해서, 숫자형 데이터 처리, 다중의 데이터 처리까지 form페이지와 함께 처리한 코드를
    기술하세요. (수업예제 제외)--%>
    <h3>요청값 한개</h3>
    <form action="a05_0127_get.jsp">
    <table>
    <tr><th>이름</th><td><input type="text" name="name"></td></tr>
    <tr><td colspan="2"><input type="submit" value="보내기"></td></tr>
    </table>
    </form>
    
    <h3>숫자형 데이터 처리</h3>
    <form action="a05_0127_get.jsp">
    <table>
    <tr><th>숫자1</th><td><input type="text" name="num01"></td></tr>
    <tr><th>숫자2</th><td><input type="text" name="num02"></td></tr>
    <tr><td colspan="2"><input type="submit" value="보내기"></td></tr>
    </table>
    </form>
    
    <h3>다중의 데이터 처리</h3>
    <form action="a05_0127_get.jsp">
    <table>
    <tr><th>배우 이름</th><td><input type="text" name="ename"></td></tr>
    <tr><th>가수 이름</th><td><input type="text" name="ename"></td></tr>
    <tr><td colspan="2"><input type="submit" value="보내기"></td></tr>
    </table>
    </form>
    
    
<%--
[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.--%>
<%
//Math.random()
   int num01 = (int)(Math.random()*100+1);	//1~100
   int num02 = (int)(Math.random()*100+1);	//1~100
   int corNum = num01-num02;
   String innumS = request.getParameter("innum");
   String corNumS = request.getParameter("corNum");

   if(innumS!=null){ //데이터를 입력했을 때.
      int innum = Integer.parseInt(innumS);
      int cor = Integer.parseInt(corNumS);
      if(cor == innum){ // 정답일때.
         response.sendRedirect("a18_succ.jsp?innum="+innum);
      }else{
         // 오답일 때, 정답과 오답을 요청값으로 전송 처리..
         response.sendRedirect("a19_fail.jsp?innum="
            +innum+"&corNum="+cor);
      }
   }
%> 
<form>
<table>
<tr><th>=?</th></tr>
<tr><td><input type="text" name="innum"></td></tr>
<tr><td><input type="button" onclick="valid()" value="제출"></td></tr>
</table>
</form>

<%--
[js]=>script태그이용
[하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고, point는 숫자값이 되게 js로 처리한 후,
       result.jsp에서 해당 값을 출력하세요 처리하세요.										 --%>
       <h3>유효성 연습</h3>
       <form id="chkFrm">
       <table>
       		<tr><th>아이디</th><td><input type="text" name="id"/></td>
       		<tr><th>포인트</th><td><input type="text" name="point"/></td>
			<tr><td colspan="2"><input type="button" onclick="valid2()" value="제출"/></td></tr>       
       </table>
       
       </form>     
</body>
<script type="text/javascript">
	function valid2(){
		var idObj = document.querySelector("#chkFrm [name=id]");
		var pointObj = document.querySelector("#chkFrm [name=point]");
		var isValid=true;
		if(idObj.value==""){
			alert("아이디 입력해주세요");
			idObj.focus();
			isValid=false;
		}
		if(pointObj.value==""){
			alert("포인트 입력해주세요");
			pointObj.focus();
			isValid=false;
		}elseP
		if(isNaN(pointObj.value)){
			alert("포인트는 숫자를 입력해주세요");
			pointObj.value=="";
			pointObj.focus();
			isValid=false;
		}
	}
	if(isValid){
		// 유효성 check에 해당하지 않을 때만, 서버에 요청값으로 전송 처리..
		document.querySelector("#chkFrm").submit();
	}









function valid(){
	 var inNumObj = document.querySelector("input [name=innum]");
	 if(inNumObj.value==""){
		 alert("데이터를 입력하세요.")
		 inNumObj.focus();
	 }else{
		 if(isNaN(inNumObj.value)){
			 alert("숫자를 입력하세요.")
			 inNumObj.value="";
			 inNumObj.focus();
		 }else{
			 document.querySelector("form").submit();
		 }
	 }
}

</script>
</html>