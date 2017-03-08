package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class ShowSingleBouquetServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4221818018307393857L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String b_id = request.getParameter("b_id");
		String sql = "select * from bouquet where b_id =" + b_id;
		DBUtil dbu = new DBUtil();
		List<Map<String, String>> list = dbu.find(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("updateBouquet.jsp").forward(request,
				response);
	}

}
