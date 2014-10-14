package com.CoodeTeam.JavaBean;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.CoodeTeam.JavaBean.DBAccess;

public class UserBean {
	public boolean admin(String username,String password){
		boolean isValid = false;
		DBAccess db = new DBAccess();
		
		if(db.createConn()){
			String sql = "select * from users where usersname ='"+username+"' and userpassword='"+password+"' and userAuthority='2'" ;
			
			db.query(sql);
			if(db.next()){
				isValid = true;
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return isValid;
	}
	public int valid(String username,String password){
		int isValid = 0;
		DBAccess db = new DBAccess();
		
		if(db.createConn()){
			String sql = "select * from users where usersname ='"+username+"' and userpassword='"+password+"' and isalive = '1'";
			
			db.query(sql);
			if(db.next()){
				try {
					isValid= db.getRs().getInt("idUsers");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return isValid;
	}
	public boolean isExist(String username){
		boolean isExist = false;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "select * from users where usersname='"+username+"'";
			db.query(sql);
			isExist=db.next();
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return  isExist;
	}
	
	public void add(String username,String password,String sex,String age,String address){
		DBAccess db = new DBAccess();
		
		int intsex=0;
		if (sex.equals("male"))
		{
			intsex=1;
		}
		else{
			intsex=0;
		}
		int intage=Integer.parseInt(age);
		if(db.createConn()){
			String sql = "insert into users(idUsers,usersname,userAuthority,userpassword,sex,age,address,isonline,isalive) values(null,'"+username+"','1','"+password+"','"+intsex+"','"+intage+"','"+address+"','0','1')";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
	}
	public void addQuestionaire(String title, String subject, String description,int userid)
	{
		DBAccess db = new DBAccess();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date = df.format(new Date());
		
		if(db.createConn())
		{
			
		    String sql = "insert into questionaire(idQuestionare,state,title,subject,description,startdate,enddate,launchdate,isalive,Users_idUsers) values(null,'creating','"+title+"','"+subject+"','"+description+"',null,null,'"+date+"','1','"+userid+"')";
		    db.update(sql);
			db.closeStm();
			db.closeConn();
		}
	} 
	public int getid(int userid){
		DBAccess db = new DBAccess();
		int t = 0;
		if(db.createConn()){
			String sql = "select max(idQuestionare) from questionaire where Users_idUsers="+userid;

			db.query(sql);
			try {
				java.sql.ResultSet rs = db.getRs();
				while(rs.next()){
					t = rs.getInt("max(idQuestionare)");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return t;
		
	}


public void additem(int num,String[] que,String[] ans,String type[],int queid)
	{
		DBAccess db = new DBAccess();
		
		if(db.createConn())
		{
			
			
			for(int i = 1; i<= num;i ++){
				String sql = null;
				if (type[i] == "single" ){
					sql = "insert into questions(idQuestion,`type`,question,answers,analysise,`order`,Questionare_idQuestionare) values(null,'single','"+que[i]+"','"+ans[i]+"',null,"+i+","+queid+")";

				}
				else if (type[i] == "mutiple"){
					sql = "insert into questions(idQuestion,`type`,question,answers,analysise,`order`,Questionare_idQuestionare) values(null,'mutiple','"+que[i]+"','"+ans[i]+"',null,"+i+","+queid+")";
				}
				else if(type[i] =="judge"){
					sql = "insert into questions(idQuestion,`type`,question,answers,analysise,`order`,Questionare_idQuestionare) values(null,'judge','"+que[i]+"','"+ans[i]+"',null,"+i+","+queid+")";
				}
				else if(type[i] == "blank"){
					sql = "insert into questions(idQuestion,`type`,question,answers,analysise,`order`,Questionare_idQuestionare) values(null,'blank','"+que[i]+"','"+ans[i]+"',null,"+i+","+queid+")";
				}				
				
				
				db.update(sql);
			}
			db.closeStm();
			db.closeConn();
		}		
	} 





	
}
