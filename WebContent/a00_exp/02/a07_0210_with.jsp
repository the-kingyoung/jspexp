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

	};
</script>
</head>
<%--=====================================================================================================================
[중] 3. 쇼핑몰에서 관리자 현재 등록된 물건을 확인하고, 물건을 등록하고, 물건을 상세정보를 출력하는 웹화면을 구현하세요.

        물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일,제조사, 최근입고일, 입고책임자
        조회화면 출력 : 제품번호, 물건명, 물건가격, 물건재고량, 최근입고일 조회조건(물건명, 물건가격 from,to)
=====================================================================================================================
	1) 조회화면 및 요청값 확인
	2) DB설계, 테이블생성, 기본 데이터 입력 등록 sql, 조회 sql 작성
	3) VO, DTO 작성
		ShopProd,
		
	4) DAO 작성
		- 공통
		- 조회 메서드 public ArrayList<ShopProd> shopList(ShopProd sch)
		- 등록 메서드 public insertProduct(ShopProd ins)
		- 단일데이터 메서드 public ShopProd getProd(int prono)
	5) a07_0210_list.jsp 조회화면 구성
		- DAO 호출 조회 메서드 호출.
		- for(ShopProd sp: dao.shopList(sch))
		- 등록 인터페이스 작성 location.href="a07_0210_insert.jsp"
		- 상세화면 이동 인터페이스 작성 onclick="location.href=a07_0210_detail.jsp?prodno=@@"
	6) 등록화면 구현(a07_0210_insert.jsp)
		- form화면 구현
		- 요청값 확인
		- 등록 DAO 처리
	7) 상세화면 구현(a07_0210_detail.jsp)
		- form화면 구현
		- 요청값 처리
		- 상세 메서드 호출
			ShopProd pro = dao.getProd(prono);
		- 데이터 화면 출력
			if(pro!=null)
				value="<%=pro.getPname()%>"

 --%>
 <%
 	String name = request.getParameter("name");
 	if(name==null) name="";
 	
 	String frPriceS = request.getParameter("frPrice");
 	int frPrice=0;
 	if(frPriceS!=null && !frPriceS.equals("")) frPrice=Integer.parseInt(frPriceS);
 	
 	String toPriceS = request.getParameter("toPrice");
 	int toPrice=9999999;
 	if(toPriceS!=null && !toPriceS.equals("")) toPrice=Integer.parseInt(toPriceS);
 	
 	A03_ShopDao dao = new A03_ShopDao();
 	ArrayList<Product2> plist = dao.shopList(new Product2(name, frPrice, toPrice));
 	
 	
 	
 %>
<body>
	<h3>물건 리스트</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input name="name"/></td></tr>
		<tr><th>가격</th><td><input name="frPrice" value="<%=frPrice%>"/>~<input name="toPrice" value="<%=toPrice%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/><input type="button" value="등록" onclick="regProduct()"/></td></tr>
	</table>
	</form>
	<table>
		<tr><th>제품번호</th><th>물건명</th><th>물건가격</th><th>물건재고량</th><th>최근입고일</th></tr>
		<%for(Product2 pro : plist){ %>
		<tr onclick="detail(<%=pro.getPno()%>)"><td><%=pro.getPno() %></td><td><%=pro.getName() %></td>
			<td><%=pro.getPrice() %></td><td><%=pro.getCnt() %></td>
			<td><%=pro.getCredte() %></td></tr>
		<%} %>
	</table>
</body>
<script>
	function regProduct(){
		location.href="a07_0210_insert.jsp"
	}
	function detail(pno){
		location.href="a07_0210_detail.jsp?pno="+pno;
		
	}
</script>
</html>