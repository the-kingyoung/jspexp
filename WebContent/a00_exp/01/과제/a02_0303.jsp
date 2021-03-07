<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
[JSP]
[하] 1. MVC 패턴에서 list에서 상세화면 처리시, 요청값 처리방식에 대하여 기술하세요
		1) 상세처리 controller에 해당 데이터 클릭시 요청값 전달.
			# 화면
			<tr class="data"><td>key데이터</td>...
			$(".data").on("dblclick",function(){
				$(this).children().eq(0).text()
				--tr하위에 있는 td의 key데이터
				location.href="${path}/요청컨트롤러uri.do?요청key="+key데이터;
			});
			#컨트롤러
			String key받을변수 = request.getParameter("요청key");
			
			
[하] 2. MVC 패턴에서 상세화면에서 수정과 삭제 처리시 요청값의 내용과 조건에 따른 처리를 기술하세요.
		1) hidden으로 프로세스를 요청값으로 넘기고, 해당 프로세스의 요청값에 따라서
			dao의 수정메서드와 삭제메서드를 처리한다.
			<input type="hidden" name="proc"/>
				요청값을 넘기는 것은 name속성으로 선언하여야지 controller에 전달하기 때문에
				반드시 name="proc"형태로 처리하여야 한다.
			<input type="button" id="uptBtn"/>
			<input type="button" id="delBtn"/>
			$("#uptBtn).on("click",function(){
				$("[name=proc]").val("upt");
				$("form").submit();
			});
			$("#delBtn).on("click",function(){
				$("[name=proc]").val("del");
				$("form").submit();
			});
			# controller
			String proc = request.getParameter("proc");
			if(proc!=null){
				if(proc.equals("upt"){
					//수정에 필요한 요청값 받기, 매개객체에 생성자로 할당.
					//수정에 필요한 dao.기능메서드(매개객체)
				}
				if(proc.equals("del"){
					//삭제에 필요한 dao.기능메서드(key변수);
				}
			}
[중] 3. MVC 패턴으로 물품 상세화면/수정 처리를 해보세요.
  
[js]
[하] 1. 좋아요/싫어요 버튼을 클릭시, 하단에 하트가♥ 하나씩 늘어나든지/줄어들던지 하세요(단 한번만)
[중] 2. 임의의 구구단 문제를 나오게 하고, 정답확인을 클릭시 정답여부를 나오게 한다.
        5초가 지나도 정답여부를 출력하게 처리하세요.
--%>
//
	$(document).ready(function(){
		// 실제 구현 db에서 session으로 한 게시물당 한번만 좋아요
		// 싫어요 처리하고, db에 평가처리했다는 것을 저장 처리.
		var curFavCnt=2;
		$("#favor").one("click","button",function(){
			$("#showHeart").text("");
			if($(this).text()=="좋아요"){
				curFavCnt++;
			}else{
				curFavCnt--;
			}
			for(var cnt=1;cnt<=curFavCnt;cnt++){
				$("#showHeart").append("♥");
			}
		});
		var num01 = Math.floor(Math.random()*8+2);
		var num02 = Math.floor(Math.random()*9+1);
		$("#shExam").text(num01+"X"+num02);
		$("#cfmBtn").on("click",function(){
			var reply=$("#reply").val();
			if(num01*num02==reply){
				alert("정답");
			}else{
				alert("오답");
			}
		});
		setTimeout(function(){
			$("#cfmBtn").trigger("click");
		},5000);
	});
</script>
</head>
<body>
	<h3>좋아요/싫어요</h3>
	<div id="favor">
		<button>좋아요</button>
		<button>싫어요</button>
	</div>
	<h3 id="showHeart">♥♥</h3>
	<h3>시간 내 구구단 처리.</h3>
	<table>
		<tr><th id="shExam"></th></tr>
		<tr><td>정답:<input type="text" id="reply"/>
					<input type="button" id="cfmBtn"
					value="정답확인"/>		
		</td></tr>
		
	</table>
</body>
</html>