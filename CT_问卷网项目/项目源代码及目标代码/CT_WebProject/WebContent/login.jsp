<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登陆</title>
<%@include file="head.jsp" %>
<STYLE type="text/css">
body {
  padding-top: 60px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 330px;
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
  margin-top:20px;
  margin-bottom:20px;

  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="username"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
 
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
  
}
#error{
margin-top:20px;
background-color:#eee;
font-size:20px;
text-align:center;

}

</STYLE>

  <script type="text/javascript">
    
      $("[data-toggle=popover]").popover();
 </script>

</head>
<body>
	  <%@include file="header4.jsp" %>
	  
	  <div class="container">

      <form class="form-signin" action="UserServlet.do?method=login" method="post">
        <h2 class="form-signin-heading">Login</h2>
        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <!--
        <label class="checkbox">
          <input type="checkbox" value="remember-me">记住我
        </label>
        -->
        </br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        <%
        	if(session.getAttribute("loginfailed")!=null)
        	{
        %>
        <p id="error">
        	用户不存在或密码错误 !
        </p>
       <% 
       	 	}
        	session.removeAttribute("loginfailed");
       %>
       
      </form>

    </div> <!-- /container -->

    <%@include file="footer.jsp" %>
</body>
</html>