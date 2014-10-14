package com.CoodeTeam.JavaBean;
import java.sql.*;
import java.util.ArrayList;

import com.CoodeTeam.JavaBean.Users;
import com.mysql.jdbc.Statement;
import com.CoodeTeam.JavaBean.QuestionItem;

public class questionnaireCreate {
	   String password="";
	   String  idQuestionare ="";
	   String  State ="";
	   public   String  title ="";
	   String  subject="";
	   String  description ="";
	   String  startdate ="";
	   String  enddate ="";
	   String  launchdate ="";
	   String  isalive ="";
	   String   UsersName ="";
	   String  UserID="";
	 public ArrayList<QuestionItem> QuestionsItems=new ArrayList<QuestionItem >();
	public boolean alive=true;
      
	String sDBDriver = "com.mysql.jdbc.Driver";
	String url = "";
	String temp ="";
	String resultRow = "<tr> <td></td><td><table><tr></tr><tr> ";
	
	ResultSet result=null;
	
	/* 
	private String title;
	private String subject;
	private String description;
	private String date;//questionnaire 
	
	private String type;
	private String question;
	private String answers;
	private String order;
	*/
	public int getAnnu()
	{
		 String sql = null;
			
			Connection conn = null;
			
			ResultSet ra = null;
			int recordCount=0;
			
			try{
				sql = "SELECT count(*) FROM answers where answers.Questionare_idQuestionare='"+this.idQuestionare+"'";
				
				recordCount = DbManager.getCount(sql);
			}catch (Exception e)
			{
				
			}
			return recordCount;
	}
	 public  String IsAlive(String a)
	 {
		 
		//int k = a.
		 if (a.equals("1"))
		 {
			 return "正常";
			 }
		 else
		 {
			 return "禁用";
		 }
	 }
public String Select(String id){
		
		
		try{
			DBAccess db = new DBAccess();
			ResultSet ra=null;
			//ArrayList answerItems=new ArrayList<String >();
			try{
			if(db.createConn()){
				String sql = "SELECT * FROM questionaire where questionaire.idQuestionare = '" +id+"';";
				db. query(sql);
				result=db.getRs();
				
				 while(result.next()){
				    	
				    	String temp =result.getString("type").trim();
				    	if(temp.equals("single")){
				    		
				    			resultRow += ""+result.getString("order")+".（单选)";
				    			resultRow +=""+ result.getString("question")+"</br>";
				    			resultRow += ""+result.getString("answers")+"</tr><tr> 	";
				    	}
				    	else if(temp.equals("mutiple")){
				    			resultRow +=""+ result.getString("order")+".（多选)";
				    			resultRow += ""+result.getString("question")+"</br>";
						    	resultRow += ""+result.getString("answers")+"</tr><tr> 	";
				    	}
				    	else if(temp.equals("blank")){
				    			resultRow += ""+result.getString("order")+".（填空）";
				    			resultRow +=""+ result.getString("question")+"</tr><tr>";
				    	}
				    	resultRow +="</br></br>";
				    		
				    }
				    	
				    resultRow +="</tr></table></td></tr>";
				    	
				    
				    db.closeRs();
				    db.closeConn();
				    
				   
			}}catch (Exception e)
			{
				
			}
			
			

		   
		   
		   
		}catch(Exception e){
			
		}
		return resultRow;
	}


	
	public questionnaireCreate(String id) {
		super();
		this.idQuestionare = id;
		DBAccess db = new DBAccess();
		ResultSet ra=null;
		//ArrayList answerItems=new ArrayList<String >();
		try{
		if(db.createConn()){
			String sql = "SELECT * FROM questionaire where questionaire.idQuestionare = '" +id+"';";
			db. query(sql);
			ra=db.getRs();
	
	      if(ra.next())
	      {
	    	  idQuestionare=ra.getString("idQuestionare");
	    	  State=ra.getString("State");
	    	  title=ra.getString("title");
	    	  subject=ra.getString("subject");
	    	  description=ra.getString("description");
	    	  State=ra.getString("State");
	    	  startdate=ra.getString("startdate");
	    	  enddate=ra.getString("enddate");
	    	  launchdate=ra.getString("launchdate");
	    	  UserID=ra.getString("Users_idUsers");
	    	  Users a=new Users(ra.getString("Users_idUsers"));
	    	  UsersName= a.getUsersname();
	    	  isalive=IsAlive(ra.getString("isalive"));
	    	  if(ra.getString("isalive").equals("1"))
	    	  {
	    		  alive=true;
	    	  }
	    	  else{
	    		  alive=false;
	    	  }
	    	  
	    	  DBAccess db1 = new DBAccess();
	  		   ResultSet rs=null;
	  		
	  		try{
	  		if(db1.createConn()){
	  			String sql1 = "select * FROM questions WHERE questions.Questionare_idQuestionare='"+idQuestionare+"';";
	  			db1. query(sql1);
	  			rs=db1.getRs();
	  			while(rs.next())
	  			{
	  			     String aa= rs.getString("idQuestion");
	  			     QuestionItem temp =new QuestionItem(aa);
	  			     QuestionsItems.add(temp);
	  			       
	  				}
	  				
	  				
	  			}
	  			db1.closeStm();
	  			db1.closeConn();
	  		}
	  		catch (Exception e)
	  		{
	  			
	  		}
	  		
	    
	      }
	       ra.close();
	       db.closeConn();
	       }
		}catch(Exception e)
	       {
	  	   //out.println(e.getMessage());
	  	  }
	}
	public String show()
	{String aa="";
	  aa+=" <table class='table'  ><tr> <td>问卷题目：</td><td>"
	  +this.title+"</td></tr><tr> <td>"+"标签：</td><td> "
	  +this.subject +"</td></tr><tr> <td>发布状态:</td><td>"
	  +this.State+"</td></tr><tr> <td>描述：</td><td>"
	  +this.description +"</td></tr><tr> <td>开始日期：</td><td>"
	  +this.startdate +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr><tr> <td> 结束日期：</td><td>"
	  +this.enddate+"</td></tr><tr> <td> 编辑时间：</td><td>"
	  +this.launchdate+"</td></tr><tr> <td> 最高状态:</td><td>"
	  +this.isalive+"</td></tr><tr> <td> 发布人：</td><td>"
	  +"<a href ='UserInformation.jsp?action=show&id="+this.UserID+"' >"+ this.UsersName+"</a></td></tr></table>";
	 
	  ;
	  

	return aa;
		
	}
	 
