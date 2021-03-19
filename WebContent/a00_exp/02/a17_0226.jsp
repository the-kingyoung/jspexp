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
		
		
		<fmt:formatDate
			type="date|time|both"
			dateStyle="full/short"
			pattern="yyyy/MM/dd kk:mm:ss:S"
			value="${날짜데이터}"/>
		
[하] 2. fmt의 숫자 형식에 있어서 각 속성값을 기술하세요
		-숫자 기본형식 <fmt:formatNumber value="숫자데이터" var=?/>
		-숫자 통화형식 <fmt:formatNumber value="숫자데이터" type="currency"/>
		-숫자 통화형식 <fmt:formatNumber value="숫자데이터" type="currency" currencySymbol="원"/>
		-숫자 퍼센트형식 <fmt:formatNumber value="숫자데이터" type="percent"/>
		-숫자 패턴형식 <fmt:formatNumber value="숫자데이터" pattern="0,000.000"/>
		
		<fmt:formatNumber
			type="currency|percent"
			pattern="99,999.99" : 특정한 형식으로 숫자를 출력 처리
			currencySymbol="단위처리"
			
[중] 3. 사원테이블의 부서별 최근입사일과 평균 연봉을 화면에 출력하되
        - 입사일은 yyyy/MM/dd 형식, 연봉은 소숫점 2자리까지 표현하세요.
        1) sql 작성
        2) dao 추가
        3) 화면 호출 처리
        
        
        
        --%>
	<jsp:useBean id="eDao" class="jspexp.a03_database.A01_Dao"/>
	<c:set var="empList3" value="${eDao.empList3()}"/>
	<table>
		<tr>
		<th>부서번호</th><th>부서별 최근 입사일</th><th>평균 연봉</th></tr>
		<c:forEach var="emp" items="${empList3}">
		<tr>
			<td>${emp.deptno}</td>
			<td><fmt:formatDate value="${emp.hiredate}" pattern="yyyy/MM/dd"/></td>
			<td><fmt:formatNumber value="${emp.sal}" pattern="0,000.00"/></td></tr>
		</c:forEach>
	</table>
          
<%--      
[하] 4. mvc 패턴이란 무엇인가?
		웹개발을 Model과 View와 Controller로 역할 분담을 소스별로 하여 처리하는 commander패턴 개발 방식이다.
		패턴자바에 commander 패턴과 유사하다.
		controller : 중재자 역할로 요청값을 처리하고, model객체를 호출/선언하고,
			view단(화면 jsp/html)을 호출하는 클래스/객체를 말한다. 
			- 주로 servlet으로 구성되어 있다.
		
		model : 화면단에 구현될 핵심데이터로 조건이나 반복, dao를 통해서 가져와서
			key, value형식으로 저장되는 데이터를 말한다.
		view : 출력할 화면단을 말하며, 주로 jsp/html/다운로드할 파일/pdf 등
			여러가지 형식으로 구성될 수 있다. controller에서 선언된 model데이터를 el/jstl로 출력 처리한다.
		
		
[하] 5. 기본 예제를 기준으로 mvc패턴을 실제 코드를 설명하세요.
		A01_StartController.java : controller단
		request.setAttribute("stud", new Student(name,kor,eng,math));
		: model객체 controller에서 선언.
		
		a11_mvc\\a01_start.jsp : view단
			${stud.name} : 모델데이터의 속성값을 호출..
			
		#controller의 주요 처리 내용.
		1. 요청값 처리.
		String name = request.getParameter("name");
		String kors = request.getParameter("kor");
		
		
		2. 모델데이터를 위해 가공 및 모델 데이터 선언.
		if(name==null) name="";
		int kor=0; if(korS!=null) kor = Integer.parseInt(korS);
		request.setAttribute("stud", new Student(name,kor,eng,math));
		
		
[하] 6. mvc.do?id=himan&pass=7777로 controller단에 요청값을 넘기고
        himan/7777일 때는 view단(jsp)에 @@님 환영합니다. 그외에는 @@@님은 인증된 계정이 아닙니다.
        출력하세요.
        1) 초기 page
        2) 입력후 , 처리 page
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