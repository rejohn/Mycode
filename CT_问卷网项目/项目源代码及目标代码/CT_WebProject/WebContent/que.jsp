<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import = "com.CoodeTeam.JavaBean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "css/font-awesome.min.css" rel ="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp" %>
<title>CT问卷网</title>

<script type="text/javascript" language="javascript">

function submit(mmm){
	var tt =  document.getElementById("content");
	if(mmm == 1){
		tt.setAttribute( "action","UserServlet.do?method=insertData");
		
	}
	else if (mmm==2){
		tt.setAttribute( "action","UserServlet.do?method=publishData");
	}
document.forms[0].submit();
}

    var i = 1;//表示题号
    var total =1;
    var cho = 3;
	function fun1(){  
		
	cho = 3;		
    var label = document.createElement("label");
    label.setAttribute("id", "label"+total);
    //label.setAttribute("class","label label-success");
    label.setAttribute("for","table"+total);
    label.innerHTML = "Question"+i;
    // var text = document.createTextNode("Question"+i);
    //  label.appendChild(text);
    //<span class="label label-inverse">Inverse</span>
      	
    var table = document.createElement("table");
    table.setAttribute("id","table"+total);
    table.setAttribute("class","table table-bordered ");
    table.setAttribute("value", total);
   
    //thead
    var thead = document.createElement("thead");
    var tr = document.createElement("tr");
    tr.setAttribute("class", "success");
    var th1 = document.createElement("th");
    var input = document.createElement("textarea");
    input.setAttribute("placeholder",  "请输入单项选择问题");
    input.setAttribute("class","span8");
    input.setAttribute("rows","3");
    input.setAttribute("name","A"+total);
    input.setAttribute("style", "background:transparent;border:0");
    th1.appendChild(input);
    
    //<button class="btn btn-primary small" onclick="fun2(this)">删除</button></th>'
    var th2 = document.createElement("th");
    var button1 = document.createElement("button");
    button1.setAttribute("class","btn btn-danger");
    button1.setAttribute("onclick", "fun2(this)");
    button1.setAttribute("type", "button");
    button1.innerHTML = "<i class ='icon-trash'></i>";
	th2.appendChild(button1);
	
	tr.appendChild(th1);
    tr.appendChild(th2);
    thead.appendChild(tr);
    table.appendChild(thead);
    
    //tbody
    var tbody = document.createElement("tbody");
    //创建第二行
    var tr2 = document.createElement("tr");
    var td = document.createElement("td");
   
    var input2 = document.createElement("textarea");
    input2.setAttribute("class","span3");
    input2.setAttribute("placeholder",  "选项");
    input2.setAttribute("rows", "1");
    input2.setAttribute("name", total+"-1");
    input2.setAttribute("style", "background:transparent;border:0");
    td.appendChild(input2);
    
    var td2 = document.createElement("td");
    //<button class="btn btn-primary" onclick="deleteli(this)">删除选项<tton>
    var button2 = document.createElement("button");
    button2.setAttribute("class","btn btn-danger");
    button2.setAttribute("onclick", "deleteli(this)");
    button2.innerHTML = "<i class ='icon-trash'></i>";
    button2.setAttribute("type", "button");
    td2.appendChild(button2);
    
    tr2.appendChild(td);
    tr2.appendChild(td2);
    
    //创建第三行
    var tr3 = document.createElement("tr");
    var td3 = document.createElement("td");
    var input3= document.createElement("textarea");
    input3.setAttribute("class","span3");
    input3.setAttribute("placeholder",  "选项");
    input3.setAttribute("rows", "1");
    input3.setAttribute("name", total+"-2");
    input3.setAttribute("style", "background:transparent;border:0");
    td3.appendChild(input3);
    
    var td4 = document.createElement("td");
    var button3 = document.createElement("button");
    button3.setAttribute("class","btn btn-danger");
    button3.setAttribute("onclick", "deleteli(this)");
    button3.setAttribute("type", "button");
    button3.innerHTML = "<i class ='icon-trash'></i>";
    td4.appendChild(button3);
   
    tr3.appendChild(td3);
    tr3.appendChild(td4);
    
    
    
    
    //增加最后一行
    var tr0 = document.createElement("tr");
    var td0 = document.createElement("td");
    var button0 = document.createElement("button");
    button0.setAttribute("class", "btn btn-primary span2");
    button0.setAttribute("onclick", "add(this)");
    button0.innerHTML = "添加一项";
    button0.setAttribute("type", "button");
    td0.appendChild(button0);
    tr0.appendChild(td0);
    
    tbody.appendChild(tr2);
    tbody.appendChild(tr3);
    tbody.appendChild(tr0);
    table.appendChild(tbody);
    //包含label和table
    
    var container = document.getElementById("content");
    container.appendChild(label);
    container.appendChild(table);
    
    total++;
    i++;
    
    
    window.scrollTo(0,99999);
}
	
	function fun2(r){
		i--;
		var tt = r.parentNode.parentNode.parentNode.parentNode;
		var kt = tt.getAttribute("value");

		var container = document.getElementById("content");
		container.removeChild(r.parentNode.parentNode.parentNode.parentNode);
		container.removeChild(document.getElementById("label"+kt));
		
		var kdd = 1;
		for( s =1; s< total ; s++)
		{
			
			if( document.getElementById("label"+s) != null )
			 {
				
				document.getElementById("label"+s).innerHTML = "Question"+kdd;
				kdd++;
				
			 }
				
		}
}
	
	
	function deleteli(r){
		var tab = r.parentNode.parentNode.parentNode.parentNode;
		tab.deleteRow(r.parentNode.parentNode.rowIndex);
		//tab.removeChild(r.parentNode.parentNode.index);
	}
	
	

	function add(r){
		var tab = r.parentNode.parentNode.parentNode.parentNode;
		var kt = tab.getAttribute("value");
		var tabrows = tab.rows.length;
        var newTr = tab.insertRow(tabrows-1); 
        
        var td3 = document.createElement("td");
        var input3= document.createElement("textarea");
        input3.setAttribute("class","span3");
        input3.setAttribute("placeholder",  "选项");
        input3.setAttribute("rows", "1");
        input3.setAttribute("name", kt+'-'+cho);
        input3.setAttribute("style", "background:transparent;border:0");
        cho++;
        td3.appendChild(input3);
        
        var td4 = document.createElement("td");
        var button3 = document.createElement("button");
        button3.setAttribute("class","btn btn-danger");
        button3.setAttribute("onclick", "deleteli(this)");
        button3.setAttribute("type", "button");
        button3.innerHTML = "<i class ='icon-trash'></i>";
        td4.appendChild(button3);
       
        newTr.appendChild(td3);
        newTr.appendChild(td4);
	}
 	
	function fun3(){
		
		cho = 3;
		var label = document.createElement("label");
	    label.setAttribute("id", "label"+total);
	    //label.setAttribute("class","label label-success");
	    label.setAttribute("for","table"+total);
	    label.innerHTML = "Question"+i;
	    // var text = document.createTextNode("Question"+i);
	    //  label.appendChild(text);
	    //<span class="label label-inverse">Inverse</span>
	      	
	    var table = document.createElement("table");
	    table.setAttribute("id","table"+total);
	    table.setAttribute("class","table table-bordered");
	    table.setAttribute("value", total);
	    
	    //thead
	    var thead = document.createElement("thead");
	    var tr = document.createElement("tr");
	    tr.setAttribute("class", "warning");
	    var th1 = document.createElement("th");
	    var input = document.createElement("textarea");
	    input.setAttribute("placeholder",  "请输入多项选择问题");
	    input.setAttribute("class","span8");
	    input.setAttribute("rows","3");
	    input.setAttribute("name","B"+total);
	    input.setAttribute("style", "background:transparent;border:0");
	    th1.appendChild(input);
	    
	    //<button class="btn btn-primary small" onclick="fun2(this)">删除</button></th>'
	    var th2 = document.createElement("th");
	    var button1 = document.createElement("button");
	    button1.setAttribute("class","btn btn-danger");
	    button1.setAttribute("onclick", "fun2(this)");
	    button1.innerHTML = "<i class ='icon-trash'></i>";
		button1.setAttribute("type", "button");
		th2.appendChild(button1);
		
		tr.appendChild(th1);
	    tr.appendChild(th2);
	    thead.appendChild(tr);
	    table.appendChild(thead);
	    
	    //tbody
	    var tbody = document.createElement("tbody");
	    //创建第二行
	    var tr2 = document.createElement("tr");
	    var td = document.createElement("td");
	   
	    var input2 = document.createElement("textarea");
	    input2.setAttribute("class","span3");
	    input2.setAttribute("placeholder",  "选项");
	    input2.setAttribute("rows", "1");
	    input2.setAttribute("name", total+"-1");
	    input2.setAttribute("style", "background:transparent;border:0");
	    td.appendChild(input2);
	    
	    var td2 = document.createElement("td");
	    //<button class="btn btn-primary" onclick="deleteli(this)">删除选项<tton>
	    var button2 = document.createElement("button");
	    button2.setAttribute("class","btn btn-danger");
	    button2.setAttribute("onclick", "deleteli(this)");
	    button2.setAttribute("type", "button");
	    button2.innerHTML = "<i class ='icon-trash'></i>";
	    td2.appendChild(button2);
	    
	    tr2.appendChild(td);
	    tr2.appendChild(td2);
	    
	    //创建第三行
	    var tr3 = document.createElement("tr");
	    var td3 = document.createElement("td");
	    var input3= document.createElement("textarea");
	    input3.setAttribute("class","span3");
	    input3.setAttribute("placeholder",  "选项");
	    input3.setAttribute("rows", "1");
	    input3.setAttribute("name",total+"-2");
	    input3.setAttribute("style", "background:transparent;border:0");
	    td3.appendChild(input3);
	    
	    var td4 = document.createElement("td");
	    var button3 = document.createElement("button");
	    button3.setAttribute("class","btn btn-danger");
	    button3.setAttribute("onclick", "deleteli(this)");
	    button3.setAttribute("type", "button");
	    button3.innerHTML = "<i class ='icon-trash'></i>";
	    td4.appendChild(button3);
	   
	    tr3.appendChild(td3);
	    tr3.appendChild(td4);
	    
	    
	    //增加最后一行
	    var tr0 = document.createElement("tr");
	    var td0 = document.createElement("td");
	    var button0 = document.createElement("button");
	    button0.setAttribute("class", "btn btn-primary span2");
	    button0.setAttribute("onclick", "add(this)");
	    button0.setAttribute("type", "button");
	    button0.innerHTML = "添加一项";
	    
	    td0.appendChild(button0);
	    tr0.appendChild(td0);
	    
	    tbody.appendChild(tr2);
	    tbody.appendChild(tr3);
	    tbody.appendChild(tr0);
	    table.appendChild(tbody);
	    //包含label和table
	    
	    var container = document.getElementById("content");
	    container.appendChild(label);
	    container.appendChild(table);
	    
	    total++;
	    i++;
	    
	    window.scrollTo(0,99999);
}
	
	
	
	
		function fun4(){
			var label = document.createElement("label");
		    label.setAttribute("id", "label"+total);
		    //label.setAttribute("class","label label-success");
		    label.setAttribute("for","table"+total);
		    label.innerHTML = "Question"+i;
		    // var text = document.createTextNode("Question"+i);
		    //  label.appendChild(text);
		    //<span class="label label-inverse">Inverse</span>
		      	
		    var table = document.createElement("table");
		    table.setAttribute("id","table"+total);
		    table.setAttribute("class","table table-bordered ");
		    table.setAttribute("value", total);
		    
		    var thead = document.createElement("thead");
		    var tr = document.createElement("tr");
		    tr.setAttribute("class", "danger");
		    var th1 = document.createElement("th");
		    var input = document.createElement("textarea");
		    input.setAttribute("placeholder",  "请输入判断题");
		    input.setAttribute("class","span8");
		    input.setAttribute("rows","3");
		    input.setAttribute("name","C"+total);
		    input.setAttribute("style", "background:transparent;border:0");
		    th1.appendChild(input);
		    
		    var th2 = document.createElement("th");
		    var button1 = document.createElement("button");
		    button1.setAttribute("class","btn btn-danger");
		    button1.setAttribute("onclick", "fun2(this)");
		    button1.setAttribute("type", "button");
		    button1.innerHTML = "<i class ='icon-trash'></i>";
			th2.appendChild(button1);
			
			tr.appendChild(th1);
		    tr.appendChild(th2);
		    thead.appendChild(tr);
		    table.appendChild(thead);
		    
		    var tbody = document.createElement("tbody");
		    //创建第二行
		    var tr2 = document.createElement("tr");
		    var td = document.createElement("td");	
		    
		   td.innerHTML = '<div class="controls-row span6">'
	       +'<label >'
           +'<input type="checkbox" value="option1" disabled>True&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
         	+'</label>'
        	+'<label>'
           +'<input type="checkbox" id="optionsCheckbox2" value="option1" disabled>False'
         	+'</label>'
       		+'</div>'
		 
		    
		    tr2.appendChild(td);
		 
		    tbody.appendChild(tr2);
		    table.appendChild(tbody);
		    var container = document.getElementById("content");
		    container.appendChild(label);
		    container.appendChild(table);		    
		    total++;
		    i++;
		    
		    
		    window.scrollTo(0,99999);
		}
		
		
		function fun5(){
			var label = document.createElement("label");
		    label.setAttribute("id", "label"+total);
		    //label.setAttribute("class","label label-success");
		    label.setAttribute("for","table"+total);
		    label.innerHTML = "Question"+i;
		    // var text = document.createTextNode("Question"+i);
		    //  label.appendChild(text);
		    //<span class="label label-inverse">Inverse</span>
		      	
		    var table = document.createElement("table");
		    table.setAttribute("id","table"+total);
		    table.setAttribute("class","table table-bordered ");
		    table.setAttribute("value", total);
		    
		    var thead = document.createElement("thead");
		    var tr = document.createElement("tr");
		    tr.setAttribute("class", "active");
		    var th1 = document.createElement("th");
		    var input = document.createElement("textarea");
		    input.setAttribute("placeholder",  "请输入问答题");
		    input.setAttribute("class","span8");
		    input.setAttribute("rows","3");
		    input.setAttribute("name","D"+total);
		    input.setAttribute("style", "background:transparent;border:0");
		    th1.appendChild(input);
		    
		    var th2 = document.createElement("th");
		    var button1 = document.createElement("button");
		    button1.setAttribute("class","btn btn-danger");
		    button1.setAttribute("onclick", "fun2(this)");
		    button1.setAttribute("type", "button");
		    button1.innerHTML = "<i class ='icon-trash'></i>";
			th2.appendChild(button1);
			
			tr.appendChild(th1);
		    tr.appendChild(th2);
		    thead.appendChild(tr);
		    table.appendChild(thead);
		    
		   
		    var container = document.getElementById("content");
		    container.appendChild(label);
		    container.appendChild(table);		    
		    total++;
		    i++;
		    
		    window.scrollTo(0,99999);
		}
