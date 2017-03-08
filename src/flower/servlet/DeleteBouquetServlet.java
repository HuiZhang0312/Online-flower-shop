package flower.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class DeleteBouquetServlet extends HttpServlet {

	private static final long serialVersionUID = -2665445648678586700L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String b_id = request.getParameter("b_id");
		String sql = "delete from bouquet where b_id = "+b_id;
		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if(i==1){
			response.sendRedirect("SearchBouquetServlet");
		}else{
			response.sendRedirect("index.jsp");
		}
	}

}
