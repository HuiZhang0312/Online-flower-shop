package flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class UpdateTransactionServlet extends HttpServlet {

	private static final long serialVersionUID = 7997957436435510018L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String t_id = request.getParameter("t_id");
		//String c_id = request.getParameter("c_id");
		//String t_date = request.getParameter("t_date");
		String t_status = request.getParameter("t_status");
		String t_quantity = request.getParameter("t_quantity");
		String t_payment_method = request.getParameter("t_payment_method");
		//String s_id = request.getParameter("s_id");


		String sql = "update transactions set t_status='"+t_status+"', t_quantity='"+t_quantity+"', t_payment_method='"+t_payment_method+"' where t_id="+t_id;

		
		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if(i==1){
			response.sendRedirect("SearchTransactionServlet");
		}else{
			response.sendRedirect("index.jsp");
		}
	}

}
