<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"></jsp:useBean>
<c:set var="empList" value="${dao.empList(param.ename, param.job) }"/>
{"tot" : ${empList.size()}, "empList" : [
	<c:forEach var="emp" items="${empList}" varStatus="sts">
		{"empno" : ${emp.empno},"ename":"${emp.ename}","job":"${emp.job}",
		"mgr":${emp.mgr},"hiredate":"${emp.hiredate}","sal":${emp.sal},
		"comm":${emp.comm},"deptno":${emp.deptno} }
		<c:if test="${!sts.last}">,</c:if>
	</c:forEach>
]}