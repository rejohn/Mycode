<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>问卷调查</title>

    <%@include file="head.jsp" %>
    <STYLE type="text/css">
.jumbotron{
	margin-top:60px;
	padding-top:10px;
	font-family:
	"Microsoft YaHei UI",
	"Microsoft YaHei",
	"WenQuanYi Micro Hei",
	sans-serif;
}
.jumbotron h1{
    color:#7979E6;
    font-size:37pt;
}
.jumbotron p{
    color:rgb(154, 101, 235);
}
 </STYLE>
      <link href="css/carousel.css" rel="stylesheet">
      

     </head>

  <body>

    <%@ include file="header.jsp" %>
     <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="images/sy1.jpg;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><b>丰富的问卷形式</b></h1>
              <p>支持选择题，填空题，判断题，问答题，灵活收集问卷信息，让你轻松调研。</p>
              <p><a class="btn btn-lg btn-primary" href="MyQC.jsp" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="images/sy2.jpg;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><b>灵活的问卷管理</b></h1>
              <p>可以让你针对特定人群投递问卷，帮助您的问卷创造价值。</p>
              <p><a class="btn btn-lg btn-primary" href="MyQC.jsp" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="images/sy3.jpg;base64,R0lGODlhAQABAIAAAFVVVQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><b>轻松的创建操作</b></h1>
              <p>轻轻一点，问题就添加到了页面之中，省去了您的诸多工作。</p>
              <p><a class="btn btn-lg btn-primary" href="register.jsp" role="button">Join us</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">Pre</a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">Next</a>
    </div><!-- /.carousel -->
    <div class="container-fluid">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1 color=#7979E6>欢迎来到CT问卷网！</h1>
        <p><br>CT问卷网满载诚意，为你做到更多，让你的问卷更丰满，更充实，更有意义。精彩服务，值得拥有，精心设计的问卷倍加引人注目。</p>
        <p>We try our best to do more for you with full of sincerity. To make your questionnaires better. You deserve brilliant service.Our questionnaires are well designed to attract more. “You are more powerful than you think!”</p>
        <p><big>♪ Use CT-questionnaire immediately!</big></p>
        <p>
          <a class="btn btn-lg btn-primary" href="JoinQ.jsp" role="button">立即使用 &raquo;</a>
        </p>
        <!-- 
        <p>
        	您的IP地址是：<%=session.getAttribute("ip") %>
        </p>  -->
      </div>

    </div> <!-- /container -->

<!-- 
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
		  <div class="thumbnail">
		    <img src="imp/smileface.png" alt="300x200" width="576" height="240" />
		    <div class="caption">
		      <h3><b>丰富的问卷形式</b></h3>
		      <p>支持选择题，填空题，判断题，问答题，灵活收集问卷信息，让你轻松调研。</p>
	        </div>
	      </div>
			<div class="thumbnail">
			  <img alt="300x200" src="imp/smileface.png" />
			  <div class="caption">
			    <h3><b>灵活的问卷管理</b></h3>
			    <p>可以让你针对特定人群投递问卷，帮助您的问卷创造价值。</p>
		      </div>
		  </div>
			<div class="thumbnail">
			  <img alt="300x200" src="imp/smileface.png" />
			  <div class="caption">
			    <h3><b>轻松的创建操作</b></h3>
			    <p> 轻轻一点，问题就添加到了页面之中，省去了您的诸多工作。</p>
		      </div>
		  </div>
	    </div>
	</div>
</div>  -->

    <%@ include file="footer.jsp" %>







<script src="js/jquery.min.js"></script>
  <script src="js/docs.min.js"></script>

  </body>
</html>
