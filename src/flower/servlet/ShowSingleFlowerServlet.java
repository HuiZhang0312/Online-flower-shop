package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class ShowSingleFlowerServlet extends HttpServlet {

	private static final long serialVersionUID = 1714609886180875427L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String f_id = request.getParameter("f_id");
		String sql = "select * from flower where f_id ="+f_id;
		DBUtil dbu = new DBUtil();
		List<Map<String,String>> list=dbu.find(sql);
		request.setAttribute("list", list);
		request.getRequestDispatcher("updateFlower.jsp").forward(request, response);
	}

}
