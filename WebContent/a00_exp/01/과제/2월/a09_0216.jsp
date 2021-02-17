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
</head>
<%--        
[JSP]
[중] 1. 2/10숙제의 상세화면에서 물건정보를 수정 처리하세요.
===========================================================================detail===========================================================
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A03_ShopDao"
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
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick=function(){
			document.querySelector("[name=proc]").value="update";
			document.querySelector("#upForm").submit();
		}
	};
</script>
</head>
<%
String proc = request.getParameter("proc");
String name = request.getParameter("name");
String priceS = request.getParameter("price");
String cntS = request.getParameter("cnt");
String credte = request.getParameter("credteS");
String company = request.getParameter("company");
String incomedate = request.getParameter("incomedateS");
String inmanager = request.getParameter("inmanager");
String pnoS = request.getParameter("pno");

int pno=0;
if(pnoS!=null&&!pnoS.equals(""))pno = Integer.parseInt(pnoS);

int price=0;
if(priceS!=null&&!priceS.equals(""))price = Integer.parseInt(priceS);

int cnt=0;
if(cntS!=null&&!cntS.equals(""))cnt = Integer.parseInt(cntS);



log("#proc : "+proc);
log("#name : "+name);
log("#price : "+price);
log("#cnt : "+cnt);
log("#credte : "+credte);
log("#company : "+company);
log("#incomedate : "+incomedate);
log("#inmanager : "+inmanager);
//로그에 잘찍히는지 확인을 하는게 우선
//다 null로 잘찍힘
	A03_ShopDao dao = new A03_ShopDao();
	
	if(proc!=null){
		if(proc.equals("update")){
			Product2 upt = new Product2(pno,name,
					price,cnt,credte,
					company,incomedate,inmanager);
			dao.updateProduct(upt);
		}
	}
	Product2 pro = dao.getProd(pno);

%>
<script type="text/javascript">
	var proc = "<%=proc%>";
	if(proc=="update"){
		if(confirm("수정완료\n메인화면으로 이동하시겠습니까?")){
			location.href="a07_0210_with.jsp";
		}
	}
</script>
<body>
	<h3>상세화면</h3>
	<form method="post" id="upForm">
		<input type="hidden" name="proc" value=""/>
	<table>
		<%if(pro!=null){ %>
		<tr><th>물건번호</th><td><input type="text" name="pno" value="<%=pro.getPno()%>"></td></tr>
		<tr><th>물건명</th><td><input type="text" name="name" value="<%=pro.getName()%>"></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value="<%=pro.getPrice()%>"></td></tr>
		<tr><th>물건재고량</th><td><input type="text" name="cnt" value="<%=pro.getCnt()%>"></td></tr>
		<tr><th>제조사</th><td><input type="text" name="company" value="<%=pro.getCompany()%>"></td></tr>
		<tr><th>입고책임자</th><td><input type="text" name="inmanager" value="<%=pro.getInmanager()%>"></td></tr>
		<tr><th>신규등록일</th><td><input type="text" name="credteS" value="<%=pro.getCredte()%>"></td></tr>
		<tr><th>최근입고일</th><td><input type="text" name="incomedteS" value="<%=pro.getIncomedate()%>"></td></tr>
		
		<%}else{ %>
		<tr><td colspan="2">데이터가 없습니다.</td></tr>
		<%} %>
		<tr><td colspan="2">
			<input type="submit" value="수정" id="uptBtn">
			<input type="submit" value="삭제" id="delBtn">
			<input type="button" value="메인화면이동"
		 		onclick="location.href='a07_0210_with.jsp'"/></td></tr>
	</table>
	</form>
</body>
</html>
=====================================================================수정메서드===========================================================
		public void updateProduct(Product2 upt) {
			try {
				setCon();
				con.setAutoCommit(false);
				String sql = "UPDATE product2\r\n"
						+ "SET name = ?,\r\n"
						+ "	price = ?,\r\n"
						+ "	cnt = ?,\r\n"
						+ "	credte = to_date(?,'YYYY-MM-DD'),\r\n"
						+ "	company = ?,\r\n"
						+ "	INCOMEDTE = to_date(?,'YYYY-MM-DD'),\r\n"
						+ "	inmanager = ?\r\n"
						+ "WHERE pno = ?";
				
				System.out.println("등록 처리");
				System.out.println(sql);
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,upt.getName());
				pstmt.setInt(2,upt.getPrice());
				pstmt.setInt(3,upt.getCnt());
				pstmt.setString(4,upt.getCredteS());
				pstmt.setString(5,upt.getCompany());
				pstmt.setString(6,upt.getIncomedateS());
				pstmt.setString(7,upt.getInmanager());
				pstmt.setInt(8,upt.getPno());

				pstmt.executeUpdate();
			
				
				con.commit();
				
				pstmt.close();
				con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("입력 에러 : "+e.getMessage());
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}catch(Exception e) {
				System.out.println("일반 에러 : " + e.getMessage());
			}
		}      
===========================================================================detail===========================================================
[js]
[하] 1. 강제이벤트란 무엇인가? 개념을 설명하고, 기본예제로 기술하세요.
	 	buttonC.onclick=function(){
 			counterC.textContent="★";
 		}
		buttonD.onclick=function(){
			counterD.textContent="♣";
			buttonC.onclick();
 		}
 		-
 		이벤트의 내용을 강제로 수행시키는 개념으로 위의 예제를 예시로
 		buttonC의 이벤트가 발생하지 않더라도 buttonD 이벤트가 발생할 시
 		코드상으로는 이벤트가 수행된 것과 동일한 효과를 볼 수 있다.
 		
 		-실제 이벤트가 발생하지 않지만 객체.on이벤트명();으로 js코드로 이벤트 발생했을 때,
 		핸들러 함수를 수행하는 것을 말한다.

[하] 2. 특정 페이지를 서버에 요청값으로 처리할 때, 유효성 처리 이벤트에 대해 기술하세요.
        1) 이벤트명 : submit
        2) 유효성 처리 방법
        	선택한form객체.onsubmit=function(){
        		요청값으로 form하위에 있는 요소객체에 대한 유효성 check
        		해당 값이 유효성에 문제가 있을 때, return false처리하여
        		전송하지 못하게 방지한다.
        	}
        
        
[하] 3. 키 이벤트를 이용하여  h3 7개를 아래 위로 키를 입력시 
   이동되어 배경색상과 글자 색상이 변경되게 처리하세요.
--%>
<script>
	window.onload=function(){
		var idx=-1;
		var h3Arr=document.querySelectorAll("h3");
		this.onkeyup=function(e){
			for(var i=0; i<h3Arr.length; i++){
				h3Arr[i].style.color="black";
				h3Arr[i].style.backgroundColor="white";
			}
				if(e.keyCode==38){//위로갈때
			   		idx--;
			   	}else if(e.keyCode==40){//아래로갈때
			   		idx++;
			   	}
				if(idx<0) idx=0;
				if(idx>6) idx=6;
				h3Arr[idx].style.backgroundColor="black";
				h3Arr[idx].style.color="white";
				
				
			}
		};
</script>
<body>
<h2>키 이벤트 처리.</h2>
<h3>1</h3>
<h3>2</h3>
<h3>3</h3>
<h3>4</h3>
<h3>5</h3>
<h3>6</h3>
<h3>7</h3>
</body>
</html>