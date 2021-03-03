package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product2;

/**
 * Servlet implementation class A06_ProdDetail
 */
@WebServlet(name = "prodDetail.do", urlPatterns = { "/prodDetail.do" })
public class A06_ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String proc = request.getParameter("proc");
		
		String pnoS = request.getParameter("pno");
		if(pnoS==null) pnoS="0";
		int pno = Integer.parseInt(pnoS);
		if(proc!=null&&proc.equals("upt")) {
			
		}
		A03_ShopDao dao = new A03_ShopDao();
		if(proc!=null) {
			if(proc.equals("upt")) {
				String name = request.getParameter("name");
				String price = request.getParameter("price");
				String cnt = request.getParameter("cnt");
				String credte = request.getParameter("credte");
				String company = request.getParameter("company");
				String incomedate = request.getParameter("incomedate");
				String inmanager = request.getParameter("inmanager");
				Product2 pro = new Product2(pno, name, Integer.parseInt(price),
						Integer.parseInt(cnt),credte, company, incomedate, inmanager);
				dao.updateProduct(pro);
			}
			if(proc.equals("del")) {
				System.out.println("삭제준비완료:"+pno);
				dao.deleteProduct(pno);
			}
		}
		request.setAttribute("pro", dao.getProd(pno));
		
		
		String page = "a11_mvc\\a00_prodDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
