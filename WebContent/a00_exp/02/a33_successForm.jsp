<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
   $(document).ready(function(){
      var isSuccess="${isSuccess}";
      
      if(isSuccess=="true"){
         alert("${param.id}님 로그인 성공");
      }
      
   });
</script>
</head>
<body>
   <h3>메인페이지 </h3>
   <h4 align="right">${mem.id}로그인 중</h4>
   <h6>게시판만들기</h6>
   <form action="insert.do"> <!-- 
      해당 게시물 등록시 controller에서 다음과 같이 받을 수 있다.  
      String request.getParameter("writer");
    -->
   <!-- 게시물등록 현재로그인한 사람을 작성자로 할 때.. -->
      <input type="hidden" name="writer" value="${mem.id}"/>
      제목:<input type="text" name="titile" /><br>
      내용:<input type="text" name="content" /><br>
      <input type="submit" value="게시물 등록"/><br>
   </form>
   <h5>세션값 확인</h5>
   <h5>${mem.pass}</h5>
   <h5>${mem.name}</h5>
   <h5>${mem.point}</h5>
   <h5>${mem.auth}</h5>
   <a href="${path}/a00_exp/02/a34_main.jsp">내정보 확인</a>
</body>
</html>