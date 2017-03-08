package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class ShowReportServlet extends HttpServlet {

	private static final long serialVersionUID = 3769307519086134696L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String sql = "select count(*) as customer_number, t_payment_method from transactions group by t_payment_method";
		String sql1 = "select count(*) as number, t_status from transactions group by t_status";
		
		DBUtil dbu = new DBUtil();
		List<Map<String,String>> plist = dbu.find(sql);
		List<Map<String,String>> slist = dbu.find(sql1);
		request.setAttribute("plist", plist);
		request.setAttribute("slist", slist);
		request.getRequestDispatcher("showReport.jsp").forward(request, response);
	}

}
