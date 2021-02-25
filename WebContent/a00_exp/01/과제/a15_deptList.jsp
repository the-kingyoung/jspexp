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
<%--

--%>
//
   $(document).ready(function(){
      $("h3").text("시작");
   });
</script>
</head>
<body>
<jsp:useBean id="dao" class="jspexp.a03_database.A02_DeptDao"></jsp:useBean>
<jsp:useBean id="dept" class="jspexp.z01_vo.Dept"></jsp:useBean>
<jsp:setProperty property="*" name="dept"></jsp:setProperty>
<c:set var="dlist" value="${dao.deptList(dept)}"/>
${dlist.size() }
   <h3>부서정보[${dlist.size() }]</h3>
   <table>
      <tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
      <c:forEach var="d1" items="${dlist }">
      <tr><td>${d1.deptno }</td><td>${d1.dname }</td><td>${d1.loc}</td></tr>
      <div></div>
      </c:forEach>
   </table>
</body>
</html>

