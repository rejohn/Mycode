<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*,java.util.*" %>
    <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
    <%@page import ="com.CoodeTeam.JavaBean.Answers"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
request.setCharacterEncoding("UTF-8");
Enumeration paramNames = request.getParameterNames();
ArrayList<String > AnswersItems=new ArrayList<String >();
String QuestionnaireID="";
while(paramNames.hasMoreElements()) {
   String paramName = (String)paramNames.nextElement();
   if(paramName.equals("qid"))
   {
	   QuestionnaireID=request.getParameter(paramName);
   }
   else if (paramName.indexOf("s")!=-1){
	   
	   String temp=request.getParameter(paramName);
	   
	   AnswersItems.add(temp);
	  // Collections.sort(AnswersItems);
   }
   else if(paramName.indexOf("m")!=-1)
   {
	   AnswersItems.add(paramName);
   }
   else if(paramName.indexOf("b")!=-1)
   {     String temp=request.getParameter(paramName);
	   AnswersItems.add(paramName+"Zf"+temp);
   }
   else if(paramName.indexOf("j")!=-1)
   {     String temp=request.getParameter(paramName);
	   AnswersItems.add(temp);
   }
   
}
 Answers temp=new Answers(AnswersItems,QuestionnaireID);
 String Ip=request.getLocalAddr();
 
 String Uid=session.getAttribute("UserID")+"";

 
 temp.SaveAnswer(Ip,Uid);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>回答完成</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/scojs.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/styles.css"/> 

   <script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.pin.min.js"></script>
</head>
<body>
</br>
</br>

<div align ="center">
<img src=images/thanks.jpg  height=500px  width=860px >
</div>
</br>

 <div align="center">
<a class="btn btn-primary " href="index.jsp"    >不客气~</a>
</div>


</body>
</html>