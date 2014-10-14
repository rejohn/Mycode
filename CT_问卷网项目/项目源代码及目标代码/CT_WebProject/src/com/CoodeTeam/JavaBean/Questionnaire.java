package com.CoodeTeam.JavaBean;
import com.CoodeTeam.JavaBean.DBAccess;
public class Questionnaire {
	public void CreateQtn(String title,String subject,String description,int idusers){
		DBAccess db = new DBAccess();	
		if(db.createConn()){
			String sql = "insert into questionaire(idQuestionare,state,title,subject,description,startdate,enddate,launchdate,isalive,Users_idUsers)" +
					"  values(null,'creating','"+title+"','"+subject+"','"+description+"',null,null,null,'"+idusers+"')";
			
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}	
	}
	
}
