package flower.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class DeleteFlowerServlet extends HttpServlet {


	private static final long serialVersionUID = 6735758002005773211L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String f_id = request.getParameter("f_id");
		String sql = "delete from flower where f_id = "+f_id;
		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if(i==1){
			response.sendRedirect("SearchFlowerServlet");
		}else{
			response.sendRedirect("index.jsp");
		}
	}

}
