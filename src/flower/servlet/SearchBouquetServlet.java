package flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;
import flower.dbTools.Paging;

public class SearchBouquetServlet extends HttpServlet {


	private static final long serialVersionUID = -6603164093374805815L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");

		String nowpage = request.getParameter("nowpage");

		String sql = "select * from bouquet";

		DBUtil dbu = new DBUtil();

		Paging paging = dbu.paging(sql, nowpage, 5);
		// List<Map<String,String>> list=dbu.find(sql);
		// request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("manageBouquet.jsp").forward(request,
				response);
	}
}
