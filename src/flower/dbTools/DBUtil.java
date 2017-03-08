package flower.dbTools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class DBUtil {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	public String url="jdbc:mysql://127.0.0.1:3306/flower";

	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		try {
			return DriverManager.getConnection(url,"colin","");
			//return DriverManager.getConnection("proxool.myData");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(String sql){
		int row=-1;
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			row=stmt.executeUpdate(sql);	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return row;
	}
	
	public List<Map<String,String>> find(String sql){
		List<Map<String,String>> list=new LinkedList<Map<String,String>>();
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			ResultSetMetaData rsmd=rs.getMetaData();
			while(rs.next()){
				Map<String,String> map=new HashMap<String,String>();
				for(int i=1;i<=rsmd.getColumnCount();i++){
					map.put(rsmd.getColumnName(i),rs.getString(i));
				}
				list.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	public Map<String,String> getOneRow(String sql){
		return find(sql).get(0);
	}
	
	
	 public Paging paging(String sql,String nowpage,int ipage){
		 int pagenow = 1;
		 if(nowpage!=null&&!"".equals(nowpage)){
			 pagenow = Integer.parseInt(nowpage);
		 }
		 String countsql = "select count(*) as countrow from ("+sql+") a";
		 Map<String,String> rowsMap = getOneRow(countsql);
		 int rows = Integer.parseInt(rowsMap.get("countrow").toString());
		 int pages = rows%ipage==0?rows/ipage:rows/ipage+1;
		 int start =(pagenow-1)*ipage+1;
		 //int end = pagenow*ipage;
		 //For MySQL
		 String selectsql = "select t.* from ("+sql+") t limit "+(start-1)+","+5;
		 List<Map<String, String>> list = find(selectsql);
		 Paging paging = new Paging();
		 paging.setRows(rows);
		 paging.setNowpage(pagenow);
		 paging.setPages(pages);
		 paging.setList(list);
		 
		 return paging;
	 }
	 
	 
	private void close(){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(stmt!=null){
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
