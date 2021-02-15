<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
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
[JSP]
[하] 1. PreparedStatement를 사용하는 이유를 기술하세요.
		1) sql injection을 막기위해 사용된다. (해커가 SQL문을 조작하여 공격하는 것으로부터의 방어)
 		2) db 서버의 sql 해석 속도를 향상시켜 빠른 처리를 한다.
 		
[하] 2. 부서정보조회를 위 PreparedStatement를 활용하여 처리하세요.

public ArrayList<Dept> deptList2(String dname, String loc){
	   ArrayList<Dept> dlist = new ArrayList<Dept>();
	   try {
		   setCon();
		   String sql="SELECT * FROM DEPT\r\n"
		   		+ "WHERE dname LIKE '%'||(?)||'%'\r\n"
		   		+ "AND loc LIKE '%'||(?)||'%'";
		   
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, dname);
		   pstmt.setString(2, loc);
		   rs = pstmt.executeQuery(sql);
		   while(rs.next()) {
			   dlist.add(new Dept(rs.getInt(1),
					   			rs.getString(2),
					   			rs.getString(3)));
		   }
		   System.out.println("데이터 크기 : "+dlist.size());
		   rs.close();
		   pstmt.close();
		   con.close();
		   
	   }catch(SQLException e) {
		   e.printStackTrace();
		   System.out.println("## db처리 예외 ##");
		   System.out.println(e.getMessage());
		   try {
			con.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	   }catch(Exception e) {
		   e.printStackTrace();
		   System.out.println("## 일반 예외 ##");
		   System.out.println(e.getMessage());
	   }
	
	   return dlist;
}

[js]
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 
[js]
[하] 1. 이벤트, 이벤트대상객체, 이벤트 핸들러 함수를 구분하여 예제를 통하여 개념을 정리하세요.
	load : 이벤트 이름 / 이벤트 타입
	onload : 이벤트 속성
	function(){} : 이벤트 핸들러
	
	var header = document.getElementById('header');
	로 변수를 선언 한뒤
	header.onclick=function(){
		//이벤트를 연결해준다. header를 아이디로 갖고있을때
		//클릭을 하면 function()이 기능을 하는것이다.
		this.style.color='pink';
		//this는 핸들러 함수에 연결되어 있는 객체를 뜻하고
		//해당 객체의 속성을 변경시킬 수 있다.
		header.onclick=null;
		로 한번 클릭이후 이벤트를 제거시켜 중복 이벤트발생을 막는다.
	}
	
[중] 2. 물건명 :[    ] 가격:[    ] 갯수 [0](버튼)
         @@@를 @@@원에 @@개 구매하여 @@@원입니다.
        버튼을 클릭할 때 마다, 카운트가 업되고, 하단의 출력내용을 변경하게 처리하세요
        단) 대상객체.이벤트 = 핸들러함수 형식으로 처리하세요.

<script type="text/javascript">
	window.onload = function() {
		var show = document.getElementById('show');
		var increase = document.getElementById('increase');
		var pname = document.querySelector('[name=pname]');
		var price = document.querySelector('[name=price]');
		var cnt = document.getElementById('cnt');

		increase.onclick = function() {
			cnt.innerHTML = Number(cnt.innerHTML) + 1;
			show.innerHTML = pname.value + "를" + price.value + "원에"
					+ Number(cnt.innerHTML) + "개 구매하여" + Number(price.value)
					* Number(cnt.innerHTML) + "원 입니다.";
			console.log(cnt);
		};
	};
</script>
</head>


--%>
<body>
	<h3>물건명 : <input type="text" name="pname"/></h3>
	<h3>가격 : <input type="text" name="price"/></h3>
	<h3>갯수 : <span id="cnt">0</span></h3>
	<button id="increase">버튼</button>
	<h3 id="show"></h3>
</body>
</html>