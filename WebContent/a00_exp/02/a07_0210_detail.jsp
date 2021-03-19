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
		};
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick=function(){
			if(confirm("삭제하시겠습니까?")){
				document.querySelector("[name=proc]").value="del";
				document.querySelector("#upForm").submit();
			}
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
		if(proc.equals("del")){
			System.out.println("# 삭제처리!! : "+pno);
			dao.deleteProduct(pno);
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
	if(proc=="del"){
		alert("삭제되었습니다.\n메인페이지로 이동하겠습니다.")
		location.href="a07_0210_with.jsp";
		
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
		<tr><th>신규등록일</th><td><input type="date" name="credteS" value="<%=pro.getCredte()%>"></td></tr>
		<tr><th>최근입고일</th><td><input type="date" name="incomedteS" value="<%=pro.getIncomedate()%>"></td></tr>
		
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