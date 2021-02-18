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
<%--
[js]
[하] 1. jquery의 lib의 CDN방식과 local호출방식의 차이를 기술하세요.
		CDN방식은 인터넷에 연결하여 가져오는 방식이고
		lib방식은 이클립스에 직접 넣어 가져오는 방식이다.
		
[하] 2. $(document).ready(function(){})의 의미를 기술하세요.
		화면이 열리고나서 함수를 실행시킬 수 있다.

[하] 3. 계층관계의 선택자의 차이(,>)를 기본예제를 통하여 기술하세요.
		$("div > span") 의 경우 div와 span이 계층 구조를 갖고 있을 시
					바로 밑의 span을 하위 객체로 지정
		$("div  span") 의 경우 div와 span이 계층 구조를 갖고 있을 시
					위치와 관계 없이 하위 객체로 지정
		

[하] 4. 형제관계의 선택자의 차이(+,~)의 차이를  선택자 예제를 통하여 기술하세요.
		$("label+input")의 경우 label을 앞세운 input을 객체로 선택,
		$("label~input")의 경우 label을 앞세운 같은 계층의 모든 input을 객체로 선택,
		
[하] 5. 속성값의 차이(*=,~=,^=,$=)의 차이를 기술하세요.
		$("요소객체[속성*=속성값]")의 경우 속성에 속성값이 포함만 되어있어도 선택
		$("요소객체[속성~=속성값]")의 경우 속성에 속성값이 반드시 단어로 포함이 되어있어야 선택
				
		$("[속성^=속성값]")의 경우 속성이 속성값으로 시작하는 모든 요소객체
		$("[속성$=속성값]")의 경우 속성이 속성값으로 끝나는 모든 요소객체
		

[하] 6. html(), text(), val()의 기능적 차이를 기술하세요.
		$(셀렉터).html() : 셀렉터 하위에 있는 자식 태그들을 태그나 문자열 모두 가져온다.
		$(셀렉터).text() : 셀렉터 하위에 있는 자식 태그들의 문자열만 가져온다.
		$(셀렉터).val() : input태그에 정의된 value속성의 값을 확인할때 사용
		

[JSP]
[하] 1. useBean을 이용하여, 회원등록여부를 DB처리를 통해서 등록여부를 확인하세요.
        회원id:[   ] [등록여부확인] => dao 기능메서드를 통해 확인해서 해당 id가 있으면 등록된 회원입니다.
        없으면 회원등록 가능합니다. 메시지 처리하기.
--%>
//
   $(document).ready(function(){
      $("h3").text("아이디 중복 확인");
   });
	</script>
   	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
   	<jsp:setProperty property="*" name="m"/>
<%
	//m=데이터에 존재하는 아이디값
   	boolean existId = false;
	if (m.getId() != null) {
		log("## 아이디 입력값? " + m.getId());
		A04_MemberDao dao = new A04_MemberDao();

		Member m1 = dao.douCheck(m.getId());
		log("m1 : " + (m1 == null));
		if (m1 == null) {
			existId = true;
		} else {
			existId = false;
%>
	<script>
		alert("사용이 불가능합니다.");
	</script>
<%
	}
}
%>
</head>
<body>
   <h3></h3>
   <form method="post">
   <table>
      <tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
      <tr><td colspan="2"><input type="submit" value="등록여부확인"/></td></tr>
   </table>
   </form>
	<script>
		$("h3").text("아이디 중복 확인");
		var existId =<%=existId%>;
		if (existId) {
			alert("사용이 가능합니다.")
		}
	</script>

</body>
</html>