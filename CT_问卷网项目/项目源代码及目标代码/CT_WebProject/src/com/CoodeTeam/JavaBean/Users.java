package com.CoodeTeam.JavaBean;
import  java.sql.Connection ;
import java.sql.DriverManager;
import  java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.CoodeTeam.JavaBean.questionnaireCreate;
import com.CoodeTeam.JavaBean.DBAccess;

import com.mysql.jdbc.Statement;
public class Users {
	public String password ="";
    public String idUser="0";
    public String usersname="";
    public String useruserAuthority;
   public String sex="";
   public String address="";
   public String isonline="";
   public int age=0;
   public boolean isOnline=false;
   public String  IsAlive="";
   public boolean Alive;
   public ArrayList<String[]> myanswerTemp;
   public int getMyAnswerNu()
   {
	   String sql = null;
		
		Connection conn = null;
		
		ResultSet ra = null;
		int recordCount=0;
		
		try{
			sql = "SELECT count(*) FROM answers where answers.UserID='"+this.idUser+"'";
			
			recordCount = DbManager.getCount(sql);
		}catch (Exception e)
		{
			
		}
		return recordCount;
			
   }
   public int getMyQNu()
   {
	   String sql = null;
		
		Connection conn = null;
		
		ResultSet ra = null;
		int recordCount=0;
		
		try{
			sql = "SELECT count(*) FROM questionaire where questionaire.Users_idUsers='"+this.idUser+"'";
			
			recordCount = DbManager.getCount(sql);
		}catch (Exception e)
		{
			
		}
		return recordCount;
			
   }
   public void SetMyAnswerArray( Answers a,String QuestionID)//得到我的答案表   first
   {    
	   a.ReadAnswerData(this.idUser, QuestionID);
	   this.myanswerTemp=a.AnswersSArray;
	   
	   
   }
   public ArrayList<String> getAnswer(String QuestionID,int order)   //得到我的答案表   second
   {     ArrayList<String> myAnswers =new <String>ArrayList()  ;
          myAnswers.clear();
	   
	   questionnaireCreate tempCreate=new questionnaireCreate(QuestionID);
	   QuestionItem tempItem=tempCreate.QuestionsItems.get(order-1);
	   String s[]={"",""};
	    if(tempItem.type.equals("single"))
	   {
	    	 for (int i=0;i<this.myanswerTemp.size();i++)
	  	   {    
	    		String ss[]= this.myanswerTemp.get(i);
	  		   if(tempItem.order.equals(ss[0]))
	  		   {
	  			   int un=Integer.parseInt(ss[1]);
	  			   String ty=tempItem.answerItems.get(un);
	  			   myAnswers.add(ty);
	  		   }
	  	   }

	   }
	   else if(tempItem.type.equals("mutiple"))
	   {
		   for (int i=0;i<this.myanswerTemp.size();i++)
		   {    String ss[]= this.myanswerTemp.get(i);
		       
			   if(tempItem.order.equals(ss[0]))
			   {
				   int un=Integer.parseInt(ss[1]);
	  			   String ty=tempItem.answerItems.get(un);
	  			   myAnswers.add(ty);
			   }
		   }

	   }
	   else if(tempItem.type.equals("blank"))
	   {
		   for (int i=0;i<this.myanswerTemp.size();i++)
		   {    String ss[]= this.myanswerTemp.get(i);
		       
			   if(tempItem.order.equals(ss[0]))
			   {
				  String ansa=ss[1];
	  			   //String ty=tempItem.answerItems.get(ansa);
	  			   myAnswers.add(ansa);
			   }
		   }
	   }
	   else if(tempItem.type.equals("judge"))
	   {
		   for (int i=0;i<this.myanswerTemp.size();i++)
		   {    String ss[]= this.myanswerTemp.get(i);
		       
			   if(tempItem.order.equals(ss[0]))
			   {
				   int un=Integer.parseInt(ss[1]);
				   if(un==0)
				   {
					   String ty="正确";
		  			   myAnswers.add(ty);
				   }
				   else {
					   String ty="错误";
		  			   myAnswers.add(ty);
				   }
	  			  
			   }
		   }
	   }
	 
	   return  myAnswers;
	   
   }
 public  String transfer(String a)
   {
  	 
  	//int k = a.
  	 if (a.equals("2"))
  	 {return "管理员";
  		 }
  	 else
  	 {
  		 return "用户";
  	 }
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
  public  String IsOnline(String a)
   {
  	 
  	//int k = a.
  	 if (a.equals("1"))
  	 {return "在线";
  		 }
  	 else
  	 {
  		 return "离线";
  	 }
   }
  public void  deleteUsers()
  {
	  
	  deleteAnswers(this.idUser);
	  deleteQuestionnaire(this.idUser );
	  String userid =this.idUser;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "DELETE FROM users WHERE users.idUsers='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
  }
  public void deleteAnswers(String id)
  {
	 
			String userid =id;
			DBAccess db = new DBAccess();
			if(db.createConn()){
				String sql = "DELETE FROM answers WHERE answers.UserID='"+userid+"';";
				db.update(sql);
				db.closeStm();
				db.closeConn();
			}
		
  }
  public void deleteQuestionnaire(String id )
  {   String userID =id ;
    DBAccess db1 = new DBAccess();
	   ResultSet ra=null;
	
	try{
	if(db1.createConn()){
		String sql1 = "SELECT * FROM Questionaire where Questionaire.Users_idUsers = '" +userID+"';";
		db1. query(sql1);
		ra=db1.getRs();
		while(ra.next())
		{
			 questionnaireCreate temp =new questionnaireCreate(ra.getString("idQuestionare"));
			  temp.deleteQuestionnaire();
			}
			
			
		}
		db1.closeStm();
		db1.closeRs();
		db1.closeConn();
	}
	catch (Exception e)
	{
		
	}
	 
  }
  public String getSex(String a)
  {
	  if (a.equals("1"))
	  {
		  return "男";
	  }
	  else
	  {
		  
		  return "女"; 
	  }
  }
  
public Users()
{ super();
	 usersname="a";
     useruserAuthority="用户";
     sex="男";
    address="234";
     isonline="在线";
     IsAlive="正常";
	
	}
public void SetAsAdmin()
{
	 String userid=this.idUser;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			
			String sql = "UPDATE  `webdb`.`users` SET `users`.`userAuthority`=2 WHERE `users`.`idUsers`='"+userid+"';";
			db.update(sql);
			db.closeStm();
			db.closeConn();
			
		}
	}
public Users ChangeState()
{
	if(this.Alive)
	{
		this.disableUser();
	}
	else {
		this.enableUser();
	}

	return   this;
	}
public void UserRefresh()
{
	String idUser1 =this.idUser ;

       DBAccess db1 = new DBAccess();
	   ResultSet ra=null;
	
	try{
	if(db1.createConn()){
		String sql1 = "select * from users WHERE users.idUsers='"+idUser1+"';";
		db1. query(sql1);
		ra=db1.getRs();
		while(ra.next())
		{
			 usersname=ra.getString("usersname");
	    	  useruserAuthority=transfer(ra.getString("userAuthority"));
	    	  sex=getSex(ra.getString("sex"));
	    	  address=ra.getString("address");
	    	  isonline=IsOnline(ra.getString("isonline"));
	    	  if(ra.getString("isonline").equals("1"))
	    	  {
	    		  isOnline=true;
	    	  }
	    	  age=ra.getInt("age");
	    	  this.IsAlive=IsAlive(ra.getString("isalive"));
	    	  if(ra.getString("isalive").equals("1"))
	    	  {
	    		  Alive=true;
	    	  }
			}
			
			
		}
		db1.closeStm();
		db1.closeRs();
		db1.closeConn();
	}
	catch (Exception e)
	{
		
	}
	
	}

public Users(String idUser)  {
	super();
	this.idUser = idUser;
  
       DBAccess db1 = new DBAccess();
		   ResultSet ra=null;
		
		try{
		if(db1.createConn()){
			String sql1 = "select * from users WHERE users.idUsers='"+idUser+"';";
			db1. query(sql1);
			ra=db1.getRs();
			while(ra.next())
			{
				  usersname=ra.getString("usersname");
		    	  useruserAuthority=transfer(ra.getString("userAuthority"));
		    	  sex=getSex(ra.getString("sex"));
		    	  address=ra.getString("address");
		    	  isonline=IsOnline(ra.getString("isonline"));
		    	  if(ra.getString("isonline").equals("1"))
		    	  {
		    		  isOnline=true;
		    	  }
		    	  age=ra.getInt("age");
		    	  this.IsAlive=IsAlive(ra.getString("isalive"));
		    	  if(ra.getString("isalive").equals("1"))
		    	  {
		    		  Alive=true;
		    	  }
			       
				}
				
				
			}
			db1.closeStm();
			db1.closeRs();
			db1.closeConn();
		}
		catch (Exception e)
		{
			
		}
     
	}
/*@made by hhl  
 * 
 */
//禁用用户
public void disableUser()
{   String userid=this.idUser;
	DBAccess db = new DBAccess();
	if(db.createConn()){
		String sql = "UPDATE `webdb`.`users` SET `isalive`='0' WHERE `idUsers`='"+userid+"';";
		db.update(sql);
		db.closeStm();
		db.closeConn();
		
	}
}
//启用用户
public void enableUser()
{
	String userid =this.idUser;
	DBAccess db = new DBAccess();
	if(db.createConn()){
		String sql = "UPDATE `webdb`.`users` SET `isalive`='1' WHERE `idUsers`='"+userid+"';";
		db.update(sql);
		db.closeStm();
		db.closeConn();
}
}
boolean IsOnline()
{
	return this.isOnline;

	}

public String showUser()
{String aa="";
aa+="<table class ='table' ><tr> <td>姓名：</td><td>"
  +this.usersname+"</td></tr><tr> <td>"+"用户组：</td><td> "
  +this.useruserAuthority+"</td></tr><tr> <td>性别：</td><td>"
  +this.sex+"</td></tr><tr> <td>年龄：</td><td>"
  +this.age+"岁</td></tr><tr> <td>地址：</td><td>"
  +this.address+"</td></tr><tr> <td>是否在线：</td><td>"
  +this.isonline+"</td></tr><tr> <td> 状态：</td><td>"
  +this.IsAlive+"</td></tr><tr><td> </td><td></tr></table>";

return aa;
	
}


	
//////////////////
public String getIdUser() {
	return idUser;
}
public void setIdUser(String idUser) {
	this.idUser = idUser;
}
public String getUsersname() {
	return usersname;
}
public void setUsersname(String usersname) {
	this.usersname = usersname;
}
public String getUseruserAuthority() {
	return useruserAuthority;
}
public void setUseruserAuthority(String useruserAuthority) {
	this.useruserAuthority = useruserAuthority;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getIsonline() {
	return isonline;
}
public void setIsonline(String isonline) {
	this.isonline = isonline;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
   
   
}
