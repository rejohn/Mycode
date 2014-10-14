<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "com.CoodeTeam.JavaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp"%>
<title>参与调查</title>
<script src="/js/jquery-1.11.1.min.js"></script>
<link href = "css/bootstrap.min.css" rel ="stylesheet">
<link href = "css/font-awesome.min.css" rel ="stylesheet" type="text/css">
<link href = "css/bootstrap-responsive.min.css" rel ="stylesheet" type="text/css">
<script type="text/javascript" language="javascript">
function JoinInQ(qid)
{
	var put = document.getElementById("paraQ");
	put.value=qid;
	with (document.getElementById("formQ")){
        method = "post"; 
        action ="UserServlet.do?method=joinQ";
        submit();
    }
}
function ResultQ(qid)
{
	var put = document.getElementById("paraQ");
	put.value=qid;
	with (document.getElementById("formQ")){
        method = "post"; 
        action ="chart2.jsp";
        submit();
}
	}
</script>
</head>

<body>
<%@include file= "header3.jsp" %>
<% 
 	int userid =0;
	if(username!=null)
	{
		userid=(Integer)session.getAttribute("UserID");
	}
%>
<br><br><br>
<div class="container" id="content">
<br>
<h3 class="text-success" style="font-family:黑体">可参与的问卷</h3>
<br><br>
<% 	QuestionaireData d = new QuestionaireData();
 		out.print(d.showQuestionaire(userid));	 %>
 <br>
<h3 class="text-success" style="font-family:黑体">问卷统计报告</h3>
<br><br>
<% out.print(d.showResult(userid));	%>

  <form id="formQ">
 <input type = "hidden" name="qid" id="paraQ">
 </form>
</div><br><br>

 <%@include file = "footer.jsp" %>
</body>
</html>