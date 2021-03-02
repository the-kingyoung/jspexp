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
//
	$(document).ready(function(){
		$("h3").text("시작");
	});
</script>
</head>
<body>
<%--
[JSP]
[하] 1. fmt의 날짜 형식에 있어서 각 속성값을 기술하세요
		-날짜 full형식	<fmt:formatDate type="date" dateStyle="full" value="날짜데이터"/>
		-날짜 short형식<fmt:formatDate type="date" dateStyle="short" value="날짜데이터"/>
		-날짜 기본형식 	 <fmt:formatDate type="date" value="날짜데이터"/>
		
[하] 2. fmt의 숫자 형식에 있어서 각 속성값을 기술하세요
		-숫자 기본형식 <fmt:formatNumber value="숫자데이터" var=?/>
		-숫자 통화형식 <fmt:formatNumber value="숫자데이터" type="currency"/>
		-숫자 통화형식 <fmt:formatNumber value="숫자데이터" type="currency" currencySymbol="원"/>
		-숫자 퍼센트형식 <fmt:formatNumber value="숫자데이터" type="percent"/>
		-숫자 패턴형식 <fmt:formatNumber value="숫자데이터" pattern="0,000.000"/>
			
[중] 3. 사원테이블의 부서별 최근입사일과 평균 연봉을 화면에 출력하되
        - 입사일은 yyyy/MM/dd 형식, 연봉은 소숫점 2자리까지 표현하세요.--%>
	<jsp:useBean id="eDao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="empList3" value="${eDao.empList3()}"></c:set>
	<table>
		<tr>
		<th>부서별 최근 입사일</th>
		<th>평균 연봉</th></tr>
		<c:forEach var="e" items="${empList3}">
		<tr><td>${e.date}</td>
			<td>${e.avgsal}</td></tr>
		</c:forEach>
	</table>
          
<%--      
[하] 4. mvc 패턴이란 무엇인가?
		웹개발을 Model과 View와 Controller로 역할 분담하여 처리하는 commander패턴 개발 방식이다.
		
[하] 5. 기본 예제를 기준으로 mvc패턴을 실제 코드를 설명하세요.
[하] 6. mvc.do?id=himan&pass=7777로 controller단에 요청값을 넘기고
        himan/7777일 때는 view단(jsp)에 @@님 환영합니다. 그외에는 @@@님은 인증된 계정이 아닙니다.
        출력하세요.
<body>

	<h3>로그인 화면</h3>
	<table>
		<tr><th>아이디</th><td>${logInfo.id}</td></tr>
		<tr><th>패스워드</th><td>${logInfo.pass}</td></tr>
	</table>
</body>
============================================출력화면====================================
package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.z01_vo.Member;

/**
 * Servlet implementation class A00_Practice
 */
@WebServlet(name = "mvc.do", urlPatterns = { "/mvc.do" })
public class A00_Practice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A00_Practice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(id!=null)id=id;
		if(id!="himan")
		if(pass!=null) pass=pass;
		if(pass!="7777")
		
		request.setAttribute("logInfo", new Member(id,pass));
		
		String page="a11_mvc\\a00_practice.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
======================================================컨트롤러======================================================

--%>
	<h3>제목</h3>
	<table>
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
</body>
</html>