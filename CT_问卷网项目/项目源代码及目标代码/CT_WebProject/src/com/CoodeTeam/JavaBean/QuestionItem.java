package com.CoodeTeam.JavaBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class QuestionItem {
	public  String idQuestion="";
	public String type="";
	public String question="";
	public String analysise;
	public String AnswerString ="";
	public String order;
	public ArrayList<String> answerItems=new ArrayList<String >();
	public QuestionItem(String idQuestion) {
		super();
		this.idQuestion = idQuestion;
		String userid =idQuestion;
		DBAccess db = new DBAccess();
		ResultSet rs=null;
		
		try{
		if(db.createConn()){
			String sql = "select * FROM questions WHERE questions.idQuestion='"+userid+"';";
			db.query(sql);
			rs=db.getRs();
			if(rs.next())
			{
				type=rs.getString("type");
				question=rs.getString("question");
				order=rs.getString("order");
				AnswerString=rs.getString("answers");
				
				String as[] = AnswerString.split(";");
				for(int i = 0; i < as.length; i++) {
				   answerItems.add(as[i]);
				}
				
				//System.out.println(this.Tostring());
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		}catch (Exception e)
		{
			
		}
		
	}
	public String Tostring()
	{     String a="";
		a+=idQuestion;
	    a+=type ;
	    a+=question ;
	    a+=AnswerString ;
	    a+= order+"µÛ";
	    
	
		for(int i=0;i<answerItems.size();i++)
		{
			
			a+=(String)answerItems.get(i).toString()+"µÚ"+i;
		}
		a+="";
		return a;
	}
	public String getIdQuestion() {
		return idQuestion;
	}
	public void setIdQuestion(String idQuestion) {
		this.idQuestion = idQuestion;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnalysise() {
		return analysise;
	}
	public void setAnalysise(String analysise) {
		this.analysise = analysise;
	}
	public String getAnswerString() {
		return AnswerString;
	}
	public void setAnswerString(String answerString) {
		AnswerString = answerString;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	 

}
