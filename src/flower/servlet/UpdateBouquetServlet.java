package flower.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import flower.dbTools.DBUtil;

public class UpdateBouquetServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1062427896005376803L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		// PrintWriter out = response.getWriter();

		String b_id = request.getParameter("b_id");
		String b_name = request.getParameter("b_name");
		String b_type_amount = request.getParameter("b_type_amount");
		String b_quantity = request.getParameter("b_quantity");
		String b_price = request.getParameter("b_price");
		String b_picture = request.getParameter("b_picture");
		
		b_picture = b_picture.substring(b_picture.lastIndexOf("\\")+1);

		String sql = "update bouquet set b_name='" + b_name + "', b_type_amount='"
				+ b_type_amount + "', b_quantity=" + b_quantity + ", b_price="
				+ b_price + ",b_picture='images\\\\" + b_picture + "' where b_id="
				+ b_id;

		DBUtil dbu = new DBUtil();
		int i = dbu.update(sql);
		if (i == 1) {
			response.sendRedirect("SearchBouquetServlet");
		} else {
			response.sendRedirect("index.jsp");
		}

	}

}
