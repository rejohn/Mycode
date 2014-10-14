<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%@ page import="java.sql.*" %> 
  <jsp:directive.page import="com.CoodeTeam.JavaBean.DbManager"/>
  <jsp:directive.page import="com.CoodeTeam.JavaBean.DBAccess"/>
<head> 
  <jsp:include page="head.jsp"/>
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
 
<title>管理问卷</title>
</head>
<%! 
String password="";


String getusername(String a)
{
	String temp="" ;
	DBAccess db = new DBAccess();
	ResultSet ra=null;
	//ArrayList answerItems=new ArrayList<String >();
	try{
	if(db.createConn()){
		String sql = "select users.usersname from users where users.idUsers ='"+a+"'";
		db. query(sql);
		ra=db.getRs();

      if(ra.next())
      {
    	  temp = ra.getString("usersname");
      }}}catch(Exception e)
      {
    	  //out.println(e.getMessage());
    	 } 
    return  temp;
 }


 %>
<body>  <% 
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
            
            <li class="active" ><a  href ="questionnaire.jsp"    ><font color="white"><b>管理问卷</b></font></a></li>
            <li><a href="RunningState.jsp"><font color="white"><b>运行状态</b></font></a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
           <li><a href="TobeDone.jsp"><font color="white"><b><em><%=username  %></em></b></font></a></li>
  
          </ul>
         
        </div><!--/.nav-collapse -->
      </div>
    </div>
<br></br><br>
    <%
 	final int pageSize = 5;	// 一页显示 10 条记录

	int pageNum = 1; 			// 当前页数
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
		sql = "SELECT count(*) FROM questionaire ";
		
		recordCount = DbManager.getCount(sql);
		
		// 计算总页数
		pageCount = ( recordCount + pageSize - 1 ) / pageSize;
		// 本页从 startRecord 行开始
		int startRecord = ( pageNum - 1) * pageSize;
		
		// MySQL 使用limit实现分页
		sql = "SELECT * FROM questionaire LIMIT ?, ? ";
		
		conn = DbManager.getConnection();
		preStmt = conn.prepareStatement(sql);
		DbManager.setParams(preStmt, startRecord, pageSize);
		ra = preStmt.executeQuery();
   
    
    
    %>
<center><h2 style="font-family:黑体">问卷表</h2></center>
<div class="container">
<div class="row">

<div class="col-md-12" ><table border="1" align="center" id=one class="table table-bordered table-striped">
   <tr>
      <th width="12%">问卷号</th>
      <th>问卷名</th>
      <th>问卷状态</th>
     
      <th>问卷发起人</th>
      <th width="21%">管理</th>
    
   </tr>
   <% while(ra.next()) { %>
      <tr bgcolor="lightblue">
     <td><%=ra.getString("idQuestionare") %></td>
     <td><%=ra.getString("title") %></td>
     <td><%=ra.getString("State")%></td>
     <td><%=getusername(ra.getString("Users_idUsers"))%></td>
     <td  >   
        <a class="btn btn-small btn-info" href='QuestionaireInformation.jsp?action=show&id=<%=ra.getString("idQuestionare")%>'><i class="icon-info-sign icon-white"></i>  More Info</a>
         <a class="btn btn-danger" href='QuestionaireInformation.jsp?action=delete&id=<%=ra.getString("idQuestionare")%>'><i class="icon-trash icon-white"></i> Delete</a>
    </td>     
     </tr> 
<%} %>
</table>
   <%
  
	
   ra.close();
   preStmt.close();
   conn.close();
    
   } catch(Exception e)
  {
	     out.println(e.getMessage());
	  } 
	  %>
<div align ="center">
<ul class="pagination" >
    <li><a href="questionnaire.jsp?pageNum=1">&laquo;</a></li>
    <% for(int i=1; i<=pageCount;i++)
    {
    	 out.println("<li><a href=questionnaire.jsp?pageNum="+i+">"+i+"</a></li>");
    }
    %>
     <li><a href="questionnaire.jsp?pageNum=<%=pageCount %>">&raquo;</a></li>
</ul>
</div>
 </div>

</div>

</div>

 <jsp:include page="footer.jsp"/>
</body>
</html>