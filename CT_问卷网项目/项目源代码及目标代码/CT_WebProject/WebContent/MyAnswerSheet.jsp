<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
      <%@page import ="com.CoodeTeam.JavaBean.DynamicShow"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的答卷</title>
<link rel="stylesheet" type="text/css" href="css/styles.css"/> 
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 
<script type="text/javascript">

$(document).ready(function(){
	$(".pinned").pin({
	    containerSelector: ".container"
	});
	$('input').iCheck({
	    checkboxClass: 'icheckbox_square-blue',
	    radioClass: 'iradio_square-blue',
	    increaseArea: '20%' // optional
	  });
});

</script>  
 -->
</head>
<body>
<%@include file= "header2.jsp" %>
<% 
String Qid=request.getParameter("qid")+"";
questionnaireCreate temp=new questionnaireCreate(Qid);
int userid=0;
if (username==null)
{
	response.sendRedirect("login.jsp");
}else{
	userid=(Integer)session.getAttribute("UserID");
}
DynamicShow a=new DynamicShow(temp);
String af="";
%>
</br></br></br>
</b>
<div class="container clearfix">

    <div class="row">
        <div class="left-col">
            
            <p class="lead"></p>
            <p id="link-one"></p>
            <p id="link-two"></p>
            <p id="link-three"></p>
            <p>
             <%=a.showMyAnswerPage(userid+"") %>
           </p>
           <!-- <p></p> -->
        </div>
   
        <div class="right-col">
       
           <div class="pin-wrapper" style="height: 122px;">
                <ul id= "ulid"  class="nav pinned" style="width: 48px; right: 74.5px; top: 120px; position: fixed;">
 
                    
                  <!--   <a id ="back" href="javascript:history.back(-1);" onclick ="javascript :history.back(-1);" style="position: fixed; z-index: 2147483647;"></a>
                   
                    -->
                </ul>
            </div>
          
            <div class="pin-wrapper" style="height: 122px;">
                <ul id="ulid" class="nav pinned" >
                    
                  <a id="scrollUp" href="#top" title="" style="position: fixed; z-index: 2147483647;"></a>
				
                   
                </ul>
            </div>
        </div>
       
    </div>
    
     <div style="margin-bottom:3%;margin-left:170px;">
<!--   <form action="MyRQ.jsp" method="post">-->
<button class="btn btn-primary"  type="submit" onclick = "javascript:history.back(-1);">&nbsp;&nbsp;返&nbsp;回&nbsp;&nbsp;</button>
<!--</form>-->
</div>
</div>
</body>
</html>