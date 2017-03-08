package flower.servlet;

import java.io.IOException;
import flower.dbTools.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateFlowerServlet extends HttpServlet {

	private static final long serialVersionUID = 1714609886180875427L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		//PrintWriter out = response.getWriter();
		
		String f_id = request.getParameter("f_id");
		String f_name = request.getParameter("f_name");
		String f_type = request.getParameter("f_type");
		String f_quantity = request.getParameter("f_quantity");
		String f_price = request.getParameter("f_price");
		String f_picture = request.getParameter("f_picture");

		f_picture = f_picture.substring(f_picture.lastIndexOf("\\")+1);

		String sql = "update flower set f_name='"+f_name+"', f_type='"+f_type+"', f_quantity="+f_quantity+", f_price="+f_price+",f_picture='images\\\\"+f_picture+"' where f_id="+f_id;

		
		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if(i==1){
			response.sendRedirect("SearchFlowerServlet");
		}else{
			response.sendRedirect("index.jsp");
		}
	
	}

}
