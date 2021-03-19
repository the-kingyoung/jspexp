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
</head>
<body>
<%--        
[JSP]
[하] 1. jstl의 forEach varStatus의 상태 속성에 대하여 기술하세요.
		배열형이나 ArrayList<VO>형 데이터를 반복적으로 사용할 때
		items 속성과 함께 주로 사용된다.
		
		varStatus = "sts" 변수명 지정
		sts.index : 반복문에서 단위 데이터의 index(0부터)번호를 가져온다.
		sts.count : 반복문에서 단위 데이터의 count(1부터)번호를 가져온다.
		sts.first : 반복문에서 해당 단위데이터가 첫번째인지 여부를 boolean으로 가져온다.
		sts.last  : 반복문에서 해당 단위데이터가 마지막인지 여부를 boolean으로 가져온다.
		
		
[하] 2. 배열로 물건명과 가격을 3개씩을 선언한 후, 테이블(1X3)에서
        물건명(가격)  형식으로 한 셀에 표기하세요.--%>

	<%
		pageContext.setAttribute("pnames", new String[]{"사과", "딸기", "바나나"});
		pageContext.setAttribute("prices", new int[]{3000,4000,5000});
	%>
	<table>
	<tr>
	<c:forEach var="name" items="${pnames}" varStatus="sts">
		<td>${name}(${prices[sts.index]}원)</td>
	</c:forEach>
	</tr>
	</table>
<%--        
[하] 3. dao의 수업 중 진행하지 않은 검색데이터 기능메서드를 찾아서 검색 처리화면을 구현하세요.

		1) useBean으로 사용할 Dao 선언..
		2) 화면구형 검색과 list 처리
		3) 요청값 param.요청명으로 처리.
		4) <c:set var="처리한데이터변수">
		5) <c:forEach를 통해, ArrayList<VO>출력 처리
--%>
<!-- 	<h1>예제 3번</h1> -->
<!-- 	<form method="post"> -->
<!-- 	<table> -->
<!-- 		<tr><th>가격 범위</th> -->
<!-- 		<td> -->
<%-- 			<input name="from" value="${param.from}">~ --%>
<%-- 			<input name="to" value="${param.to}"> --%>
<!-- 		</td></tr> -->
<!-- 		<tr><td colspan="2"><input type="submit" value="검색"></td></tr> -->
<!-- 	</table> -->
<!-- 	</form> -->
	
<%-- 	<jsp:useBean id="price" class="jspexp.a03_database.A02_Exp"></jsp:useBean> --%>
<%-- 	<c:set var="pList" value="${price.pList(param.from,param.to)}"></c:set> --%>
<!-- 	<table> -->
<%-- 		<caption style="text-align:center">총 건수 : ${pList.size()}</caption> --%>
<!-- 		<tr> -->
<!-- 			<th>물건번호</th> -->
<!-- 			<th>물건명</th> -->
<!-- 			<th>물건가격</th> -->
<!-- 			<th>물건재고</th> -->
<!-- 			<th>신규등록일</th> -->
<!-- 			<th>제조사</th> -->
<!-- 			<th>최근등록일</th> -->
<!-- 			<th>담당자</th> -->
<!-- 		</tr> -->
<%-- 		<c:forEach var="pro" items="${pList}"> --%>
<!-- 		<tr> -->
<%-- 			<td>${pro.pnum}</td> --%>
<%-- 			<td>${pro.pname}</td> --%>
<%-- 			<td>${pro.price}</td> --%>
<%-- 			<td>${pro.pstock}</td> --%>
<%-- 			<td>${pro.pnewreg}</td> --%>
<%-- 			<td>${pro.pcompany}</td> --%>
<%-- 			<td>${pro.prereg}</td> --%>
<%-- 			<td>${pro.pdirector}</td> --%>
<!-- 		</tr> -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
<%--
	jspexp.z01_vo.Product2
--%>
<jsp:useBean id="dao" class="jspexp.a03_database.A03_ShopDao"/>
<jsp:useBean id="prod" class="jspexp.z01_vo.Product2"/>
<jsp:setProperty property="*" name="prod"/>
<%--DB검색에 null 방지. --%>
<%-- <c:set target="prod" property="name" value="${empty prod.name?'':prod.name}"/> --%>
<%-- <c:set target="prod" property="to_price" value="${empty prod.to_price?9999999999:prod.to_price}"/> --%>


