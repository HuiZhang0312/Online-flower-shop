package flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class RateFlowerServlet extends HttpServlet {

	private static final long serialVersionUID = -3651555151151974315L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String f_id = request.getParameter("f_id");
		String c_id = (String)request.getSession().getAttribute("c_id");
		request.setAttribute("f_id", f_id);
		request.setAttribute("c_id", c_id);
		request.getRequestDispatcher("flowerRating.jsp").forward(request, response);
		/*String sql = "insert into flower_rating (rating,f_id,c_id) values ("+rating+","+f_id+","+c_id+")";
		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if(i==1){
			response.sendRedirect("HomePageServlet");
		}else{
			response.sendRedirect("index.jsp");
		}*/
	}

}
