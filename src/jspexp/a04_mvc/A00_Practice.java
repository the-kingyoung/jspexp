package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspexp.z01_vo.Member;

/**
 * Servlet implementation class A00_Practice
 */
@WebServlet(name = "mvc.do", urlPatterns = { "/mvc.do" })
public class A00_Practice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A00_Practice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//1. 요청값 처리..
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//2. 모델 데이터 처리
		//	1) 초기페이지 - 초기 로그인 페이지 설정.
		//	2) 입력 후 페이지. - 입력 후 정상일 때 페이지 설정.
		if (id == null) id = "";
		if (pass == null) pass = "";
		String page="a17_loginForm.jsp";
		if (!id.equals("") && !pass.equals("")) {
			if (id.equals("himan") && pass.equals("7777")) {
				request.setAttribute("isSuccess", true);
				//DB연동의 경우, session값을 설정해서 model데이터를 맵핑한다.
				//HttpSession session = request.getSession();
				//session.setAttribute("member", dao.login(id,pass));
				//a00_exp\01\과제\a17_loginForm.jsp
				page="a17_successForm.jsp";
			} else {
				request.setAttribute("isSuccess", false);
			}
		}
		//3. 화면단 호출.
		RequestDispatcher rd = request.getRequestDispatcher("a00_exp\\01\\과제\\"+page);
		rd.forward(request, response);
		
		
		
	}

}
