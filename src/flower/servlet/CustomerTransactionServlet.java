package flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;
import flower.dbTools.Paging;

public class CustomerTransactionServlet extends HttpServlet {

	private static final long serialVersionUID = 8716189380338221248L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String nowpage = request.getParameter("nowpage");
		String c_id = (String)request.getSession().getAttribute("c_id");
		String sql = "select * from reserve_flower where t_id in (select t_id from transactions where t_status='completed' and c_id="+c_id+") order by f_id";
		String sql1 = "select * from flower where f_id in (select f_id from reserve_flower where t_id in (select t_id from transactions where t_status ='completed' and c_id="+c_id+")) order by f_id";
		DBUtil dbu = new DBUtil();
		Paging paging = dbu.paging(sql, nowpage, 5);
		Paging fpaging = dbu.paging(sql1, nowpage, 5);
		request.setAttribute("paging", paging);
		request.setAttribute("fpaging", fpaging);
		request.getRequestDispatcher("flowerCanRate.jsp").forward(request, response);
		
	}

}
