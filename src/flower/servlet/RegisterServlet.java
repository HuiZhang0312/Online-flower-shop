package flower.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 5071124248205518796L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		
		DBUtil dbu = new DBUtil();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String type = request.getParameter("type");
		String company = request.getParameter("cname");
		String gender = request.getParameter("sex");
		
		int res;
		String sql;
		
		if(type.equals("business")){
			String sqlb = "insert into business (c_type,c_name,company_name,c_address,c_phone,c_email,c_password) values ('"+type+"','"+username+"','"+company+"','"+address+"','"+tel+"','"+email+"','"+password+"')";
			dbu.update(sqlb);
			int c_id = Integer.parseInt(dbu.find("select max(c_id) as c_id from business").get(0).get("c_id"));
			sql = "insert into customer(c_id,c_type,c_name,c_address,c_phone,c_email,c_password) values ("+c_id+",'"+type+"','"+username+"','"+address+"','"+tel+"','"+email+"','"+password+"')";
			res = dbu.update(sql);
		}else{
			String sqli = "insert into individual (c_type,c_name,c_gender,c_address,c_phone,c_email,c_password) values ('"+type+"','"+username+"','"+gender+"','"+address+"','"+tel+"','"+email+"','"+password+"')";
			dbu.update(sqli);
			int c_id = Integer.parseInt(dbu.find("select max(c_id) as c_id from individual").get(0).get("c_id"));
			sql = "insert into customer(c_id,c_type,c_name,c_address,c_phone,c_email,c_password) values ("+c_id+",'"+type+"','"+username+"','"+address+"','"+tel+"','"+email+"','"+password+"')";
			res = dbu.update(sql);
		}
		
		 
		
		if(res==1){
			response.sendRedirect("login.jsp");
		}else{
			response.sendRedirect("index.html");
		}
	}

}
