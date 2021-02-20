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
      $("h3").text("부서 정보");
   });
   
   
   function upt(){
	   document.querySelector("[name=proc]").value="upt";
	   document.querySelector("form").submit();
   }
   function del(){
	   document.querySelector("[name=proc]").value="del";
	   document.querySelector("form").submit();
   }
</script>
</head>
<%
	A00_DeptDao dao = new A00_DeptDao();

	int deptno =  0;
	String proc = request.getParameter("proc");
	String deptnoS = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	if(deptnoS !=null && !deptnoS.equals("")){
		deptno = Integer.parseInt(deptnoS);
	};
	if(proc != null){
		if(proc.equals("upt")){
			dao.updateDept(deptno,dname,loc);
		}
		if(proc.equals("del")){
			dao.deleteDept(deptno);
		}
	};
	Dept dept = dao.detailDept(deptno);
	
	
	
%>
<body>
	<script>
   var proc = "<%=proc%>";
		if (proc == "upt") {
			if (confirm("수정성공\n조회페이지로 이동?")) {
				location.href = "searchDeptList.jsp";
			}
		}
		if (proc == "del") {
			alert('삭제 성공');
			location.href = "searchDeptList.jsp";
		}
	</script>
	<h3></h3>
	<form method="get">
	<table>
	<%if(dept!=null && deptnoS!=null){ %>
	<input type="hidden" name="proc" value=""/>
		<tr><th>부서번호</th><td><input type="hidden" name="deptno" value="<%=dept.getDeptno()%>"/><%=dept.getDeptno()%></td></tr>
		<tr><th>부서이름</th><td><input type="text" name="dname" value="<%=dept.getDname()%>"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="<%=dept.getLoc()%>"/></td></tr>
		<tr><td colspan="2">
		<input type="button" value="메인화면으로 이동" onclick="location.href='searchDeptList.jsp'"/>
		<input type="button" value="수정" onclick="upt()"/>
		<input type="button" value="삭제" onclick="del()"/>
		</td></tr>
	<%}else{ %>
		<tr><td colspan="2">해당 부서정보는 없습니다.</td></tr>
    <%} %> 
	</table>
	</form>
</body>
</html>