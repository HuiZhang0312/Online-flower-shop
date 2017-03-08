package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class HomePageServlet extends HttpServlet {

	private static final long serialVersionUID = -1404753416079386874L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
		String fsql = "SELECT * FROM flower WHERE 1=1 order by rand()LIMIT 6";
		
		String bsql = "SELECT * FROM bouquet WHERE 1=1 order by rand()LIMIT 6";
		
		DBUtil dbu = new DBUtil();
		
		List<Map<String,String>> flist=dbu.find(fsql);
		request.setAttribute("flist", flist);
		List<Map<String,String>> blist=dbu.find(bsql);
		request.setAttribute("blist", blist);
		
		request.getRequestDispatcher("homePage.jsp").forward(request, response);
		
		
	}

}
