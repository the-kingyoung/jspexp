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
      $("h3").text("부서 정보 검색");
   });
</script>
</head>
<%
	String dname = request.getParameter("dname");
	if(dname==null||dname.equals("")) dname="";
	String loc = request.getParameter("loc");
	if(loc==null||loc.equals("")) loc="";
	
	
	A00_DeptDao dao = new A00_DeptDao();
	ArrayList<Dept> dlist = dao.display(dname,loc);
%>
<body>
	<h3></h3>
	<form method="post">
	<table>
		<tr><th>부서이름</th><td><input type="text" name="dname" style="width:200px;"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" style="width:200px;"/></td></tr>
		<tr><td colspan="2">
		<input type="submit" value="검색"/>
		<input type="button" value="등록" onclick="location.href='insert.jsp'"/></td></tr>
	</table>
	<table>
		<tr><th>부서번호</th><th>부서이름</th><th>부서위치</th></tr>
		<%for(Dept d : dlist){ %>
		<tr onclick="detail(<%=d.getDeptno()%>)"><td><%=d.getDeptno()%></td><td><%=d.getDname()%></td><td><%=d.getLoc()%></td></tr>
		<%} %>
	</table>
	</form>
	<script type="text/javascript">
   	function detail(deptno){
   		location.href = "detailDept.jsp?deptno="+deptno;
   	}
	</script>
</body>
</html>