package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class SearchServlet extends HttpServlet {

	private static final long serialVersionUID = -7137276633333215190L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String search = request.getParameter("search");
		String fsql = "select * from flower where f_id in (select f_id from flower where f_name like '%"+search+"%' or f_type like '%"+search+"%')";
		String bsql = "select * from bouquet where b_id in (select b_id from bouquet where b_name like '%"+search+"%')";
		
		DBUtil dbu = new DBUtil();
		List<Map<String,String>> flist = dbu.find(fsql);
		List<Map<String,String>> blist = dbu.find(bsql);
		
		request.setAttribute("flist", flist);
		request.setAttribute("blist", blist);
		request.getRequestDispatcher("searchResult.jsp").forward(request, response);
	}

}
