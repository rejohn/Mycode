<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%questionnaireCreate temp=new questionnaireCreate("50"); %>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>问卷详细信息</title>
<script src="/js/jquery-1.11.1.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
<link href = "css/bootstrap-responsive.min.css" rel ="stylesheet">
 <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
 <link rel="stylesheet" type="text/css" href="css/styles.css"/> 
</head>
<body>
<%@include file= "header4.jsp" %>
</br>
</br>
</br>
<div class="container">
<div class="row">
<div class="col-md-2" ></div>
<div class="col-md-3" ><h2>问卷详细信息</h2></div>
<div class="col-md-7" ></div>
</div>
<div class="row">
<div class="col-md-3" ></div>
<div class="col-md-6" ><%out.println(temp.show()); %> </div>
<div class="col-md-3" ></div>
</div>

</div>
</body>
</html>