<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
    	String username =(String) session.getAttribute("username");
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
            <li class="active" ><a href="index.jsp"><font color="white"><b>主页</b></font></a></li>
            <li  class ="dropdown" > 
            <a  href ="#"  class ="dropdown-toggle"  data-toggle ="dropdown" ><font color="white"><b>我的问卷</b></font><b  class ="caret" ></b></a> 
            <ul  class ="dropdown-menu" > 
            	 <li ><a  href ="CreatQuestionaire.jsp">创建问卷</a></li>
        
                 <li ><a  href ="MyQC.jsp">未发布问卷</a></li>    
                 <li ><a  href ="MyQO.jsp">已发布问卷</a></li> 
                 <li ><a  href ="MyQS.jsp">已关闭问卷</a></li> 
                 <li ><a  href ="MyRQ.jsp">我的答卷</a></li> 
                
            </ul>
            </li>
            <li><a href="JoinQ.jsp"><font color="white"><b>参与调查</b></font></a></li>
            
          </ul>
          <% if(username==null){ %>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="login.jsp"><font color="white"><b>登陆</b></font></a></li>
            <li><a href="register.jsp"><font color="white"><b>注册</b></font></a></li>
  
          </ul>
          <%
          	}
          else {
          %>
           <ul class="nav navbar-nav navbar-right">
            <li></li>
            <li><a href="#"><font color="white"><b><em><%=username  %></em></b></font></a></li>
            <li><a href="logout.jsp"><font color="white"><b>注销</b></font></a></li>
  
          </ul>
          <%} %>
        </div><!--/.nav-collapse -->
      </div>
    </div>