</script> 
</head>
<body>
<%@include file= "header2.jsp" %><br><br><br>

<% 
int userid=(Integer) session.getAttribute("UserID");

UserBean userbean = new UserBean();
int queid  = userbean.getid(userid);
%>

<div class="container" >
<form id = "content" action="UserServlet.do?method=insertData" method="post">


</form>
</div>
<br><br><br><br><br>
<div class = "control"  >
<div class="span1" style="float:left" ><button  class="btn btn-success " onclick="fun1()" >单选</button></div>
<div class="span1" style="float:left"><button  class="btn btn-warning" onclick="fun3()" >多选</button></div>
<div class="span1" style="float:left"><button  class="btn btn-danger" onclick="fun4()" >判断</button></div>
<div class="span1" style="float:left"><button  class="btn" onclick="fun5()" >问答</button></div>
<div class="span1" style="float:left"><button  class="btn btn-primary" type= "button" id = "baocun" onClick="submit(1)">保存</button></div>
</div>

<!-- 
<div class="span1" style="float:left"><button  type="button" class="btn btn-primary" data-toggle='modal' data-target='#myModal' id = "fabu"  >发布</button></div>



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
              	  <input tabindex="15" type="radio" id="flat-radio-1" name="ipLimit" value="0" checked>
                  <label for="flat-radio-1">不允许同一ip多次提交</label>
                  &nbsp;&nbsp;
               	  <input tabindex="15" type="radio" id="flat-radio-1" name="ipLimit" value="1">
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
           		 年龄区间：<input type="text" name= "ageMin" value="0">——<input type="text" name="ageMax" value="100">
               <br><br>  持续时间：<input type="text" name="time" value="">天
               </ul>
             <!--  <div class="span1" style="float:middle"><button  class="btn btn-primary" type= "button" id = "baocun" >保存</button></div>
               
            <input type="hidden" name="id" id ="getPara" value="<%=queid%>">
            <div class="modal-footer">
        <button  class="btn btn-primary" type="button" id="baocun" onclick="submit(2)">保存</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>        
      </div>
             </form>
            </div>            
            </dd>
      </div>      
    </div>
  </div>
</div>
-->
<!-- 
<script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  });
});
</script>
 -->
<%@include file = "footer.jsp" %>
</body>
</html>