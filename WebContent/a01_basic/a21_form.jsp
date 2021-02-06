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
<%-- name=홍길동&age=25&loc=서울강남역&num01=25&num02=30
대상 페이지 : action="요청값을 받는 페이지"
 --%>
	<h3>form을 통한 요청값 전달</h3>
	<form action="a20_request.jsp">
	<table>
		<tr><th>이름</th>
			<td><input type="text" name="name"/></td></tr>
		<tr><th>나이</th>
			<td><input type="text" name="age"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록"></td></tr>
	</table>
	</form>
	<!-- 
	loc=서울강남역&num01=25를 전송하는 속성지정해서 등록2를 처리하세요
	 -->
	
	<form action="a20_request.jsp">
	<table>
		<tr><th>위치</th>
			<td><input type="text" name="loc"/></td></tr>
		<tr><th>첫번째 숫자</th>
			<td><input type="text" name="num01"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록2"></td></tr>
	</table>
	</form>
	
	
	<form action="a20_request.jsp" method="post">	<!--loc=서울강남역&num01=25이게 주소란에 보이지 않음  -->
	<table>
		<tr><th>위치</th>
			<td><input type="text" name="loc"/></td></tr>
		<tr><th>첫번째 숫자</th>
			<td><input type="text" name="num01"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록3"></td></tr>
	</table>
	</form>
<%-- 
	ex) 받는 a21_reqExp.jsp
		요청값 ?name=홍길동&age=25&loc=서울 신림동
 --%>
 
 	<form action="a21_reqExp.jsp">
	<table>
		<tr><th>이름</th>
			<td><input type="text" name="name"/></td></tr>
		<tr><th>나이</th>
			<td><input type="text" name="age"/></td></tr>
		<tr><th>주소</th>
			<td><input type="text" name="loc"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록4"></td></tr>
	</table>
	</form>
<%-- 
1. 숫자 데이터에 대한 처리.
	1) 전달전에 validate 체크로 반드시 입력하고, 숫자형일때만 전달되게 js처리한 후
		전송되게 한다.
--%>
  	<form action="a22_reqExp.jsp" id="frm" method="post">
	<table>
		<tr><th>숫자1</th>
			<td><input type="text" name="num01"/></td></tr>
		<tr><th>숫자2</th>
			<td><input type="text" name="num02"/></td></tr>
		<tr><td colspan="2">
			<input type="button" onclick="valid()" value="등록5"></td></tr>
	</table>
	</form>
	<h3>다중 데이터 처리.</h3>
	<%--
	a23_reqExp.jsp?pname=사과&pname=바나나&pname=딸기
	 --%>
	  <form action="a23_reqExp.jsp" id="frm2" method="post">
	<table>
		<tr><th>물건명</th>
			<td><input type="text" name="pname"/></td></tr>
		<tr><th>물건명</th>
			<td><input type="text" name="pname"/></td></tr>
		<tr><th>물건명</th>
			<td><input type="text" name="pname"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록6"></td></tr>
	</table>
	</form>
	<%--
	ex) 가격3개 갯수 3개를 전송해서 출력하세요..
	a23_reqExp.jsp?price=3000&price=4000&price=5000&cnt=2&cnt=3&cnt=5
	 --%>
		  <form action="a23_reqExp.jsp" id="frm3" method="post">
	<table>
		<tr><th>가격1</th><td><input type="text" name="price"/></td>
			<th>갯수1</th><td><input type="text" name="cnt"/></td></tr>
		<tr><th>가격2</th><td><input type="text" name="price"/></td>
			<th>갯수2</th><td><input type="text" name="cnt"/></td></tr>
		<tr><th>가격3</th><td><input type="text" name="price"/></td>
			<th>갯수3</th><td><input type="text" name="cnt"/></td></tr>
		<tr><td colspan="4">
			<input type="submit" value="등록7"></td></tr>
	</table>
	</form>
	
	
</body>
<script type="text/javascript">
	function valid(){
		//#frm[name=num01] : id값으로 frm인 요소객체의 계층레벨에 상관이 없이 
		//					하위에 속성이 name이고 속성값이 num01인 객체를 선택
		var num01Obj = document.querySelector("#frm [name=num01]");//#frm input[name=num01]
		if(num01Obj.value==""){
			alert("첫번째 숫자를 입력해 주세요");
			num01Obj.focus();	// 해당위치에 포커스 처리.
		}else{
			if(isNaN(num01Obj.value)){	//숫자형태가 아니면
				alert("숫자를 입력해 주세요");
				num01Obj.value=="";	//기존에 문자열로 입력된 것을 지워준다.
				num01Obj.focus();
			}else{
				//js에 의해 전송처리.(form하위에 submit()버튼을 누르는 것과 동일)
				document.querySelector("#frm").submit();
			}
			
		}
	}
</script>
</html>