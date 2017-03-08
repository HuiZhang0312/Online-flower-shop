package flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;
import flower.dbTools.Paging;

public class SearchTransactionServlet extends HttpServlet {

	private static final long serialVersionUID = -2152462760972037162L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String nowpage = request.getParameter("nowpage");
		
		String sql = "select * from transactions";

		DBUtil dbu = new DBUtil();
		
		Paging paging = dbu.paging(sql, nowpage, 5);
		//List<Map<String,String>> list=dbu.find(sql);
		//request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("manageTransaction.jsp").forward(request, response);
	}

}
