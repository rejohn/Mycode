<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file= "head.jsp"%>
<link href="css/blue.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/scojs.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.icheck.js"></script>
<script src="js/sco.ajax.js"></script>
<script src="js/sco.valid.js"></script>
<script src="js/sco.modal.js"></script>
<script src="js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>问卷设置</title>
<%@include file= "header2.jsp" %>
</head>
<body>

<br><br><br> 

<div> <button class="btn btn-primary " data-toggle="modal" data-target="#myModal" ></button></div>
            
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
                  <input tabindex="15" type="radio" id="flat-radio-1" name="sex" value="1">
                  <label for="flat-radio-1">仅限男性用户</label>
               	  <input tabindex="15" type="radio" id="flat-radio-1" name="sex" value="2">
                  <label for="flat-radio-1">仅限女性用户</label>
                  <input tabindex="16" type="radio" id="flat-radio-2" name="sex" checked value="0">
                  <label for="flat-radio-2">不限性别</label>               
               </ul>
               <ul class="list">
           		 年龄区间：<input type="text" name= "ageMin" value="">——<input type="text" name="ageMax" value="">
               </ul>
             <!--  <div class="span1" style="float:middle"><button  class="btn btn-primary" type= "submit" id = "baocun" >保存</button></div>
               -->
            <input type="hidden" name="id" value="59">
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
    
</body>

<script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  });
});
</script>
</html>