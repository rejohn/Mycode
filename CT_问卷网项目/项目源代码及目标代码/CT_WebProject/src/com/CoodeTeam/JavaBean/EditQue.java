package com.CoodeTeam.JavaBean;

import java.sql.ResultSet;
import com.CoodeTeam.JavaBean.DBAccess;

public class EditQue {
	
	private int num = 0;
	
	public String show(int queid){
		//queid = 24;
		//描述
		String[] description = new String[100];
		String[] ans = new String[100];
		String result = "";
		
	
		
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "select * from questions where Questionare_idQuestionare ="+queid+" order by `order`" ;
		
			db.query(sql);
			ResultSet rs = db.getRs(); 
			int i = 1;
			try {
				while(rs.next()){

					description[i] = rs.getString("question");
					
					//System.out.println(description[i]);
					String type = rs.getString("type");				
					if(type.equals("single")){						
					ans = rs.getString("answers").split(";");
					result = result + "<label id=\"label"+i+"\" for=\"table"+i+"\">Question"+i+"</label>";
					result = result + "<table id=\"table"+i+"\" class=\"table table-bordered \" value=\""+i+"\">"
					+"<thead><tr class=\"success\">"
					+"<th><textarea  class=\"span8\" style=\"background:transparent;border:0\" rows=\"3\" name=\"A"+i+"\">"+description[i]+"</textarea></th>"
					+"<th><button class=\"btn btn-danger\" onclick=\"fun2(this)\" type=\"button\"><i class ='icon-trash'></i></button></th></tr></thead></tbody>";
					int num = ans.length;
					for (int t =0 ;t<num;t++)
					{
						int k = t+1;
						result = result + "<tr><td><textarea class=\"span3\" style=\"background:transparent;border:0\" rows=\"1\" name=\""+i+"-"+k+"\">"+ans[t]+"</textarea></td>"
								+"<td><button class=\"btn btn-danger\" onclick=\"deleteli(this)\" type=\"button\"><i class ='icon-trash'></i></button></td></tr>";
					}
					result = result + "<tr><td><button class=\"btn btn-primary span2\" onclick=\"add(this)\" type=\"button\">添加一项</button></td></tr></tbody></table>";
					}
					
					
					else if (type.equals("mutiple")){
						ans = rs.getString("answers").split(";");
						result = result + "<label id=\"label"+i+"\" for=\"table"+i+"\">Question"+i+"</label>";
						result = result + "<table id=\"table"+i+"\" class=\"table table-bordered \" value=\""+i+"\">"
						+"<thead><tr class=\"warning\">"
						+"<th><textarea  class=\"span8\" style=\"background:transparent;border:0\" rows=\"3\" name=\"B"+i+"\">"+description[i]+"</textarea></th>"
						+"<th><button class=\"btn btn-danger\" onclick=\"fun2(this)\" type=\"button\"><i class ='icon-trash'></i></button></th></tr></thead></tbody>";
						int num = ans.length;
						for (int t =0 ;t<num;t++)
						{
							int k =t +1;
							result = result + "<tr><td><textarea class=\"span3\"  style=\"background:transparent;border:0\" rows=\"1\" name=\""+i+"-"+k+"\">"+ans[t]+"</textarea></td>"
									+"<td><button class=\"btn btn-danger\" onclick=\"deleteli(this)\" type=\"button\"><i class ='icon-trash'></i></button></td></tr>";
						}
						result = result + "<tr><td><button class=\"btn btn-primary span2\" onclick=\"add(this)\" type=\"button\">添加一项</button></td></tr></tbody></table>";
					}
					
					else if(type.equals("judge")){
						result = result + "<label id=\"label"+i+"\" for=\"table"+i+"\">Question"+i+"</label>";
						result = result + "<table id=\"table"+i+"\" class=\"table table-bordered \" value=\""+i+"\">"
								+"<thead><tr class=\"danger\">"
								+"<th><textarea  class=\"span8\" style=\"background:transparent;border:0\" rows=\"3\" name=\"C"+i+"\">"+description[i]+"</textarea></th>"
								+"<th><button class=\"btn btn-danger\" onclick=\"fun2(this)\" type=\"button\"><i class ='icon-trash'></i></button></th></tr></thead></tbody>";
						result = result + "<tbody><tr><td>"
						+"<div class=\"controls-row span6\"><label><input type=\"checkbox\" value=\"option1\" disabled>True&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>"
						+"<label><input type=\"checkbox\" id=\"optionsCheckbox2\" value=\"option1\" disabled>False</label></div></td></tr></tbody></table>";
					}
										
					else if(type.equals("blank")){
						result = result + "<label id=\"label"+i+"\" for=\"table"+i+"\">Question"+i+"</label>";
						result = result + "<table id=\"table"+i+"\" class=\"table table-bordered \" value=\""+i+"\">"
								+"<thead><tr class=\"active\">"
								+"<th><textarea  class=\"span8\" style=\"background:transparent;border:0\" rows=\"3\" name=\"D"+i+"\">"+description[i]+"</textarea></th>"
								+"<th><button class=\"btn btn-danger\" onclick=\"fun2(this)\" type=\"button\"><i class ='icon-trash'></i></button></th></tr></thead></table>";
					}
					
					
					
					i++;

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
			num = i-1;
		} 
		//System.out.println(result);
		return result;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
	
}
