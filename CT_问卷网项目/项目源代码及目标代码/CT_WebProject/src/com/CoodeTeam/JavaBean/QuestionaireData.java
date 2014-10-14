package com.CoodeTeam.JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import com.CoodeTeam.JavaBean.DBAccess;

public class QuestionaireData{
	
	private String title;
	private String isAnonymous;
	private String ageMin;
	private String ageMax;
	private String sexLimit;
	private String start;
	private String end;
	private String ipLimit;

	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	private String time;
	private String state;
	
	
	//展示我的问卷
	public String showData(int userId,int option){
		String result = "<table style='margin-right:100px' class ='table table-condensed table-bordered table-striped' id='tab' >"
			+ "<thead><tr><th>问卷标题</th><th>创建时间</th><th>状态</th><th>参与人数</th><th>操作</th></tr></thead>"
			+ "<tbody>";
		DBAccess db = new DBAccess();
		DBAccess db1 = new DBAccess();
		if(db.createConn())
		{
			try {
				String sql ="";
				if(option == 1){
					sql="select * from questionaire where state ='creating' and isalive =1 and Users_idUsers= "+userId+" order by launchdate desc";
				}
				else if(option == 2){
					sql="select * from questionaire where state ='open' and isalive =1 and Users_idUsers= "+userId+" order by launchdate desc";
				}
				else if(option == 3){
					sql="select * from questionaire where state ='closed' and isalive =1 and Users_idUsers= "+userId+" order by launchdate desc";
				}
				else if(option == 4){
					sql="select * from questionaire inner join answers on questionaire.idQuestionare = answers.Questionare_idQuestionare where UserID= "+userId+" and isalive =1 order by launchdate desc";
				}
				db.query(sql);
				ResultSet rs = db.getRs();
				
				db1.createConn();
				
				while(db.next())
				{
					String sqlco ="select count(*) from answers where Questionare_idQuestionare = "+rs.getInt("idQuestionare");
					db1.query(sqlco);
					ResultSet rs1 = db1.getRs();
					
					String sta = rs.getString("state");
					//if(sta== "open"){sta = sta+"    ";}
					//else if(sta=="closed"){sta =sta+"  ";}
					if(db1.next());
					{
					result = result + "<tr><td width=170>" + rs.getString("title") 
					+ "</td><td width=80>" + rs.getString("launchdate")
					+ "</td><td width=10>" + sta
					+ "</td><td width=20>" + rs1.getInt("count(*)");
					}
					int qid = rs.getInt("idQuestionare");
					String qst = rs.getString("state");
					
					qst = '"'+qst+'"';
					result = result + "</td><td width=130><button class='btn btn-small btn-primary' title='查看' onclick='ViewQ("+qid+","+qst+")'><i class='icon-search'></i></button>&nbsp&nbsp&nbsp";
					if(option == 1){ 
						result = result + "<button class='btn btn-small btn-info' title='编辑' onclick='EditQ("+qid+","+qst+")'><i class='icon-edit'></i></button>&nbsp&nbsp&nbsp"
						+ "<button class='btn btn-small btn-success' title='发布' data-toggle='modal' data-target='#myModal' onclick='PublishQ("+qid+","+qst+")'><i class='icon-share-alt icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-danger' title='删除' onclick='RemoveQ("+qid+","+qst+")'><i class='icon-trash icon-white'></i></button></td></tr>";
					}else if(option == 2){
						result = result + "<button class='btn btn-small btn-warning' title='数据' onclick='ResultQ("+qid+","+qst+")'><i class='icon-bar-chart icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-danger' title='关闭' onclick='CloseQ("+qid+","+qst+")'><i class='icon-remove icon-white'></i></button>&nbsp&nbsp&nbsp"
						+ "<button class='btn btn-small btn-danger' title='删除' onclick='RemoveQ("+qid+","+qst+")'><i class='icon-trash icon-white'></i></button></td></tr>";
					}else if(option == 3){
						result = result + "<button class='btn btn-small btn-success' title='发布' data-toggle='modal' data-target='#myModal' onclick='PublishQ("+qid+","+qst+")'><i class='icon-share-alt icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-warning' title='数据' onclick='ResultQ("+qid+","+qst+")'><i class='icon-bar-chart icon-white'></i></button>&nbsp&nbsp&nbsp" 
						+ "<button class='btn btn-small btn-danger' title='删除' onclick='RemoveQ("+qid+","+qst+")'><i class='icon-trash icon-white'></i></button></td></tr>";
					}else if(option == 4){
						if(rs.getInt("analysis")==1){
						result = result + "<button class='btn btn-small btn-warning' title='数据' onclick='ResultQ("+qid+","+qst+")'><i class='icon-bar-chart icon-white'></i></button></td></tr>";
						}
					}
				}
				db.closeRs();
				db.closeStm();
				db.closeConn();
				db1.closeRs();
				db1.closeStm();
				db1.closeConn();
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		result = result + "</tbody></table>";
		return result;
	}
	
	//展示可参与的问卷
	public String showResult(int userId){
		String result = "<table style='margin-right:100px' class ='table table-condensed table-bordered table-striped' id='tab' >"
			+ "<thead><tr><th>问卷标题</th><th>发布时间</th><th>参与人数</th><th>操作</th></tr></thead>"
			+ "<tbody>";
		DBAccess db = new DBAccess();
		DBAccess db1 = new DBAccess();
		if(db.createConn())
		{
			try 
			{
				String sql="select * from questionaire where analysis = 1";
				db.query(sql);
				ResultSet rs = db.getRs();
				String sqlco;
				db1.createConn();
				while(db.next())
				{
					sqlco="select count(*) from answers where Questionare_idQuestionare = "+rs.getInt("idQuestionare");
					db1.query(sqlco);
					if(db1.next())
					{
						ResultSet rs1 = db1.getRs();
						result = result + "<tr><td width=180>" + rs.getString("title") 
						+ "</td><td width=80>" + rs.getString("startdate")
						+ "</td><td width=20>" + rs1.getInt("count(*)");
						int qid = rs.getInt("idQuestionare");
						result = result + "</td><td width=130><button class='btn btn-small btn-primary' onclick='ResultQ("+qid+")'><i class='icon-search icon-white'></i>&nbsp查看</button></td></th>";
					}
				}
				db.closeRs();
				db.closeStm();
				db.closeConn();
				db1.closeRs();
				db1.closeStm();
				db1.closeConn();
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		result = result + "</tbody></table>";
		return result;	
	}
	public String showQuestionaire(int userId){
		String result = "<table style='margin-right:100px' class ='table table-condensed table-bordered table-striped' id='tab' >"
			+ "<thead><tr><th>问卷标题</th><th>发布时间</th><th>参与人数</th><th>操作</th></tr></thead>"
			+ "<tbody>";
		DBAccess db = new DBAccess();
		DBAccess db1 = new DBAccess();
		if(db.createConn())
		{
			try {
				String sql ="";
				if(userId != 0){
					String sqlIn = "select * from users where idUsers ="+userId;
					db.query(sqlIn);
					ResultSet rsUser = db.getRs();
					if(db.next()){
					int age = rsUser.getInt("age");
					int sexLimit = rsUser.getInt("sex");
					if(sexLimit == 1){
						sexLimit =2;
					}else{
						sexLimit =1;
					}
					sql="select * from questionaire where state = 'open' and isalive =1 and sexLimit != "+sexLimit+" and "+age+"> ageMin and "+age+"< ageMax order by launchdate desc";
					}
				}
				else if(userId == 0){
					sql="select * from questionaire where state = 'open' and isalive =1 and isAnonymous = 1 order by startdate desc";
				}
				db.query(sql);
				ResultSet rs = db.getRs();
				String sqlco;
				db1.createConn();
				while(db.next())
				{
					sqlco="select count(*) from answers where Questionare_idQuestionare = "+rs.getInt("idQuestionare");
					db1.query(sqlco);
					if(db1.next())
					{
						ResultSet rs1 = db1.getRs();
						result = result + "<tr><td width=180>" + rs.getString("title") 
						+ "</td><td width=80>" + rs.getString("startdate")
						+ "</td><td width=20>" + rs1.getInt("count(*)");
						int qid = rs.getInt("idQuestionare");
						result = result + "</td><td width=130><button class='btn btn-small btn-primary' onclick='JoinInQ("+qid+")'><i class='icon-pencil icon-white'></i>&nbsp参与</button></td></th>";
					}
				}
				db.closeRs();
				db.closeStm();
				db.closeConn();
				db1.closeRs();
				db1.closeStm();
				db1.closeConn();
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		result = result + "</tbody></table>";
		return result;	
	}
	
	public void submit(String isAnonymous,String ageMin,String ageMax, String sexLimit,String start,String end, String ipLimit,String idQuestionare){
		
		 this.isAnonymous=isAnonymous;
		 this.ageMin=ageMin;
		 this.ageMax=ageMax;
	     this.sexLimit=sexLimit;
	     this.state="open";
	     this.start=start;
	     this.end=end;
	     this.ipLimit=ipLimit;
		DBAccess db = new DBAccess();
		if(db.createConn()){
		  String sql="update questionaire set ipLimit='"+this.ipLimit+"', startdate='"+this.start+"',enddate='"+this.end+"', state='"+this.state+"',isAnonymous='"+this.isAnonymous+"',ageMin='"+this.ageMin+"',ageMax='"+this.ageMax+"',sexLimit='"+this.sexLimit+"' where idQuestionare = '"+idQuestionare+"'";
		  db.update(sql);
		}
	}
	public int checkip(String ip, String idQuestionaire){
		DBAccess db = new DBAccess();
		int i = 0;
		if(db.createConn()){
			String sql="select * from answers inner join questionaire on idQuestionare = Questionare_idQuestionare where ipLimit = 1 and Questionare_idQuestionare ='"+idQuestionaire +"' and IPaddress ='"+ip+"'"; 
			db.query(sql);
			ResultSet rs = db.getRs();
			if(db.next())
			{
				i = 1;
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return i;
		
	}
	public int checkState(String idQuestionaire)
	{
		int i=0;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql="select * from questionaire where idQuestionare ='"+idQuestionaire +"'"; 
			db.query(sql);
			ResultSet rs = db.getRs();
			if(db.next())
			{
				try {
					if(rs.getString("state").equals("closed")||rs.getString("state").equals("creating")){
					i = 1;}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return i; 
	}
	
	public int isAnonymous(String qid){
		int i=1;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql="select * from questionaire where idQuestionare ='"+qid +"'"; 
			db.query(sql);
			ResultSet rs = db.getRs();
			try {
				if(rs.next())
				{
					if(rs.getInt("isAnonymous") == 0)
						i=rs.getInt("isAnonymous");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return i;
	}

}

