<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <%@page import ="com.CoodeTeam.JavaBean.Users"%>
 <%@page import ="com.CoodeTeam.JavaBean.DBAccess"%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" type="text/css" href="css/styles.css"/> 
  <script src="js/jquery-1.10.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>  
  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>我的信息</title>
</head>
<%
String id = request.getParameter("id");
String action = request.getParameter("action");
Users temp=new Users("1"); 
%>
<body >
<%@include file= "header4.jsp" %>
</br>
</br>
</br>
<div class="container">
<div class="row">
<div class="col-md-2" ></div>
<div class="col-md-3" ><h2>我的个人信息</h2></div>
<div class="col-md-7" ></div>
</div>
<div class="row">
<div class="col-md-3" ></div>
<div class="col-md-6" ><%out.println(temp.showUser()); %> </div>
<div class="col-md-3" ></div>
</div>

</div>

</body>
</html>