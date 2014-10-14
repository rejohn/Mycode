<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
      <%@page import ="com.CoodeTeam.JavaBean.DynamicShow"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
String Qid=request.getParameter("qid")+"";
questionnaireCreate temp=new questionnaireCreate(Qid);
DynamicShow a=new  DynamicShow(temp);
String af="";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>问卷单</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/scojs.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/styles.css"/> 

   <script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.pin.min.js"></script>
</head>
<body> 
<%@include file ="header2.jsp" %>
</b>
</br>
</br>
</br>
<div class="container clearfix">


    <div class="row">
        <div class="left-col">
              <h2></h2>
            <p class="lead"></p>
            <p id="link-one"></p>
            <p id="link-two"></p>
            <p id="link-three"></p>
            <p><%out.println(a.showQuestionnairePage()); %>
        
           </p>
            <p></p>
           
        </div>
        <div class="right-col">
         
             <div class="pin-wrapper" style="height: 122px;">
                <ul id="ulid" class="nav pinned" >
                    
                  <a id="scrollUp" href="#top" title="" style="position: fixed; z-index: 2147483647;outline : none;"></a>

                    
                </ul>
            </div>
        </div>
    </div>
    
     <div style="margin-bottom:3%;margin-left:170px;">
 <!--  <form action="MyRQ.jsp" method="post">-->
<button class="btn btn-primary"  type="submit" onclick = "javascript:history.back(-1);">&nbsp;&nbsp;返&nbsp;回&nbsp;&nbsp;</button>
<!-- </form>-->
</div>

</div>

</body>
</html>