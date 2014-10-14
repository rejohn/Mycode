<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String action = request.getParameter("action");
questionnaireCreate temp=new questionnaireCreate(id);
if("del".equals(action)){
	
	temp.disablequestionnaire();
	response.sendRedirect("QuestionaireInformation.jsp?action=show&id="+id); 
}
else if(action.equals("add"))
{
	temp.enablequestionnaire();
	response.sendRedirect("QuestionaireInformation.jsp?action=show&id="+id);
	}
if (action.equals("delete"))
{
	temp.deleteQuestionnaire();
	response.sendRedirect("questionnaire.jsp");
	}
%>
<head><jsp:include page="head.jsp"/>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <script src="js/jquery-1.10.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>问卷详细信息</title>
</head>
<body><% 
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
        <div class="navbar-collapse collapse" >
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

 <div class="container">
<div class="row">
<div class="col-md-4" ></div>
<div class="col-md-4" ><h1 align="center"> 问卷信息  </h1></div>
<div class="col-md-4" ></div>
</div>
<div class="row">
<div class="col-md-8" ></div>
<div class="col-md-1" ><a class="btn btn-success" href="" onclick =""><i class="icon-file icon-white"></i> <%=temp.getAnnu() %>份答卷</a></div>
<div class="col-md-3" ></div>
</div>
</div>

<h3 align ="center"> 
<%if(temp.alive)
{
	%>
	<a class="btn btn-danger" href='QuestionaireInformation.jsp?action=del&id=<%=id %>' onclick=''><i class="icon-lock"></i>   禁用</a>
	

<%}
 else
{ %>	
<a class="btn btn-success" href='QuestionaireInformation.jsp?action=add&id=<%=id %>' onclick=''> <i class="icon-key"></i> 解禁</a>

<%} %>	

<a class="btn btn-danger" href='QuestionaireInformation.jsp?action=delete&id=<%=id %>' onclick="alert("删除该表单？");"><i class="icon-trash icon-white"></i> 删除</a>
<a class="btn btn-primary" href="javascript:history.back(-1);" onclick ="javascript:history.back(-1);"><i class="icon-reply icon-white"></i> 返回</a>
</h3>	
<div class="container">
<div class="row">
<div class="col-md-3" ></div>
<div class="col-md-6" ><%out.println(temp.show()); %>     </div>
<div class="col-md-3" ></div>
</div>

</div>

 <jsp:include page="footer.jsp"/>
</body>
</html>