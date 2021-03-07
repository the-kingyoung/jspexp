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
 * Servlet implementation class A06_ProdInsController
 */
@WebServlet(name = "prodIns.do", urlPatterns = { "/prodIns.do" })
public class A06_ProdInsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdInsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * int pno, String name, int price, int cnt, String credteS, String company, String incomedateS,
			String inmanager
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String pno = request.getParameter("pno"); if(pno==null||pno.trim().equals("")) pno="0";
		String name = request.getParameter("name"); if(name==null) name="";		
		String price = request.getParameter("price"); if(price==null||price.trim().equals("")) price="0";
		String cnt = request.getParameter("cnt"); if(cnt==null||cnt.trim().equals("")) cnt="0";
		String credteS = request.getParameter("credteS"); if(credteS==null) credteS="";
		String company = request.getParameter("company"); if(company==null) company="";
		String incomedateS = request.getParameter("incomedateS"); if(incomedateS==null) incomedateS="";
		String inmanager = request.getParameter("inmanager"); if(inmanager==null) inmanager="";
		
		if(!name.equals("")) {
			Product2 ins = new Product2(new Integer(pno), name,new Integer(price),
					new Integer(cnt), credteS, company, incomedateS, inmanager );
			A03_ShopDao dao = new A03_ShopDao();
			dao.insertProduct(ins);
		}
		
		String page = "a11_mvc\\a00_prodInsert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
