package flower.dbTools;

import java.util.List;
import java.util.Map;
/**
 * Paging对象用于存储传回的信息
 * */
public class Paging {
	private int rows;
	private int nowpage;
	private int pages;
	private List<Map<String, String>> list;
	
	public int getRows(){
		return rows;
	}
	public void setRows(int row){
		rows = row;
	}
	
	public int getNowpage(){
		return nowpage;
	}
	public void setNowpage(int np){
		nowpage = np;
	}

	public int getPages(){
		return pages;
	}
	public void setPages(int page){
		pages = page;
	}

	public List<Map<String, String>> getList(){
		return list;
	}
	public void setList(List<Map<String, String>> data){
		list = data;
	}
}
