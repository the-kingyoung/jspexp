<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
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
</head>
<%--        
[JSP]
[중] 1. 2/10숙제의 상세화면에서 물건정보를 수정 처리하세요.
[js]
[하] 1. 강제이벤트란 무엇인가? 개념을 설명하고, 기본예제로 기술하세요.
	 	buttonC.onclick=function(){
 			counterC.textContent="★";
 		}
		buttonD.onclick=function(){
			counterD.textContent="♣";
			buttonC.onclick();
 		}
 		-
 		이벤트의 내용을 강제로 수행시키는 개념으로 위의 예제를 예시로
 		buttonC의 이벤트가 발생하지 않더라도 buttonD 이벤트가 발생할 시
 		코드상으로는 이벤트가 수행된 것과 동일한 효과를 볼 수 있다.

[하] 2. 특정 페이지를 서버에 요청값으로 처리할 때, 유효성 처리 이벤트에 대해 기술하세요.
        1) 이벤트명
        2) 유효성 처리 방법
        
        
[하] 3. 키 이벤트를 이용하여  h3 7개를 아래 위로 키를 입력시 
   이동되어 배경색상과 글자 색상이 변경되게 처리하세요.
--%>
<script>
	window.onload=function(){
		var h3Arr=document.querySelectorAll("h3");
		var idx=-1;
		this.onkeyup=function(){
			for(var i=0; i<h3Arr.length; i++){
				h3Arr[i].style.color="black";
				h3Arr[i].style.backgroundColor="white";
			}
				if(event.keyCode==38){//위로갈때
			   		idx--;
			   		h3Arr[idx].style.backgroundColor="yellow";
			   		h3Arr[idx].style.color="pink";
			   		return false;
			   	}else if(event.keyCode==40){//아래로갈때
			   		idx++;
			   		h3Arr[idx].style.backgroundColor="pink";
			   		h3Arr[idx].style.color="yellow";
			   		return false;
			   	}
			}
		};
</script>
<body>
<h2></h2>
<h3>1</h3>
<h3>2</h3>
<h3>3</h3>
<h3>4</h3>
<h3>5</h3>
<h3>6</h3>
<h3>7</h3>
</body>
</html>