package myPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.BoardDao;

/**
 * Servlet implementation class mypageController
 */
@WebServlet(name = "mypage", urlPatterns = { "/mypage" })
public class mypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * http://localhost:7080/jspexp/mypage
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if(id!=null) {
			BoardDao dao = new BoardDao();
			request.setAttribute("userInfo", dao.userInfo(id));
		}
		String page = "inflearn\\proView\\myInfo.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
