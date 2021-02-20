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

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("h3").text("부서 정보 등록");
   });
</script>
</head>
<%
	String dname = request.getParameter("dname");
	if(dname==null) dname="";
	String loc = request.getParameter("loc");
	if(loc==null) loc="";

	if (dname != null && !dname.equals("")) {
		A00_DeptDao dao = new A00_DeptDao();
		dao.insertDept(dname, loc);
	}
%>
<script type="text/javascript">
	var dname = "<%=dname%>";
	if(dname){
		alert("등록 성공하셨습니다!\n조회페이지로 이동하시겠습니까?")
		location.href="searchDeptList.jsp";
	}

</script>
<body>
	<h3></h3>
	<form method="post">
	<table>
		<tr><th>부서이름</th><td><input type="text" name="dname"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>
</body>
</html>