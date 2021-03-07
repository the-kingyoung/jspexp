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
	var ckInsert = "${param.name}";
	if (ckInsert!="") {
		if (confirm("등록했습니다\n조회화면으로 이동하시겠습니까?")) {
			location.href = '${path}/prod.do';
		}
	}
	$(document).ready(function() {
		
		$("#insBtn").on("click",function(){
			if($("[name=name]").val()==""){
				alert("상품명을 입력해주세요")
				$("name=name").focus();
				return false;
			}
			if($("[name=price]").val()==""){
				alert("가격을 입력해주세요")
				$("name=price").focus();
				return false;
			}else{
				if(isNaN($("[name=price]").val()) ){
					alert("가격은 숫자형이어야 합니다.")
					$("name=price").val("");
					$("name=price").focus();
					return false;
				}
			}
			$("form").submit();
			
		});

	});
</script>
</head>
<body>
	<h3>상품 등록 페이지</h3>
	<form method="post">
	<table>
			<tr><th>상품명</th><td><input type="text" name="name"></td></tr>
			<tr><th>가격</th><td><input type="text" name="price"></td></tr>
			<tr><th>갯수</th><td><input type="text" name="cnt"></td></tr>
			<tr><th>신규등록일</th><td><input type="text" name="credte"></td></tr>
			<tr><th>제조사</th><td><input type="text" name="company"></td></tr>
			<tr><th>최근등록일</th><td><input type="text" name="incomedate"></td></tr>
			<tr><th>담당자</th><td><input type="text" name="inmanager"></td></tr>
			<tr><td colspan="2">
			<input type="button" value="등록" id="insBtn"/>
			<input type="button" value="메인페이지이동" onclick="location.href='${path}/prod.do'">
			</td></tr>

	</table>
	</form>
</body>
</html>