	public String Tostring ()
	{
		  String a="";
		  a+= idQuestionare ;
		  a+= State ;
		  a+= title ;
		  a+=  startdate;
		  a+= UserID ;
		
		  for(int i=0;i<QuestionsItems.size();i++)
			{
				
				a+="</br>"+((QuestionItem)QuestionsItems.get(i)).Tostring();
			}
		  return a;
	}
	public void disablequestionnaire()
	{   String userid=this.idQuestionare;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "UPDATE `webdb`.`questionaire` SET `isalive`='0' WHERE `idQuestionare`='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
			
		}
	}
	public void enablequestionnaire()
	{
		String userid =this.idQuestionare;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "UPDATE `webdb`.`questionaire` SET `isalive`='1' WHERE `idQuestionare`='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
	}
	}



	public void Insert(String questionID, String type, String question, String answers, String questionnaireID ){
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root",password);
		    Statement stmt= (Statement) conn.createStatement();
		    String st = "INSERT "+questionID+", "+type+", "+question+", "+answers+", "+null+", "
		    			+questionID+", "+questionnaireID+" into questions";
		    stmt.executeUpdate("");
		    
		  }catch(Exception e){}
		    
	}
	public void deleteQuestionnaire()
	{
		
		String userid =this.idQuestionare;
		deleteQuestions(userid );
		deleteAnswer(userid);
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql ="DELETE FROM questionaire WHERE questionaire.idQuestionare='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
	}
	public void deleteQuestions(String id )
	{
		String userid =id;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "DELETE FROM questions WHERE questions.Questionare_idQuestionare='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
	}
	public void deleteAnswer( String id)
	{
		String userid =id;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "DELETE FROM answers WHERE answers.Questionare_idQuestionare='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
	}
	

	
}
	

	