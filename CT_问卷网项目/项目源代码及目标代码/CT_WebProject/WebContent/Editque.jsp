<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import = "com.CoodeTeam.JavaBean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file= "head.jsp" %>
<title>CT问卷网</title>
<link href = "css/font-awesome.min.css" rel ="stylesheet" type="text/css">
<link href = "css/bootstrap.min.css" rel ="stylesheet">
<link href = "css/bootstrap-responsive.min.css" rel ="stylesheet" type="text/css">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript" language="javascript">

	function submit(){
	document.forms[0].submit()
	}

    var i = 1;//表示题号
   	var total =50;
    var cho = 53;
  
          
	function fun1(){  
	
	cho = 53;		
    var label = document.createElement("label");
    label.setAttribute("id", "label"+total);
    //label.setAttribute("class","label label-success");
    label.setAttribute("for","table"+total);
    label.innerHTML = "Question"+document.getElementsByTagName("table").length;
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
    
    //<button class="btn btn-primary small" onclick="fun2(this)"><i class ='icon-trash'></i></button></th>'
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
    input2.setAttribute("name", total+"-51");
    input2.setAttribute("style", "background:transparent;border:0");
    td.appendChild(input2);
    
    var td2 = document.createElement("td");
    //<button class="btn btn-primary" onclick="deleteli(this)">删除选项<tton>
    var button2 = document.createElement("button");
    button2.setAttribute("class", "btn btn-danger");
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
    input3.setAttribute("name", total+"-52");
    input3.setAttribute("style", "background:transparent;border:0");
    td3.appendChild(input3);
    
    var td4 = document.createElement("td");
    var button3 = document.createElement("button");
    button3.setAttribute("class", "btn btn-danger");
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
    
    window.scrollTo(0,99999);
    total++;
}
	
	function fun2(r){
		
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
        button3.setAttribute("class", "btn btn-danger");
        button3.setAttribute("onclick", "deleteli(this)");
        button3.setAttribute("type", "button");
        button3.innerHTML = "<i class ='icon-trash'></i>";
        td4.appendChild(button3);
       
        newTr.appendChild(td3);
        newTr.appendChild(td4);
	}
 	
	function fun3(){
		
		cho = 53;
		var label = document.createElement("label");
	    label.setAttribute("id", "label"+total);
	    //label.setAttribute("class","label label-success");
	    label.setAttribute("for","table"+total);
	    label.innerHTML = "Question"+document.getElementsByTagName("table").length;
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
	    input2.setAttribute("name", total+"-51");
	    input2.setAttribute("style", "background:transparent;border:0");
	    td.appendChild(input2);
	    
	    var td2 = document.createElement("td");
	    //<button class="btn btn-primary" onclick="deleteli(this)">删除选项<tton>
	    var button2 = document.createElement("button");
	    button2.setAttribute("class", "btn btn-danger");
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
	    input3.setAttribute("name",total+"-52");
	    input3.setAttribute("style", "background:transparent;border:0");
	    td3.appendChild(input3);
	    
	    var td4 = document.createElement("td");
	    var button3 = document.createElement("button");
	    button3.setAttribute("class", "btn btn-danger");
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
	    
	    window.scrollTo(0,99999);
}
	
	
	
	
		function fun4(){

			var label = document.createElement("label");
		    label.setAttribute("id", "label"+total);
		    //label.setAttribute("class","label label-success");
		    label.setAttribute("for","table"+total);
		    label.innerHTML = "Question"+document.getElementsByTagName("table").length;
		    // var text = document.createTextNode("Question"+i);
		    //  label.appendChild(text);
		    //<span class="label label-inverse">Inverse</span>
		      	
		    var table = document.createElement("table");
		    table.setAttribute("id","table"+total);
		    table.setAttribute("class","table table-bordered");
		    table.setAttribute("value", total);
		    
		    var thead = document.createElement("thead");
		    var tr = document.createElement("tr");
		    tr.setAttribute("class", "danger");
		    var th1 = document.createElement("th");
		    var input = document.createElement("textarea");
		    input.setAttribute("placeholder",  "请输入判断题");
		    input.setAttribute("class","span8");
		    input.setAttribute("rows","3");
		    input.setAttribute("name","C"+total)
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

		    
		    
		    window.scrollTo(0,99999);
		}
		
		
		function fun5(){

				
			var label = document.createElement("label");
		    label.setAttribute("id", "label"+total);
		    //label.setAttribute("class","label label-success");
		    label.setAttribute("for","table"+total);
		    label.innerHTML = "Question"+document.getElementsByTagName("table").length;
		    // var text = document.createTextNode("Question"+i);
		    //  label.appendChild(text);
		    //<span class="label label-inverse">Inverse</span>
		      	
		    var table = document.createElement("table");
		    table.setAttribute("id","table"+total);
		    table.setAttribute("class","table table-bordered");
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

		    
		    window.scrollTo(0,99999);
		}
</script> 
</head>
<body>
<%@include file= "header2.jsp" %><br><br><br>

<% 
int queid = Integer.parseInt(request.getParameter("qid")); %>

<div class="container" >
<form id = "content" action="UserServlet.do?method=updateData" method="post">
<%	
	EditQue d = new EditQue();
	out.print(d.show(queid));
	
%>
<input type = "hidden" name = "qid" value = "<%= queid %>"></input>
<table></table>
</form>
</div>


<br><br><br><br><br>


<div class = "control row"  >
<div class="span1" style="float:left" ><button  class="btn btn-success " onclick="fun1()" >单选</button></div>
<div class="span1" style="float:left"><button  class="btn btn-warning" onclick="fun3()" >多选</button></div>
<div class="span1" style="float:left"><button  class="btn btn-danger" onclick="fun4()" >判断</button></div>
<div class="span1" style="float:left"><button  class="btn" onclick="fun5()" >问答</button></div>
<div class="span1" style="float:left"><button  class="btn btn-primary" type= "button" id = "baocun" onClick="submit()">保存</button></div>
</div>


<%@include file = "footer.jsp" %>
</body>
</html>