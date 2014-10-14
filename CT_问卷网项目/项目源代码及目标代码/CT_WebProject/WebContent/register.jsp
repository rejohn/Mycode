<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<%@include file="head.jsp" %>
<STYLE type="text/css">
body {
  padding-top: 60px;
  padding-bottom: 40px;
  background-color: #eee;
  
}

.form-signin {
  max-width:330px;
  padding: 15px;
  margin: 0 auto;
 
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
  margin-left:20px;
  
}
.form-signin .form-control {
  position: relative;

  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="username"] {
  margin-bottom: 0px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 0px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
.message{
	margin-bottom:0;
	max-width:330px;
    color:#FF6803;
	visibility:hidden;
}


</STYLE>
<script type="text/javascript">
function chkpwd(){
	
	
	if($("#pwd").val().length<6)
	{
		$("#pwdError").css("visibility","visible");
	}
	else
	{
		$("#pwdError").css("visibility","hidden");
	}
	if($("#pwd").val()=="")
	{
		$("#pwdError").css("visibility","hidden");
	}

}
function chkpwd2(){
	if($("#pwd2").val()=="")
		{
		$("#pwd2Error").css("visibility","hidden");
		}
	if($("#pwd2").val()!=$("#pwd").val())
	{
		$("#pwd2Error").css("visibility","visible");	
	}else
	{
		$("#pwd2Error").css("visibility","hidden");
	}
	
}
function chkuser(){
   /*
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest();
	}else{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		
	}
	var user = $("#user").val();
	xmlhttp.onreadystatechange=clback;
	xmlhttp.open("post","UserServlet.do?method=checkuser&user="+user,true);
	xmlhttp.send();
	*/
}
function clback(){
 	/*
 	if(xmlhttp.readyState==4){
		var text =xmlhttp.responseText;
		if("true"==text){
			alert("用户名已存在");
		}
		else{
			alert("可用");
		}
	}
 	*/
}
function chkage(){
	var age=$("#age").val();
	
	if( parseInt(age)<0 || parseInt(age)>100){
		$("#ageError").css("visibility","visible");	
	}
	else
	{
		$("#ageError").css("visibility","hidden");
	}
	
}
function chkadr(){
	
}

</script>
</head>
<body>
<%@include file="header5.jsp" %>
<div class="container">
   <%request.setCharacterEncoding("utf-8"); %>
      <form class="form-signin" action="UserServlet.do?method=register" method="post">
        <h2 class="form-signin-heading">Register</h2>
       
        <input type="text" name="username" class="form-control" id="user" onblur="chkuser()" placeholder="Username" required autofocus>
        <p class="message" id="userError">
            * 用户名不可用
        </p>
        <input type="password" name="password"class="form-control" id="pwd" onblur="chkpwd()" placeholder="Password" required>
        <p class="message" id="pwdError">
        	* 请输入长度大于6位的密码
        </p>
        <input type="password" name="password2"class="form-control" id="pwd2" onblur="chkpwd2()" placeholder="Password confirm" required>
        <p class="message" id="pwd2Error">
        	* 请输入一致的密码
        </p>
        <input type="radio" name="sex" checked="checked"  value="male"> 男  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 
        <input type="radio" name="sex"  value="female"> 女
        
        <br></br>
        <input type="text" name="age"class="form-control" id="age" onblur="chkage()"placeholder="age" required>
        <p class="message" id="ageError">
        	* 请输入正确的年龄
        </p>
        <input type="text" name="address"class="form-control" id="adr" onblur="chkadr()" placeholder="address" required>
        <p class="message" id="addressError">
        	* 请输入正确的地址
        </p>
      
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
      </form>

    </div> <!-- /container -->
    

   

<%@include file="footer.jsp" %>



</body>
</html>