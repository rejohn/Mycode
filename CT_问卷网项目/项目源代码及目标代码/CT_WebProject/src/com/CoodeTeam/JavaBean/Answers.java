package com.CoodeTeam.JavaBean;
import com.CoodeTeam.JavaBean.DBAccess;

import java.sql.ResultSet;
import java.util.ArrayList;
public class Answers {
	String QuestionID="";
	ArrayList<String > AnswersItems=new ArrayList<String >();
	public  String Answers="";
     ArrayList<String []> AnswersSArray =new ArrayList<String []>();
    //single value
     String test="";
	public Answers(ArrayList<String> answersItems,String id) 
	{
		super();
		AnswersItems = answersItems;
		this.QuestionID =id;
		
	}
	public Answers(String Questionnaireid) 
	{
		super();
		
		this.QuestionID =Questionnaireid;
		
	}
	public void SaveAnswer(String Ip,String Uid)//保存到数据库
	{    SortTheAnswers();
		//String userid =this.QuestionID;
		if(Uid.equals(""))
		{DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "INSERT INTO `webdb`.`answers`(`answer`,`Questionare_idQuestionare`,`IPaddress`)VALUES('"+this.Answers+"','"+this.QuestionID+"','"+Ip+"');";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}}
		else{
			DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "INSERT INTO `webdb`.`answers`(`UserID`,`answer`,`Questionare_idQuestionare`,`IPaddress`)VALUES('"+Uid+"','"+this.Answers+"','"+this.QuestionID+"','"+Ip+"');";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}}
		
	}
	
	
	public void SortTheAnswers()
	{
		
		for(int i=0; i<this.AnswersItems.size();i++)
		{
			
			
			
			Answers +=this.AnswersItems.get(i)+";HhL";
		
			
		}
		
		
		//this.Answers+="test"+test;
	}
	
	public void   ReadAnswerData(String UserId, String Questionaireid)
	{    String Answer="";
	    AnswersSArray.clear();
		 DBAccess db1 = new DBAccess();
		   ResultSet ra=null;
		
		try{
		if(db1.createConn()){
			String sql1 = "SELECT answers.answer  FROM webdb.answers where answers.UserID='"+UserId+"' and answers.Questionare_idQuestionare ='"+Questionaireid+"';";
			db1. query(sql1);
			ra=db1.getRs();
			while(ra.next())
			{
				Answer =ra.getString("answer");
				  
				}
				
				
			}
			db1.closeStm();
			db1.closeRs();
			db1.closeConn();
		}
		catch (Exception e)
		{
			
		}
		String test="";
		String a[]=Answer.split(";HhL");
		for(int i=0;i<a.length;i++)
		{
			if (a[i].indexOf("sZf")!=-1)
			{ 
				String b[]=a[i].split("sZf");
				test+=b[0]+"TEST"+b[1];
				AnswersSArray.add(b);
			}else
			if (a[i].indexOf("mZf")!=-1)
			{   
				String b[]=a[i].split("mZf");
				test+=b[0]+"TEST"+b[1];
				AnswersSArray.add(b);
			}else
			if (a[i].indexOf("bZf")!=-1)
			{
				String b[]=a[i].split("bZf");
				test+=b[0]+"TEST"+b[1];
				AnswersSArray.add(b);
			}
			else 
			if (a[i].indexOf("jZf")!=-1)
			{
				String b[]=a[i].split("jZf");
				test+=b[0]+"TEST"+b[1];
				AnswersSArray.add(b);
			}
			//System.out.println(test);
		}
		
		
		
	}
	
	
	
	
}
