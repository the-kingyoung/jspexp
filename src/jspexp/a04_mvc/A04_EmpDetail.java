package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;

/**
 * Servlet implementation class A04_EmpDetail
 */
@WebServlet(name = "empDetail.do", urlPatterns = { "/empDetail.do" })
public class A04_EmpDetail extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_EmpDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//1. 요청값 처리
		//	1) 기본 조회
		String empnoS = request.getParameter("empno");
		if(empnoS==null) empnoS="0";
		int empno = Integer.parseInt(empnoS);
		
		
		//2. 모델 처리
		A01_Dao dao = new A01_Dao();
		request.setAttribute("emp", dao.getEmp(empno));
		
		
		
		//3. view 호출
		String page = "a11_mvc\\a03_empDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
	}

}
