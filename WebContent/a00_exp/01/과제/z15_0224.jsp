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
<jsp:useBean id="dao" class="jspexp.a03_database.A00_DeptDao"></jsp:useBean>
<c:set var="deptList" value="${dao.display(param.dname, param.loc) }"/>

<body>
	<h3>부서 정보</h3>
	<h4>${deptList.size()}건</h4>
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		<c:forEach var="dept" items="${deptList}">
		<tr>
			<td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>