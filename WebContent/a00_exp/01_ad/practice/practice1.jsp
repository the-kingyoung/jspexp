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
</head>
<body>
<%--
[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.				--%>
<%
	int a=100;
	int b=80;
	int answer=a-b;
	String inNum = request.getParameter("innum");
	if(inNum!=null){
		int innum = Integer.parseInt(inNum);
		if(a-b==answer){
			response.sendRedirect("success.jsp?innum="+innum+"&answer="+answer);
		}else{
			response.sendRedirect("fail.jsp?innum="+innum+"&answer="+answer);
		}
	}
%>

	<h3>빼기 문제</h3>
	<form method="post">
	<table>
		<tr><th>문제</th><td><%=a%>-<%=b%>=?</td></tr>
		<tr><th>정답</th><td><input type="text" name="innum"/></td></tr>
		<tr><td colspan="2"><input type="button" value="제출" onclick="valid()"/></td></tr>
	</table>
	</form>
</body>
<script type="text/javascript">

	function valid() {
		var inNumObj = document.querySelector("input[name=innum]")
		if (inNumObj.value == "") {	//text로 입력한값
			alert("데이터를 입력하세요.");
			inNumObj.focus();	//무조건 입력을 하란식으로 창이 그쪽으로감
		} else {
			if (isNaN(inNumObj.value)) {
				alert("숫자를 입력하세요.");
				inNumObj.value = "";
				inNumObj.focus();
			} else {
				document.querySelector("form").submit();	//form을 서브밋 하겠다.
			}
		}
	}
</script>
</html>