<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %> 
    <jsp:directive.page import="com.CoodeTeam.JavaBean.DBAccess"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!

//获取当前在线用户人数
int getUserCount(){
	int  temp=0 ;
	DBAccess db = new DBAccess();
	ResultSet rs=null;
	
	try{
	if(db.createConn()){
		String sql = "SELECT count(*) as onlineCount FROM users where users.isonline=1";
		db. query(sql);
		rs=db.getRs();
		if(rs.next())
		{
			temp=rs.getInt("onlineCount");
			}	
			
		}
		db.closeRs();	
		db.closeStm();
		db.closeConn();
	}
	catch (Exception e)
	{
		
	}
	return temp;
	}

//获取问卷数量
int getQuestionCount(){
	int  temp=0 ;
	DBAccess db = new DBAccess();
	ResultSet rs=null;
	
	try{
	if(db.createConn()){
		String sql = "SELECT count(*) as QuestionCount FROM questionaire";
		db.query(sql);
		rs=db.getRs();
		if(rs.next())
		{
			temp=rs.getInt("QuestionCount");
			}	
			
		}
		db.closeRs();	
		db.closeStm();
		db.closeConn();
	}
	catch (Exception e)
	{
		
	}
	return temp;
	}
//获取答卷的数量
int getAnswerCount(){
	int  temp=0 ;
	DBAccess db = new DBAccess();
	ResultSet rs=null;
	
	try{
	if(db.createConn()){
		String sql = "SELECT count(*) as AnswerCount FROM answers;";
		db. query(sql);
		rs=db.getRs();
		if(rs.next())
		{
			temp=rs.getInt("AnswerCount");
			}	
			
		}
		db.closeRs();
		db.closeStm();
		db.closeConn();
	}
	catch (Exception e)
	{
		
	}
	return temp;
	}

%>
<head> <jsp:include page="head.jsp"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<script src="js/bootstrap.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>运行状况</title>
   <style type="text/css">
   .list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
z-index: 2;
color: #fff;
background-color: rgb(173, 216, 230);
border-color: rgb(173, 216, 230);
}
   
   </style>


</head>

<body> 
  <% 
    	String username =(String) session.getAttribute("username");
 		if (username==null)
 		{
 			response.sendRedirect("admin.jsp");
 		}
%>
   <!-- Fixed navbar --> 
    <div class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#7979E6">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp"><big><font color="white" size="5">CT<b>问卷网</b></font></big></a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li ><a href="tse.jsp"><font color="white"><b>管理用户</b></font></a></li>
            
            <li ><a  href ="questionnaire.jsp"    ><font color="white"><b>管理问卷</b></font></a></li>
            <li class="active" ><a href="RunningState.jsp"><font color="white"><b>运行状态</b></font></a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
           <li><a href="TobeDone.jsp"><font color="white"><b><em><%=username  %></em></b></font></a></li>
  
          </ul>
         
        </div><!--/.nav-collapse -->
      </div>
    </div>
<br></br><br>
<center><h2 style="font-family:黑体">运行状态</h2></center>

<div class="container">
<div class="list-group">
   <a href="#" class="list-group-item active">
      <h4 class="list-group-item-heading">
        用户
      </h4>
   </a>
   <a href="#" class="list-group-item">
      <h4 class="list-group-item-heading">
        当前登陆人数
      </h4>
      <p class="list-group-item-text">
         <%=getUserCount() %>
      </p>
   </a>
   <a href="#" class="list-group-item">
      <h4 class="list-group-item-heading">
        更多信息
      </h4>
      <p class="list-group-item-text">
         更多信息
      </p>
   </a>
</div>
<div class="list-group">
   <a href="#" class="list-group-item active">
      <h4 class="list-group-item-heading">
      问卷
      </h4>
   </a>
   <a href="#" class="list-group-item">
      <h4 class="list-group-item-heading">
         当前问卷数
      </h4>
      <p class="list-group-item-text">
         <%=getQuestionCount()%>
     
      </p>
   </a>
   <a href="#" class="list-group-item">
      <h4 class="list-group-item-heading">等待添加更多信息</h4>
      <p class="list-group-item-text">等待添加更多信息</p>
   </a>
</div>
<div class="list-group">
   <a href="#" class="list-group-item active">
      <h4 class="list-group-item-heading">
      答卷
      </h4>
   </a>
   <a href="#" class="list-group-item">
      <h4 class="list-group-item-heading">
         当前答卷数
      </h4>
      <p class="list-group-item-text">
            <%=getAnswerCount()%>
      </p>
   </a>
   
</div>

</div>


<jsp:include page="footer.jsp"/>
</body>
</html>