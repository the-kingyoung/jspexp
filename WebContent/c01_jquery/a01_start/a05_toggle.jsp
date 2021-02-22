<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
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
div{
	background:red;
	border:1px solid blue;
	width:70px;
	height:70px;
	margin:0 3px;
	float:left;
}
.chClass{
	height:10px;
	background-color:yellow
}
.toggleWidth{
	width:40px;
}
</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
/* 
# toggle
1. 특정 내용을 클릭시, 반복적인 내용을 수행할 때 활용된다.
2. 기본형
	$("선택자").toggleClass("클래스명");
		클릭시, 반복해서 클래스가 적용되었다가 적용되지 않았다가 처리
	$("선택자").slideToggle("속성",적용함수)
		해당 내용이 반복적으로 slide가 적용되었다가 적용되지 않았다가 처리
		

*/
//

	$(document).ready(function() {
		$("#run").click(function() {
			$(":animated").toggleClass("toggleWidth");
			//:animated - 동적으로 움직이는 요소객체만, 클릭시마다 class가 
			//			  적용되었다가 적용되지 않았다가를 반복 처리.
		});
		function animateIt() {
			$("#ani").slideToggle("slow", animateIt);
		}
		animateIt();	
		$("#btn2").click(function(){
			$("div").first().toggleClass("chClass");
		});
	});
		//ex)button2를 만들고, 해당 내용을 클릭시,
		//	 첫번째 $("div").first()
		//	 가 선언된 클래스 .chClass{height:10px;background-color:yellow}
		//	 를 toggleClass로 처리되게 하세요
		
</script>
</head>
<body>
	<button id="run">Run</button>
	<button id="btn2">버튼 2</button>
	
	<div></div>
	<div id="ani"></div>
	<div></div>

</body>
</html>