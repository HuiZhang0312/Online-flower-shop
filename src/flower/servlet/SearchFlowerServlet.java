package flower.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.*;

public class SearchFlowerServlet extends HttpServlet {

	private static final long serialVersionUID = -7137276633333215190L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
		String nowpage = request.getParameter("nowpage");
		
		String sql = "select * from flower";

		DBUtil dbu = new DBUtil();
		
		Paging paging = dbu.paging(sql, nowpage, 5);
		//List<Map<String,String>> list=dbu.find(sql);
		//request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("manageFlower.jsp").forward(request, response);
	}

}