<h3>물건정보</h3>
<form method="post">
<table>
	<tr><th>물건명</th><td colspan="2"><input type="text" name="name" value="${param.name}"/>
	<tr><th>가격</th>
		<td><input name="fr_price" value="${prod.fr_price}" size="3"/> ~
			<input name="to_price" value="${prod.to_price}" size="3"/></td>
		<td colspan="2">
			<input type="submit" value="검색"/>
		</td></tr>
</table>
</form>


<table>
	<tr>
		<th>물건번호</th>
		<th>물건명</th>
		<th>가격</th>
		<th>갯수</th>
		<th>등록일</th>
		<th>제조사</th>
		<th>입고일</th>
		<th>입고담당자</th>
	</tr>
	<c:set var="plist" value="${dao.shopList(prod)}"/>
	<c:forEach var="prod" items="${plist}">
	<tr>
		<td>${prod.pno}</td>
		<td>${prod.name}</td>
		<td>${prod.price}</td>
		<td>${prod.cnt}</td>
		<td>${prod.credte}</td>
		<td>${prod.company}</td>
		<td>${prod.incomedate}</td>
		<td>${prod.inmanager}</td>
	</tr>
	</c:forEach>
</table>


<%--  
[js]
[하] 1. ajax 기본 호출형식과 open()의 속성값과 비동기와 동기의 차이를 기술하세요
	1) XMLHttpRequest 객체 생성
	2) open ('get/post','요청 url',비동기여부)
	3) onreadystatechange=function(){}비동기처리일때 처리할 함수
		.readyState==4 상태조건
		.status ==200
		responseText : 요청값
	4) send()
		비동기 : 결과데이터를 받기까지 다른 작업 가능,
		동기 : 결과데이터를 받기까지 다른 작업 불가능
	
[하] 2. [이쪽으로 와보세요] ==> 해당위치로 커서를 옮겼을 때, z01_data.txt에 있는 I love you! 를 비동기적으로
    로딩해서 호출하여 추가적으로 출력하세요..
--%>
<!-- <h3 name="ex1"></h3> -->
<!-- <div></div> -->

<h4 style="border:1px solid green">이쪽으로 오세요!!</h4>
<div></div>
</body>
<script type="text/javascript">

//
   $(document).ready(function(){
	   var xhr = new XMLHttpRequest();
	   $("h4").mouseover(function(){
		   $(this).css("background-color","yellow");
		   xhr.open("get","z01_data",true);
		   xhr.onreadystatechange=function(){
			   if(xhr.readyState==4&&xhr.status==200){
				   //$("div").text($("div").text()+xhr.responseText);
				   //	.append(추가할 랜더링 코드)
				   $("div").append("<h3>"+xhr.responseText+"</h3>");
			   }
		   }
		   xhr.send();
	   });
	   $("h4").mouseout(function(){
		   $(this).css("background-color","");
	   });
// 	   $("h3").text("[이쪽으로 와보세요]");
// 	   $("[name=ex1]").hover(function(){
// 		   var xhr = new XMLHttpRequest();
// 		   xhr.open("get","z01_data",true);
// 		   xhr.onreadystatechange=function(){
// 			   if(xhr.readyState==4 && xhr.status==200){
// 				   $("div").text($("div").text()+xhr.responseText);
// 			   }
// 		   };
// 		   xhr.send();
// 	   });
      
   });
</script>

</html>
<%--
<%
	A02_Exp dao = new A02_Exp();
	pageContext.setAttribute("plist",dao.pList());
%>
	<h3>예제 3번</h3>
	<form method="post">
	<table>
		<tr><th>상품이름</th><td><input name="pname" value="${param.pname}"></td>
		<tr><td colspan="2"><input type="submit" value="검색"></td></tr>
	</table>
	</form>
	<jsp:useBean id="pDao" class="jspexp.a03_database.A02_Exp"></jsp:useBean>
	<c:set var="pList" value="${pDao.pList(param.pname)}"></c:set>
	<table>
	<caption style="text-align:center">총 건수 : ${pList.size()}</caption>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>상품재고</th>
			<th>신규등록일</th>
			<th>상품회사</th>
			<th>최신입고일</th>
			<th>담당자</th>
		</tr>
		<c:forEach var="pro" items="${pList}">
		<tr>
			<td>${pro.pnum}</td>
			<td>${pro.pname}</td>
			<td>${pro.price}</td>
			<td>${pro.pstock}</td>
			<td>${pro.pnewreg}</td>
			<td>${pro.pcompany}</td>
			<td>${pro.prereg}</td>
			<td>${pro.pdirector}</td>

		</tr>
		</c:forEach>
	</table>
	 --%>