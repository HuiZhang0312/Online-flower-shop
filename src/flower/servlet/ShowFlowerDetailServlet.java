package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class ShowFlowerDetailServlet extends HttpServlet {

	private static final long serialVersionUID = 221255905114054678L;


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
		String ssql = "select * from store";
		DBUtil dbu = new DBUtil();
		List<Map<String,String>> list=dbu.find(sql);
		List<Map<String,String>> slist=dbu.find(ssql);
		request.setAttribute("list", list);
		request.setAttribute("slist", slist);
		request.getRequestDispatcher("showFlowerDetail.jsp").forward(request, response);
	}

}
