<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "com.CoodeTeam.JavaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp"%>
<title>我的问卷</title>
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
        action = "QuestionnaireShow.jsp";
        submit();
	}
}
function EditQ(qid,state)
{
	var put = document.getElementById("paraQ");
	put.value=qid;
	with (document.getElementById("formQ")){
        method = "post"; 
        action = "Editque.jsp";
        submit();
    }  
}
function PublishQ(qid,state)
{
	var put = document.getElementById("getPara");
	put.value = qid;
}
function RemoveQ(qid,state)
{
	var put = document.getElementById("paraQ");
	put.value=qid;
	with (document.getElementById("formQ")){
        method = "post"; 
        action = "UserServlet.do?method=deleteQuestionaire&Qpage=MyQC.jsp";
        submit();
    }  
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<div class="span1" style="margin-left:0px;"><button class="btn btn-primary"onclick="location.href='CreatQuestionaire.jsp'" >创建问卷</button></div>
<div class="span1" style="margin-left:40px;" ><button class="btn disabled btn-success" onclick="location.href='MyQC.jsp'" >未发布问卷</button></div>
<div class="span1" style="margin-left:50px;" ><button class="btn btn-primary" onclick="location.href='MyQO.jsp'" >已发布问卷</button></div>
<div class="span1" style="margin-left:50px;" ><button class="btn btn-primary" onclick="location.href='MyQS.jsp'" >已关闭问卷</button></div>
<div class="span1" style="margin-left:50px;" ><button class="btn btn-primary" onclick="location.href='MyRQ.jsp'" >我的答卷</button></div>
<br><br><br><br>

<%	QuestionaireData d = new QuestionaireData();
	out.print(d.showData(userid,1));%>
	<form id="formQ">
 <input type = "hidden" name="qid" id="paraQ">
 </form>
</div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
       <dd class="selected">
            <div class="skin-section">
              <h4></h4>
             
              <form action="url.jsp" method="post">
              <ul class="list">
              	  <input tabindex="15" type="radio" id="flat-radio-1" name="anony" value="1" checked>
                  <label for="flat-radio-1">允许匿名</label>
               	  <input tabindex="15" type="radio" id="flat-radio-1" name="anony" value="0">
                  <label for="flat-radio-1">不允许匿名</label>                                
              </ul>
              <ul class="list">
              	  <input tabindex="15" type="radio" id="flat-radio-1" name="ipLimit" value="1" checked>
                  <label for="flat-radio-1">不允许同一ip多次提交</label>
                  &nbsp;&nbsp;
               	  <input tabindex="15" type="radio" id="flat-radio-1" name="ipLimit" value="0">
                  <label for="flat-radio-1">允许同一ip多次提交</label>  
              </ul>
              
              <ul class="list">  
              	  <input tabindex="16" type="radio" id="flat-radio-2" name="sex" checked value="0">
                  <label for="flat-radio-2">不限性别</label>               
                  <input tabindex="15" type="radio" id="flat-radio-1" name="sex" value="1">
                  <label for="flat-radio-1">仅限男性用户</label>
               	  <input tabindex="15" type="radio" id="flat-radio-1" name="sex" value="2">
                  <label for="flat-radio-1">仅限女性用户</label>
                                
               </ul>
               <ul class="list">
           		 年龄区间：<input type="text" name= "ageMin" value="0">&nbsp;——&nbsp;<input type="text" name="ageMax" value="100">
               <br><br>  持续时间：<input type="text" name="time" value="1">天
               </ul>
             <!--  <div class="span1" style="float:middle"><button  class="btn btn-primary" type= "submit" id = "baocun" >保存</button></div>
               -->
            <input type="hidden" name="id" id ="getPara">
            <div class="modal-footer">
        <button  class="btn btn-primary" type="submit" id="baocun">保存</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>        
      </div>
             </form>
            </div>            
            </dd>
      </div>      
    </div>
  </div>
</div>

 <script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  });
});
</script>
 </div><br><br>
 <%@include file = "footer.jsp" %>
</body>
</html>