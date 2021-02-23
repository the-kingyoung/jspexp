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
		
[하] 2. 배열로 물건명과 가격을 3개씩을 선언한 후, 테이블(1X3)에서
        물건명(가격)  형식으로 한 셀에 표기하세요.--%>

	<%
		pageContext.setAttribute("fname", new String[]{"사과", "딸기", "바나나"});
		pageContext.setAttribute("fprice", new String[]{"3000", "8000", "12000"});
	%>
	<table>
	<tr>
	<c:forEach var="kind" items="${fname}" varStatus="sts">
	<c:forEach var="price" items="${fprice}" varStatus="sts">
		<td>${kind}(${price})</td>
	</c:forEach>
	</c:forEach>
	</tr>
	</table>
<%--        
[하] 3. dao의 수업 중 진행하지 않은 검색데이터 기능메서드를 찾아서 검색 처리화면을 구현하세요.
--%>
	<h1>예제 3번</h1>
	<form method="post">
	<table>
		<tr><th>가격 범위</th>
		<td>
			<input name="from" value="${param.from}">~
			<input name="to" value="${param.to}">
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"></td></tr>
	</table>
	</form>
	
	<jsp:useBean id="price" class="jspexp.a03_database.A02_Exp"></jsp:useBean>
	<c:set var="pList" value="${price.pList(param.from,param.to)}"></c:set>
	<table>
		<caption style="text-align:center">총 건수 : ${pList.size()}</caption>
		<tr>
			<th>물건번호</th>
			<th>물건명</th>
			<th>물건가격</th>
			<th>물건재고</th>
			<th>신규등록일</th>
			<th>제조사</th>
			<th>최근등록일</th>
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
<%--  
[js]
[하] 1. ajax 기본 호출형식과 open()의 속성값과 비동기와 동기의 차이를 기술하세요
[하] 2. [이쪽으로 와보세요] ==> 해당위치로 커서를 옮겼을 때, z01_data.txt에 있는 I love you! 를 비동기적으로
    로딩해서 호출하여 추가적으로 출력하세요..
--%>
<h3 name="ex1"></h3>
<div></div>
</body>
<script type="text/javascript">

//
   $(document).ready(function(){
	   $("h3").text("[이쪽으로 와보세요]");
	   $("[name=ex1]").hover(function(){
		   var xhr = new XMLHttpRequest();
		   xhr.open("get","z01_data",true);
		   xhr.onreadystatechange=function(){
			   if(xhr.readyState==4 && xhr.status==200){
				   $("div").text($("div").text()+xhr.responseText);
			   }
		   };
		   xhr.send();
	   });
      
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