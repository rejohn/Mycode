<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "com.CoodeTeam.JavaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp"%>
<title>我的答卷</title>
<script src="/js/jquery-1.11.1.min.js"></script>
<link href = "css/bootstrap.min.css" rel ="stylesheet">
<link href = "css/font-awesome.min.css" rel ="stylesheet" type="text/css">
<link href = "css/bootstrap-responsive.min.css" rel ="stylesheet" type="text/css">
<script type="text/javascript" language="javascript">
function ViewQ(qid,state)
{
	var put = document.getElementById("paraQ");
	put.value=qid;
	with (document.getElementById("formQ")){
        method = "post";  
        action = "MyAnswerSheet.jsp";
        submit();
	}
}
function ResultQ(qid,state)
{
	var put = document.getElementById("paraQ");
	put.value=qid;
	with (document.getElementById("formQ")){
        method = "post";  
        action = "chart.jsp";
        submit();
    }  
}
</script>
</head>
<body>
<%@include file= "header2.jsp" %>
<% 
int userid=0;
if (username==null)
{
	response.sendRedirect("login.jsp");
}else{
	userid=(Integer)session.getAttribute("UserID");
}
%>
<br><br><br>
<div class="container" id="content">
<div class ="controls-row">
<br><br>
<div class="span1" style="margin-left:0px;"><button class="btn btn-primary" onclick="location.href='CreatQuestionaire.jsp'" >创建问卷</button></div>
<div class="span1" style="margin-left:40px;"><button class="btn btn-primary" onclick="location.href='MyQC.jsp'" >未发布问卷</button></div>
<div class="span1" style="margin-left:50px;"><button class="btn btn-primary" onclick="location.href='MyQO.jsp'" >已发布问卷</button></div>
<div class="span1" style="margin-left:50px;" ><button class="btn btn-primary" onclick="location.href='MyQS.jsp'" >已关闭问卷</button></div>
<div class="span1" style="margin-left:50px;"><button class="btn disabled btn-success" onclick="location.href='MyRQ.jsp'" >我的答卷</button></div>
<br><br><br><br>
<%	QuestionaireData d = new QuestionaireData();
	out.print(d.showData(userid,4));%>
<form id="formQ">
 <input type = "hidden" name="qid" id="paraQ">
 </form>
 </div>
</div><br><br>

 <%@include file = "footer.jsp" %>
</body>
</html>