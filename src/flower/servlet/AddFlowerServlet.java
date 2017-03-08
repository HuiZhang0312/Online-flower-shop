package flower.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class AddFlowerServlet extends HttpServlet {

	private static final long serialVersionUID = -1795916601544982053L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");

		String f_name = request.getParameter("f_name");
		String f_type = request.getParameter("f_type");
		String f_quantity = request.getParameter("f_quantity");
		String f_price = request.getParameter("f_price");
		String f_picture = request.getParameter("f_picture");
		
		String sql = "insert into flower (f_name,f_type,f_quantity,f_price,f_picture) values ('"+f_name+"', '"+f_type+"', "+f_quantity+", "+f_price+",'images\\\\"+f_picture+"')";
		
		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if(i==1){
			response.sendRedirect("SearchFlowerServlet");
		}else{
			response.sendRedirect("index.jsp");
		}
	}

}
