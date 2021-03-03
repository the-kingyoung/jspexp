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
<%--
[JSP]
[하] 1. MVC 패턴으로 물건 list 조회하는 화면을 만드세요.
============================Controller====================================================
package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;

/**
 * Servlet implementation class A00_0302
 */
@WebServlet(name = "product2.do", urlPatterns = { "/product2.do" })
public class A00_0302 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A00_0302() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		
		if(name==null) name="";
		if(company==null) company="";
		
		A03_ShopDao dao = new A03_ShopDao();
		request.setAttribute("plist", dao.proList(name, company));

		String page="a11_mvc\\a00_0302.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
===============================================mvc=============================================================
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

	});
</script>
</head>
<body>
	<h3>물건 리스트</h3>
	<form method="post">
	<table>
		<tr><th>부서명</th>
		<td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><th>지역</th>
		<td><input type="text" name="company" value="${param.company}"/></td></tr>
		<tr><td colspan="2">
		<input type="submit" value="검색"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>갯수</th>
			<th>신규등록일</th>
			<th>제조사</th>
			<th>최신입고일</th>
			<th>상품담당자</th></tr>
	<c:forEach var = "pro" items="${plist}">
		<tr>
		<td>${pro.pno}</td>
		<td>${pro.name}</td>
		<td>${pro.price}</td>
		<td>${pro.cnt}</td>
		<td>${pro.credte}</td>
		<td>${pro.company}</td>
		<td>${pro.incomedate}</td>
		<td>${pro.inmanager}</td></tr>
	</c:forEach>
	</table>
</body>
</html>
=============================================================================================================--%>

<%--  
[js]
[하] 1. 이벤트의 기본 형식을 기술하세요
	1) $("선택자").이벤트명(function(){처리할 내용})
	2) $("선택자").on("이벤트명",function(){})
	   $("선택자").on({"이벤트1":function(){},"이벤트2":function(){})
	   $("선택자").on("이벤트명","선택자하위객체",function(){});
	   		장래에 만들어질 요소객체(선택자 하위객체)에 대한 이벤트 처리
	   $("선택자").bind("이벤트명",function(){});
	   $("선택자").bind("이벤트명",{넘겨질 json형식데이터},function(event){
	   		event.data로 매개변수에 있는 json데이터를 활용할 수 잇다.
	   });
	   $("선택자")

[하] 2. 커져라, 작아져라 버튼을 통해서, 특정이미지의 크기를 상대적으로 점점 커지거나,
        작아지게 처리하세요.
        
        $(document).ready(function(){
		//예제 2번
		var cnt=200;
		$("#large").on("click",function(){
			$("img").attr({src:"r1.JPG",width:cnt++,height:cnt++});
		});
		$("#small").on("click",function(){
			$("img").attr({src:"r1.JPG",width:cnt--,height:cnt--});
		});
	});
        
[하] 3. checkbox의 checked 속성 처리 형식 2가지를 기술하세요.
			$("선택자").removeAttr("속성"); 속성 삭제
			$("선택자").attr("속성","속성값"); 속성 저장
			$("선택자").prop("checked",true/false);
				checked속성의 true/false를 통해서 checked/unchecked 처리...
			
[하] 4. h3로 무지개 색상이 나오고, 클릭시, 바로 밑에 h4로 해당 RE:색상형식으로 추가되어
        클릭시, 글자 색상이 변경되게 하세요.
모르겠습니다..
--%>
//
	$(document).ready(function(){
		$(".btn").on("click",function(){
			//$("img").attr("width") 문자열로 속성의 값을 가져오기 때문에
			//숫자로 형변환 처리 필요.
			var width = Number($("img").attr("width"));
			var height = Number($("img").attr("height"));
			if($(this).val()=="커져라"){
				width+=10;
				height+=10;
			}else{
				width-=10;
				height-=10;
			}
			$("img").attr("width",width);
			$("img").attr("height",height);
		});
		
		
		$("h3").on("click",function(){
			$(this).next().append("<h4 id="+$(this).text()+">RE:"+$(this).text()+"</h4>")
		});
		$("body").on("click","h4",function(){
			$(this).css("color",$(this).attr("id"));
		});
		
		
	});

</script>
</head>
<body>
<!-- 	<h3>제목</h3> -->
<!-- 	<div></div> -->
<!-- 	<button id="large">커져라</button> -->
<!-- 	<button id="small">작아져라</button><br/> -->
<!-- 	<img src="r1.JPG" width="200" height="200"/> -->
		<h3>커져라/작아져라</h3>
		<input type="button" value="커져라" class="btn"/>
		<input type="button" value="작아져라" class="btn"/><br/>
		<img src="r1.JPG" width="200" height="200"/>
		
		<h3>red</h3><span></span>
		<h3>orange</h3><span></span>
		<h3>yellow</h3><span></span>
		<h3>green</h3><span></span>
		<h3>blue</h3><span></span>
		<h3>navy</h3><span></span>
		<h3>purple</h3><span></span>
</body>
</html>