<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.ResultSet" %>
<jsp:directive.page import="java.sql.Date"/>
<jsp:directive.page import="java.sql.Timestamp"/>
<jsp:directive.page import="java.sql.SQLException"/>
<jsp:directive.page import="com.CoodeTeam.JavaBean.DbManager"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>

<head>    <jsp:include page="head.jsp"/>
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 
<%!

 String transfer(String a)
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
 String IsOnline(String a)
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
 String Isalive(String a)
 {
	 
	//int k = a.
	 if (a.equals("1"))
	 {return "正常";
		 }
	 else
	 {
		 return "封禁";
	 }
 }
%> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理用户</title>

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
            <li class="active" ><a href="tse.jsp"><font color="white"><b>管理用户</b></font></a></li>
            
            <li><a  href ="questionnaire.jsp"    ><font color="white"><b>管理问卷</b></font></a></li>
            <li><a href="RunningState.jsp"><font color="white"><b>运行状态</b></font></a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
           <li><a href="TobeDone.jsp"><font color="white"><b><em><%=username  %></em></b></font></a></li>
  
          </ul>
         
        </div><!--/.nav-collapse -->
      </div>
    </div>


<br></br><br>


<center><h2 style="font-family:黑体">用户表</h2></center>
<div class="container">
<!-- 
   <div class="row">
       <div class="col-md-5"> 
        <div class="btn-group">
          <a class="btn" href="#"><i class="icon-align-left"></i></a>
          <a class="btn" href="#"><i class="icon-align-right"></i></a>
        </div> 
        </div>
       
          <div class="col-md-1">
       <ul class="nav nav-pills">
     <li class="dropdown all-camera-dropdown">
           <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            类型
               <b class="caret"></b>
           </a>
     <ul class="dropdown-menu">
            <li data-filter-camera-type="all"><a data-toggle="tab" href="#">名称</a></li>
            <li data-filter-camera-type="Alpha"><a data-toggle="tab" href="#">序号</a></li>
            <li data-filter-camera-type="Zed"><a data-toggle="tab" href="#">用户组</a></li>
            

     </ul>
</li></ul>
      </div>
       <div class="col-md-4">
       <form class="form-inline" role="form">
      
        
  			<input type="text" class="input-medium search-query">
  			<button type="submit" class="btn"><i class="icon-search"></i> Search</button>
  		
		</form></div>
		 <div class="col-md-2"></div>
		</div>
		
		
		-->
         <div class="row">
         	<%
 	final int pageSize =5;	// 一页显示 10 条记录

	int pageNum = 1;// 当前页数
	int pageCount = 1;			// 总页数

	int recordCount = 0;		// 总记录数
	
	try{
		// 从地址栏参数取当前页数
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}catch(Exception e){}
	
	String sql = null;
	
	Connection conn = null;
	PreparedStatement preStmt = null;
	ResultSet ra = null;
	
	try{
		sql = "SELECT count(*) FROM users ";
		
		recordCount = DbManager.getCount(sql);
		
		// 计算总页数
		pageCount = ( recordCount + pageSize - 1 ) / pageSize;
		// 本页从 startRecord 行开始
		int startRecord = ( pageNum - 1) * pageSize;
		
		// MySQL 使用limit实现分页
		sql = "SELECT * FROM users LIMIT ?, ? ";
		
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		DbManager.setParams(preStmt, startRecord, pageSize);
		ra = preStmt.executeQuery();
   
    
    
    %>
         <table border="1" align="center" id=one class="table table-bordered table-striped">
   <tr>
      <th>用户号</th>
      <th>用户名</th>
      <th>用户组</th>
      <th>是否在线</th>
      <th>状态</th>
      <th  width="38%">管理</th>
    
   </tr>
   <% while(ra.next()) { %>
      <tr bgcolor="lightblue">
     <td><%=ra.getString("idUsers") %></td>
     <td><%=ra.getString("usersname") %></td>
     <td><%=transfer(ra.getString("userAuthority"))%></td>
     <td><%=IsOnline(ra.getString("isonline"))%></td>
     <td><%=Isalive(ra.getString("isalive"))%></td>
     <td >  
           &nbsp;&nbsp;
           <%if(ra.getString("userAuthority").equals("1")) {%>
            <a class="btn btn-small btn-info" href='UserInformation.jsp?action=show&id=<%=ra.getString("idUsers")%>'><i class="icon-info-sign icon-white"></i>  More Info</a>
            <a class="btn btn-danger" href='UserInformation.jsp?action=delete&id=<%=ra.getString("idUsers") %>'><i class="icon-trash icon-white"></i> Delete</a>
            <a class="btn btn-primary" href="UserInformation.jsp?action=change&id=<%= ra.getString("idUsers")%>&Isreturn=yes"><i class="icon-exchange icon-white"></i> Change</a>
            <a class="btn btn-success" href="UserInformation.jsp?action=change&id=<%= ra.getString("idUsers")%>&Isreturn=no"><i class="icon-plus icon-white"></i> As Admin</a>
           
                      <% }%>
       </td>
     
   </tr> 
   <%} %>
</table>

  <%
  
  
  
    
   } catch(Exception e)
  {
	     out.println(e.getMessage());
	  }
   finally
   {
	   if(ra!=null)
	   	ra.close();
	   if(preStmt!=null)
	   	preStmt.close();
	   if(conn!=null)
	   conn.close(); 
   }
   %>
<div align ="center">
<ul class="pagination" >
    <li><a href="tse.jsp?pageNum=1">&laquo;</a></li>
    <% for(int i=1; i<=pageCount;i++)
    {
    	 out.println("<li><a href=tse.jsp?pageNum="+i+">"+i+"</a></li>");
    }
    %>
     <li><a href="tse.jsp?pageNum=<%=pageCount %>>">&raquo;</a></li>
</ul>
</div>
  
         </div>
      </div>
  
 

    

    
  <jsp:include page="footer.jsp"/>
    
</body>
</html>