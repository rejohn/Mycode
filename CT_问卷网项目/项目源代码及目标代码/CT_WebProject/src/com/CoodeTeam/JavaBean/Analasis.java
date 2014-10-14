package com.CoodeTeam.JavaBean;

import java.sql.SQLException;

import com.CoodeTeam.JavaBean.*;

public class Analasis {
		DBAccess db;
		int choNumber= 0;
		int ansnum = 0;
	public Analasis() {
		
	    db = new DBAccess();
		db.createConn();
		// TODO Auto-generated constructor stub
	}


	public int getQueNumber(int qid){
		String sql = "select count(*) from questions where Questionare_idQuestionare = "+qid;
		db.query(sql);
		int number=0;
		try {
			if(db.getRs().next()){
				number = db.getRs().getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return number;
	}
	public String getType(int qid,int order){
		
		String sql = "select * from questions where `order` = " + order +" and Questionare_idQuestionare = " +qid ; 
	
		db.query(sql);
		String type="";
	    //System.out.println(sql);
		choNumber= 0;
		try {
			if(db.getRs().next()){
				type = db.getRs().getString("type");
				choNumber = db.getRs().getString("answers").split(";").length;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return type;
	}
	public int getchoNumber(){
		return choNumber;
	}
	
	public int[] getOneResult(int qid,int order,int choNumber){
		String sql = "select * from answers where Questionare_idQuestionare = "+ qid;
		db.query(sql);
		String answer = "";
		int[] result = new int[choNumber+1];
		result[0] = 0;
		for(int i=1;i<=choNumber;i++){
			result[i]=0;
		}
		try {
			while(db.getRs().next()){
				ansnum++;
				answer = db.getRs().getString("answer");
				//System.out.println(answer);
				String[] s = answer.split(";HhL");
				for (int i=0;i<s.length;i++){
					String[] t = s[i].split("Zf");
					//System.out.println(s[i]);
					if(t[0].substring(0,t[0].length()-1).equals(order+"") ){
						result[Integer.parseInt(t[1])]++;
						
					}
				
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int getansnum(int qid){
		String sql = "select * from answers where Questionare_idQuestionare = "+ qid;
		db.query(sql);
		
		
	
		try {
			while(db.getRs().next()){
				ansnum++;
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return ansnum;
	}
	
}
