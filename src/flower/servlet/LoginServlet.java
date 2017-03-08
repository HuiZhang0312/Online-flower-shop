package flower.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 749725599238664824L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sql = "select c_id,c_email,c_password from customer where c_email='"+username+"'";
		DBUtil dbu = new DBUtil();
		List<Map<String,String>> list=dbu.find(sql);
		if(list.size()>0){
			String dbps = list.get(0).get("c_password");
			if(password.equals(dbps)){
				//
				request.getSession().setAttribute("username",username);
				request.getSession().setAttribute("c_id",list.get(0).get("c_id"));
				response.sendRedirect("HomePageServlet");//
				//request.getRequestDispatcher(username).forward(request, response);
			}
			else{
				//message?
				response.sendRedirect("login.jsp");
			}
		}
		else{
			response.sendRedirect("login.jsp");
		}
	}

}
