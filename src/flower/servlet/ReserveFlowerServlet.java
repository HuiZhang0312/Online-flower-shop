package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class ReserveFlowerServlet extends HttpServlet {

	private static final long serialVersionUID = -8883571739891184500L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
		String c_id = request.getSession().getAttribute("c_id").toString();
		String f_id = request.getParameter("f_id");
		String quantity = request.getParameter("quantity");
		String location = request.getParameter("location");
		String payment = request.getParameter("payment");
		String date = request.getParameter("date");
		
		String sql = "insert into transactions (c_id,t_date,t_status,t_quantity,t_payment_method,s_id) values ("+c_id+",'"+date+"','pending',"+quantity+",'"+payment+"',"+location+") ";
		
		String sql1 = "select max(t_id) as t_id from transactions";
		
		DBUtil dbu = new DBUtil();
		//insert into transactions table
		int t = dbu.update(sql);
		//get t_id of this reserve
		List<Map<String,String>> list = dbu.find(sql1);
		String t_id = list.get(0).get("t_id");
		//insert into reserve_flower table
		String sql2 = "insert into reserve_flower (t_id,f_id) values ("+t_id+","+f_id+")";
		int rf = dbu.update(sql2);
		
		
		if(t==1){
			if(rf==1){
				request.setAttribute("list",list);
				request.getRequestDispatcher("showTid.jsp").forward(request, response);
			}else{
				response.sendRedirect("index.jsp");
			}
		}else{
			response.sendRedirect("index.jsp");
		}
		
		
		
		
	}

}
