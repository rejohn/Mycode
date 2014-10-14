package com.CoodeTeam.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import com.CoodeTeam.JavaBean.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.CoodeTeam.JavaBean.UserBean;;
public class UserServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
					HttpServletResponse response) throws ServletException,IOException{
		doGet(request,response);
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String method = (String)request.getParameter("method");
		
		if(method == null){
			PrintWriter out=response.getWriter();
			out.println("invalid request");
		}else if(method.equals("login")){
			Login(request,response);
		}else if(method.equals("logout")){
			Logout(request,response);
		}else if(method.equals("register")){
			Register(request,response);
		}else if(method.equals("checkuser")){
			CheckUser(request,response);
		}else if(method.equals("adminlogin")){
			AdminLogin(request,response);
		}else if(method.equals("creatQuestionaire")){
			creatQuestionaire(request,response);
		}else if(method.equals("insertData")){
			insertData(request,response);
		}else if(method.equals("closeQuestionaire")){
			closeQuestionaire(request,response);
		}else if(method.equals("deleteQuestionaire")){
			deleteQuestionaire(request,response);
		}else if(method.equals("analyse")){
			analyse(request,response);
		}else if(method.equals("updateData")){
			updateData(request,response);
		}else if(method.equals("publishData")){
			publishData(request,response);
		}else if(method.equals("publishAna")){
			publishAna(request,response);
		}else if(method.equals("joinQ")){
			joinQ(request,response);
		}
	}
	private void joinQ(HttpServletRequest request, HttpServletResponse response) {
		int qid = Integer.parseInt(request.getParameter("qid"));
		try {
			response.sendRedirect(qid+".html");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void publishAna(HttpServletRequest request,
			HttpServletResponse response) {
		String qid = request.getParameter("qid");
		// TODO Auto-generated method stub
		DBAccess db = new DBAccess();
		try {
			if(db.createConn()){
				String sql = "update questionaire set analysis = '1' WHERE idQuestionare = "+qid;
				//System.out.println(sql);
				db.update(sql);
				db.closeStm();
				db.closeConn();
				
				response.sendRedirect("JoinQ.jsp");
			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	protected void analyse(HttpServletRequest request,
			HttpServletResponse response) {
		String qnid = request.getParameter("qnid");
		
		
	}
	protected void AdminLogin(HttpServletRequest request,
			HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username == null||password == null){
			try {
				response.sendRedirect("admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		UserBean userBeann= new UserBean();
		
		boolean isAdmin = userBeann.admin(username, password);
		
		HttpSession session = request.getSession();
		if(isAdmin){
			
			session.setAttribute("username", username);
			session.setAttribute("userAuthority", 2);
			session.removeAttribute("loginfailed");
			
			try {
				response.sendRedirect("tse.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			try {
				
			    session.setAttribute("loginfailed", "loginfailed");
			    
				response.sendRedirect("admin.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
	}
	protected void Login(HttpServletRequest request,
			HttpServletResponse response){
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username == null||password == null){
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		UserBean userBeann= new UserBean();
		int isValid = userBeann.valid(username, password);
		
		HttpSession session = request.getSession();
		if(isValid!=0){
			
			session.setAttribute("username", username);
			session.setAttribute("UserID", isValid);
			session.removeAttribute("loginfailed");
			session.setAttribute("userAuthority", 1);
			String ip = request.getRemoteAddr();
			session.setAttribute("ip", ip);
			try {
				response.sendRedirect("index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			try {
				
			    session.setAttribute("loginfailed", "loginfailed");
			    
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
	}
	protected void Logout(HttpServletRequest request,
			HttpServletResponse response){
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void Register(HttpServletRequest request,
			HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String sex =request.getParameter("sex");
		String age =request.getParameter("age");
		String address = request.getParameter("address");
		if(username == null||password==null||password2==null||!password.equals(password2)){
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		UserBean userBean = new UserBean();
		boolean isExist = userBean.isExist(username);
		if(!isExist){
			userBean.add(username, password2, sex, age, address);
			try {
				response.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			try {
				response.sendRedirect("register.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
	}
	protected  void CheckUser(HttpServletRequest request,
			HttpServletResponse response){
		String user = request.getParameter("user"); 
		UserBean userBean = new UserBean();
		boolean isExist = userBean.isExist(user);
		if(isExist){
		//	System.out.print("true");
		}
		else{
		//	System.out.print("false");
		}
	}
	protected void creatQuestionaire(HttpServletRequest request,HttpServletResponse response){
		String title = request.getParameter("title");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");
		HttpSession session = request.getSession();
		int userid=(Integer) session.getAttribute("UserID");
		//String username;
		//System.out.println(title);
		if(title == ""){
			try {
				response.sendRedirect("CreatQuestionaire.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }else{
	    	UserBean userbean = new UserBean();
		    try {
		    //	HttpSession session = request.getSession();
		    	//username = (String)session.getAttribute("");
		    	//System.out.println(userid);
		    	userbean.addQuestionaire(title,subject,description,userid);
			    response.sendRedirect("que.jsp");
		    } catch (IOException e) {
			   // TODO Auto-generated catch block
		    	e.printStackTrace();
		      }
	    }
	}protected void insertData(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{

		String [] strArray = new String [100];
		String [] ans = new String [100];
		String [] type = new String [100];
		
		for ( int kk = 0;kk<100 ;kk++)
			ans[kk] = "";
					
		int i = 1;
		for(int t = 1;t<=100;t++){
			if(request.getParameter("A"+t) != null){
				strArray[i] =new String( request.getParameter("A"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "single";
				int option = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i]+new String(request.getParameter(t+"-"+m).getBytes("UTF-8"),"UTF-8")+";";
						option++;
					}
				}
				i++;
			}
			else if(request.getParameter("B"+t) != null){
				strArray[i] = new String(request.getParameter("B"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "mutiple";
				int op = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i]+new String(request.getParameter(t+"-"+m).getBytes("UTF-8"),"UTF-8")+";";
						op++;
					}
				}
				i++;
			}
			else if(request.getParameter("C"+t) != null){
				strArray[i] = new String(request.getParameter("C"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "judge";
				i++;
			}
			else if(request.getParameter("D"+t) != null){
				strArray[i] = new String(request.getParameter("D"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "blank";
				i++;
			}
		}		
		
	    HttpSession session = request.getSession();
	   int userid=(Integer) session.getAttribute("UserID");

		try {
			
			UserBean userbean = new UserBean();
			int queid  = userbean.getid(userid);
			//System.out.println(queid);
	    	userbean.additem(i-1,strArray,ans,type,queid);
	    	//response.sendRedirect("AnswerQuestionnaire.jsp?qid="+queid);
	    	response.sendRedirect("MyQC.jsp");
	    	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void closeQuestionaire(HttpServletRequest request,HttpServletResponse response){
		int qid = Integer.parseInt(request.getParameter("qid"));
		DBAccess db = new DBAccess();
		try {
		if(db.createConn()){
			String sql = "update questionaire set state = 'closed' WHERE idQuestionare = "+qid;
			db.update(sql);
			db.closeStm();
			db.closeConn();
			String page = request.getParameter("Qpage");
				response.sendRedirect(page);
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	protected void deleteQuestionaire(HttpServletRequest request,HttpServletResponse response){
		int qid = Integer.parseInt(request.getParameter("qid"));
		//System.out.print(qid);
		DBAccess db =new DBAccess();
		try{
		if(db.createConn()){
			String Dsql1 = "delete from answers where Questionare_idQuestionare = "+qid;
			String Dsql2 = "delete from questions where Questionare_idQuestionare = "+qid;
			String Dsql3 = "delete from questionaire where idQuestionare = "+qid;
			db.update(Dsql1);
			db.update(Dsql2);
			db.update(Dsql3);
			db.closeStm();
			db.closeConn();
			String page = request.getParameter("Qpage");
			response.sendRedirect(page);
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void updateData(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		
		int qid = Integer.parseInt(request.getParameter("qid")); 
		//qid = 24;
		String [] strArray = new String [100];
		String [] ans = new String [100];
		String [] type = new String [100];
		
		DBAccess db = new DBAccess();
		String sql = "delete from  questions where Questionare_idQuestionare = "+qid;
		if(db.createConn()){			
			db.update(sql);
			db.closeStm();
			db.closeConn();
		}
		
		
		
		for ( int kk = 0;kk<100 ;kk++)
			ans[kk] = "";
					
		int i = 1;
		for(int t = 1;t<=100;t++){
			if(request.getParameter("A"+t) != null){
				strArray[i] =request.getParameter("A"+t);
				type[i] = "single";
				int option = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i]+ new String(request.getParameter(t+"-"+m).getBytes("UTF-8"),"UTF-8")+";";
						option++;
					}
				}
				i++;
			}
			else if(request.getParameter("B"+t) != null){
				strArray[i] = new String(request.getParameter("B"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "mutiple";
				int op = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i] +new String(request.getParameter(t+"-"+m).getBytes("UTF-8"),"UTF-8")+";";
						op++;
					}
				}
				i++;
			}
			else if(request.getParameter("C"+t) != null){
				strArray[i] = new String(request.getParameter("C"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "judge";
				i++;
			}
			else if(request.getParameter("D"+t) != null){
				strArray[i] = new String(request.getParameter("D"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "blank";
				i++;
			}
		}

		try {
			
			UserBean userbean = new UserBean();
	    	userbean.additem(i-1,strArray,ans,type,qid);
	    	response.sendRedirect("MyQC.jsp");
	    	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	protected void publishData(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{

		String [] strArray = new String [100];
		String [] ans = new String [100];
		String [] type = new String [100];
		
		for ( int kk = 0;kk<100 ;kk++)
			ans[kk] = "";
					
		int i = 1;
		for(int t = 1;t<=100;t++){
			if(request.getParameter("A"+t) != null){
				strArray[i] =new String( request.getParameter("A"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "single";
				int option = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i]+new String(request.getParameter(t+"-"+m).getBytes("UTF-8"),"UTF-8")+";";
						option++;
					}
				}
				i++;
			}
			else if(request.getParameter("B"+t) != null){
				strArray[i] = new String(request.getParameter("B"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "mutiple";
				int op = 1;
				for(int m =1;m<=100;m++){
					if(request.getParameter(t+"-"+m)!=null){
						ans[i] = ans[i]+new String(request.getParameter(t+"-"+m).getBytes("UTF-8"),"UTF-8")+";";
						op++;
					}
				}
				i++;
			}
			else if(request.getParameter("C"+t) != null){
				strArray[i] = new String(request.getParameter("C"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "judge";
				i++;
			}
			else if(request.getParameter("D"+t) != null){
				strArray[i] = new String(request.getParameter("D"+t).getBytes("UTF-8"),"UTF-8");
				type[i] = "blank";
				i++;
			}
		}		
		
	    HttpSession session = request.getSession();
	   int userid=(Integer) session.getAttribute("UserID");

		UserBean userbean = new UserBean();
		int queid  = userbean.getid(userid);
		//System.out.println(queid);
		userbean.additem(i-1,strArray,ans,type,queid);
		//response.sendRedirect("index.jsp?qid="+queid);
		//response.sendRedirect("index.jsp");
		//session.setAttribute("qid", queid);
		
	}

}
