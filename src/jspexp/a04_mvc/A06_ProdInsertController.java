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
 * Servlet implementation class A06_ProdInsertController
 */
@WebServlet(name = "proInsert.do", urlPatterns = { "/proInsert.do" })
public class A06_ProdInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name"); if(name==null) name="";
		String price = request.getParameter("price"); if(price==null||price.trim().equals(""));
		String cnt = request.getParameter("cnt"); if(cnt==null||cnt.trim().equals(""));
		String credte = request.getParameter("credte"); if(credte==null) credte="";
		String company = request.getParameter("company"); if(company==null) company="";
		String incomedate = request.getParameter("incomedate"); if(incomedate==null) incomedate="";
		String inmanager = request.getParameter("inmanager"); if(inmanager==null) inmanager="";

		if(!name.equals("")) {
			Product2 ins = new Product2(0,name,new Integer(price),
					new Integer(cnt), credte, company, incomedate, inmanager);
			A03_ShopDao dao = new A03_ShopDao();
			dao.insertProduct(ins);
		}
		
		String page = "a11_mvc\\a00_prodInsert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
