<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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
<script>
	window.onload=function(){

	};
</script>
</head>
<%--
ex)
1. sql
select job, count(*) 사원수,
round(avg(sal)) avgsal
from emp e
group by job
having round(avg(sal))>=2000
order by job;
2. 화면
	평균연봉 [] 이상
	[검색]
	직책		인원 		평균연봉
	

 --%>
 <%
 	String avgsal = request.getParameter("avgsal");
 	if(avgsal==null) avgsal="0";
 	int avg = Integer.parseInt(avgsal);
 	log("##요청값 : "+avgsal);
 	A01_Dao dao = new A01_Dao();
 	ArrayList<jobSalary>jlist = dao.jobSalList(avg);
 %>
<body>
	<form method="post">
	<h3>부서별 통계 정보</h3>
	<table>
		<tr><th>평균연봉</th>
			<td><input type="text" name="avgsal" value="<%=""%>"/>만원 이상</td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>직책</th><th>인원</th><th>평균연봉</th></tr>
		<%for(jobSalary js : jlist){ %>
		<tr><td><%=js.getJob() %></td><td><%=js.getCnt() %></td><td><%=js.getAvgsal() %></td></tr>
		<%} %>
	</table>
</body>
</html>