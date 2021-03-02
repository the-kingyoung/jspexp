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
<script type="text/javascript">
//

	var xhr = new XMLHttpRequest();
	$(document).ready(function() {
		$("[name=dname],[name=loc]").keyup(function() {
			searchFun();
		});
	});

	function searchFun() {
		var dnameV = $("[name=dname]").val();
		var locV = $("[name=loc]").val();
		var qstr = "dname=" + dnameV + "&loc=" + locV;
		xhr.open("get", "z15_0224.jsp?" + qstr, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				$("div").html(xhr.responseText);
			}
		};
		xhr.send();
	}
/*
# 상세화면 popup처리
1. 로딩되는 div설정
	1) css로 절대 위치 지정, 크기
	2) 초기화면은 해당 div를 .hide()(jquery에서 보이지 않게 처리)
2. 리스트 화면에서 클릭시 
	1) empno값 전달
	2) 로딩 div 보이게 처리 .show()
	3) ajax로 empno의 값으로 처리된 상세화면 jsp 구현
	4) ajax로 해당 화면 호출..
	5) 기타 창닫기 처리 .close();
*/
</script>
</head>
<%--        
[JSP]
[하] 1. forTokens의 기본 속성값을 기술하세요.
   1) var : 구분자에서 추출한 하나의 데이터
   2) items : 구분자가 있는 문자열("")
   3) delims : 구분자

[하] 2. 좋아하는 스포츠 스타 9명을 #으로 리스트하여 forTokens를 이용해서 3X3 테이블에 출력하세요.
--%>
   <c:set var="cnt" value="1"/>
   <table>
      <c:forTokens var="sportsStar" 
         items="박용택#이병규#손흥민
              #박지성#박찬호#박세리
              #김연아#김연경#기성용" delims="#">
      <c:if test="${cnt%3==1}"><tr></c:if>
         <td>${sportsStar}</td>
      <c:if test="${cnt%3==0}"></tr></c:if>
      <c:set var="cnt" value="${cnt+1}"/>
      </c:forTokens>
   </table>
   
<%--  
[ajax]
[하] 1. ajax데이터의 속성과 속성값 처리 형식을 기술하세요.
   {"속성":"문자열데이터","속성" : 숫자형/boolean형 데이터}
--%>

<%--   
[하] 2. 부서 정보를 ajax로 keyup을 통해서, 검색 출력하세요.
--%>

<%--
[중] 3. 오늘 ajax로 리스트 emp 데이터를 행단위로 클릭시 empno데이터를 요청값으로 넘겨주어
    list된 화면에 중앙 위치에 div 창이 show(), hide()를 통해서 상세내용을 ajax를 통해서
    출력하세요. dao의 Emp getEmp(int empno)메서드 활용 --%>
<body>
   <h3>부서정보</h3>
   <table>
      <tr><th>부서이름</th><td><input type="text" name="dname"/></td></tr>
      <tr><th>부서위치</th><td><input type="text" name="loc"/></td></tr>
   </table>
   <div></div>

</body>
</html>