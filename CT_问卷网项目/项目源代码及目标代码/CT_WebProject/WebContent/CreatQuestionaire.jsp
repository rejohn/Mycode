<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp"%>
<title>创建问卷</title>

</head>
<body>



<%@include file= "header2.jsp" %>
<% 
    	
if (username==null)
	{
		response.sendRedirect("login.jsp");
	}
%>
<br><br><br><br>
<div class="container" id="Content">
 <form action="UserServlet.do?method=creatQuestionaire" method="post">
 <h2 class="form-signin-heading">问卷信息</h2><br><br>
  <label class="control-label">问卷标题：</label>
  <input type="text" class="control-label" size="35" name="title"/>
  <label class="control-label"  ><span style="color:red"> &nbsp&nbsp*必填</span></label><br><br>
  <label class="control-label">问卷主题：</label>
  <select name="subject">
   <option value="品牌营销">品牌营销</option>
   <option value="产品测试">产品测试</option>
   <option value="消费分析">消费者分析</option>
   <option value="满意度调查">满意度调查</option>
   <option value="人力资源">人力资源</option>
   <option value="学术教育">学术教育</option>
   <option value="社会民意">社会民意</option>
   <option value="其他">其他</option>
 </select><br><br>
<label class="control-label">问卷描述：</label>
 <textarea name="description" rows ="3" cols ="37"></textarea>
 <br><br>
 <input type="submit" class="btn btn-primary span3" value="创建" style = "margin-left:0px;">
 </form>
 <%@include file = "footer.jsp" %>
 </div>
</body>
</html>