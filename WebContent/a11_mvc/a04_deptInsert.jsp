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


--%>
//
	var ckInsert = "${param.deptno}";
	if( ckInsert!="" ){
		if(confirm("등록하였습니다\n조회화면으로 이동하시겠습니까?")){
			location.href='${path}/dept.do';
		}
	}
	$(document).ready(function(){
		$("#insBtn").on("click",function(){
			if($("[name=deptno]").val()==""){
				alert("부서번호 공백데이터 입니다")
				$("[name=deptno]").focus();
				return false;
			}else{
				if(isNaN($("[name=deptno]").val())){
					alert("부서번호는 숫자형이어야 합니다.")
					$("name=deptno").val("");
					$("name=deptno").focus();
					return false;
				}
			}
			if($("[name=dname]").val()==""){
				alert("부서명 공백데이터 입니다")
				$("[name=dname]").focus();
				return false;
			}
			if($("[name=loc]").val()==""){
				alert("부서위치 공백데이터 입니다")
				$("[name=loc]").focus();
				return false;
			}
			$("form").submit();
		});
	});
</script>
</head>
<body>
	<h3>부서 정보 등록 페이지</h3>
	<form method="post">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno"/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>위치</th><td><input type="text" name="loc"/></td></tr>
		<tr><td colspan="2">
		<input type="button" value="등록" id="insBtn"/>
		<input type="button" value="메인페이지이동" onclick="location.href='${path}/dept.do'"></td></tr>
	</table>
	</form>
</body>
</html>