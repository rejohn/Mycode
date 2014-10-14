<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="com.CoodeTeam.JavaBean.Analasis"
     import="com.CoodeTeam.JavaBean.questionnaireCreate"
     import="com.CoodeTeam.JavaBean.QuestionItem"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>统计</title>

    <%@include file="head.jsp" %>
    
    
	<script src="js/jquery-1.11.1.min.js"></script>
	<script>

	
	
	$(document).ready(function(){
		
		
		<%
		int qid= Integer.parseInt(request.getParameter("qid"));
    	Analasis ana =new Analasis();
    	int quenum= ana.getQueNumber(qid);
    	
    	int ansnum = ana.getansnum(qid);
    	
    	for(int i = 1;i<=quenum;i++)
    	{
    		
    		
    		String type = ana.getType(qid,i);
    		
    		if(type.equals("blank")){
    			
    		}else if (type.equals("judge")){
    			int choNum=2;
    			int peoNumber=0;
    			int[] resultjudge   =  ana.getOneResult(qid,i,choNum);
    			
    			%>
    			var ratio = new Array();
    			var barData = new Array();
    			var pieData = new Array();
    			var label =  ["true","false"];
    			var color =["#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360"];
    			
    			<%
    			for(int j=0;j<resultjudge.length-1;j++){
    				
    				peoNumber+=resultjudge[j];
    				%>
    					ratio[<%=j%>]=<%=resultjudge[j]%>
    					
    					
    				<%
    				
    			}
    			%>
    				barData= {
    						labels : label,
    						datasets : [
    							
    							{
    								fillColor : "rgba(151,187,205,0.5)",
    								strokeColor : "rgba(151,187,205,0.8)",
    								highlightFill : "rgba(151,187,205,0.75)",
    								highlightStroke : "rgba(151,187,205,1)",
    								data : ratio
    							}
    						]

    					}	;
    				
    				var aaa = ratio;
    				for (var k = 0;k < <%=resultjudge.length-1%> ;k++ ){
    				
    					pieData[k]={
								value: aaa[k],
								color: color[k % 5] ,
								highlight: "#FF5A5E",
								label: label[k]
							};
    				}
    				
    				createBody(ratio,barData,pieData,<%=i%>,<%= ansnum%>);
    				
    			
    			<%
    		}else if (type.equals("single")){
    			int choNum = ana.getchoNumber();
    			int peoNumber=0;
    		     int[]resultsingle   =  ana.getOneResult(qid,i,choNum);
    		     
    		     %>
     			var ratio = new Array();
     			var barData = new Array();
     			var label = new Array();
     			var pieData = new Array();
     			var color =["#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360"];
     			<%
    			for(int j=0;j<resultsingle.length-1;j++){
    				//System.out.println("single"+resultsingle[j]);
    				peoNumber +=resultsingle[j];
    				//peoNumber +=resultsingle[j];
    				
    				%>
    				
					ratio[<%=j%>] = <%=resultsingle[j]%>;
					label[<%=j%>] = "选项<%=j+1%>";
					
					
				<%
    				
    				
    			}
     			%>
				barData= {
						labels : label,
						datasets : [
							
							{
								fillColor : "rgba(151,187,205,0.5)",
								strokeColor : "rgba(151,187,205,0.8)",
								highlightFill : "rgba(151,187,205,0.75)",
								highlightStroke : "rgba(151,187,205,1)",
								data : ratio
							}
						]

					}	;
				
				for (var k = 1;k < <%=resultsingle.length%> ;k++ ){
					pieData[k-1]={
							value: ratio[k-1],
							color: color[(k-1) % 5] ,
							highlight: "#FF5A5E",
							label: label[k-1]
						};
				}
				
				createBody(ratio,barData,pieData,<%=i%>,<%= ansnum%>);
	
			<%
     			
     			
    		}else if (type.equals("mutiple")){
    			
    			int choNum = ana.getchoNumber();
    			int peoNumber=0;
    			%>
    			var ratio = new Array();
    			var barData = new Array();
    			var label = new Array();
    			var pieData= new Array();
    			var color =["#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360"];
    			<%
    			int[] resultmutiple   =  ana.getOneResult(qid,i,choNum);
    			for(int j=0;j<resultmutiple.length-1;j++){
    				//System.out.println("mutiple"+resultmutiple[j]);
    				peoNumber +=resultmutiple[j];
    				
    				%>
					ratio[<%=j%>] = <%=resultmutiple[j]%>;
					
					
				
					label[<%=j%>] = "选项<%=j+1%>";
				<%
    				
				
    			}
    			%>
				barData= {
						labels : label,
						datasets : [
							
							{
								fillColor : "rgba(151,187,205,0.5)",
								strokeColor : "rgba(151,187,205,0.8)",
								highlightFill : "rgba(151,187,205,0.75)",
								highlightStroke : "rgba(151,187,205,1)",
								data : ratio
							}
						]

					}	;
				for (var k = 1;k < <%=resultmutiple.length%> ;k++ ){
					pieData[k-1]={
							value: ratio[k-1],
							color: color[(k-1) % 5] ,
							highlight: "#FF5A5E",
							label: label[k-1]
						};
				}
		
				createBody(ratio,barData,pieData,<%=i%>,<%= ansnum%>);
				
	
			<%
    			
    			
    		}
    		%>
    		
    		<%
    	}//每个问题循环
    	
    	
    	
    	
    	
		%>
	
		
	
		
		
	});
	
	function createBody(ratio,barData,pieData,id,ansnum){
		var row1 = document.createElement("div");
		row1.setAttribute("class","row");
		//row1.setAttribute("style","height:600px" );
		
		var span12 = document.createElement("div");
		span12.setAttribute("class","span12");
		
		var row2 = document.createElement("div");
		row2.setAttribute("class","row");
		
		var span2 = document.createElement("div");
		span2.setAttribute("class","span2");
		
		var btn_g = document.createElement("div");
		btn_g.setAttribute("class","btn-group");
		
		var but = document.createElement("button");
		but.setAttribute("data-toggle","dropdown");
		but.setAttribute("class","btn dropdown-toggle");
		but.setAttribute("id","btype"+id);
		but.innerHTML = '表&nbsp;&nbsp;&nbsp;&nbsp;格<span class="caret"></span>';
		
		var ul = document.createElement("ul");
		ul.setAttribute("class","dropdown-menu");
		
		
		var li1 = document.createElement("li");
		li1.setAttribute("onclick","changetoTable("+id+")");
		li1.innerHTML = '<a>表&nbsp;&nbsp;&nbsp;&nbsp;格</a>';
		
		var li2 = document.createElement("li");
		li2.setAttribute("onclick","changetoBar("+id+")");
		li2.innerHTML = '<a>柱状图</a>';
		
		var li3 = document.createElement("li");
		li3.setAttribute("onclick","changetoPie("+id+")");
		li3.innerHTML = '<a>饼&nbsp;&nbsp;&nbsp;&nbsp;图</a>';
	
		ul.appendChild(li1);
		ul.appendChild(li2);
		ul.appendChild(li3);
		
		btn_g.appendChild(but);
		btn_g.appendChild(ul);
		
		span2.appendChild(btn_g);
		
		var span6 = document.createElement("div");
		span6.setAttribute("class","span6");
		span6.setAttribute("style","height:244px");
		span6.setAttribute("id","content"+id);
		
		row2.appendChild(span2);
		row2.appendChild(span6);
		
		span12.appendChild(row2);
		row1.appendChild(span12);
		
		
		
		var all  = document.getElementById("all");
		var h1 = document.createElement("h3");
		h1.setAttribute("class","page-header");
		h1.innerHTML = "Question"+id;
		all.appendChild(h1);
		all.appendChild(row1);
	
		/**
		//
		var table= document.createElement("table");
		table.setAttribute("class","table table-bordered table-striped");
		table.setAttribute("id","table"+id);
		var thead=document.createElement("thead");
		var tr1=document.createElement("tr");
		var th1=document.createElement("th");
		var th2=document.createElement("th");
		th1.innerText = "答案选项";
		th2.innerText = "比例";
		tr1.appendChild(th1);
		tr1.appendChild(th2);
		thead.appendChild(tr1);
		table.appendChild(thead);
		var tbody=document.createElement("tbody");
		for (var i=1;i<=ratio.length;i++){
			
			var tr=document.createElement("tr");
			var td1=document.createElement("td");
			var td2=document.createElement("td");
			td1.innerText = "选项"+i;
			td2.innerText =  ratio[i-1];
			tr.appendChild(td1);
			tr.appendChild(td2);
			tbody.appendChild(tr);
			
		}
		var tr2 =document.createElement("tr");
		var td = document.createElement("td");
		td.setAttribute("colspan","2");
		td.innerText ="受访人数"+ 4;
		tr2.appendChild(td);
		tbody.appendChild(tr2);
		table.appendChild(tbody);
		span6.appendChild(table);
		
		
		
		
		
		//
		var canvas2= document.createElement("canvas");
			canvas2.setAttribute("id","canvas2"+id);
			canvas2.width=570;
			canvas2.height=244;
			span6.appendChild(canvas2);
		    var ctx2 = canvas2.getContext("2d"); 
			window.myBar =new Chart(ctx2).Bar(barData, {
					responsive:true
			});
		//
		var canvas3 = document.createElement("canvas");
			canvas3.setAttribute("id","canvas3"+id);
			canvas3.width=570;
			canvas3.height=244;
			span6.appendChild(canvas3);
	        var ctx3 = canvas3.getContext("2d"); 
	        window.myPie = new Chart(ctx3).Pie(pieData);*/
		//
       
		//
		createTable(ratio,id,ansnum);
		createBar(barData,id);
		createPie(pieData,id);
		$("#canvas2"+id).hide();
		$("#canvas3"+id).hide();
		
	}
	
	
	
	function changetoTable(id){
		var btype = document.getElementById("btype"+id);
		btype.innerHTML = "表&nbsp;&nbsp;&nbsp;&nbsp;格"+"<span class='caret'></span>";
		$("#canvas3"+id).hide();
		$("#canvas2"+id).hide();
		$("#table"+id).show();
		

	}
	function changetoBar(id){
		var btype = document.getElementById("btype"+id);
		btype.innerHTML = "柱状图"+"<span class='caret'></span>";
		$("#table"+id).hide();
		$("#canvas3"+id).hide();
		$("#canvas2"+id).show();
		
		
	}

	function changetoPie(id){
		var btype = document.getElementById("btype"+id);
		btype.innerHTML = "饼&nbsp;&nbsp;&nbsp;&nbsp;图"+"<span class='caret'></span>";
		$("#table"+id).hide();
		$("#canvas2"+id).hide();
		$("#canvas3"+id).show();
		
	}
	
	
		function createTable(ratio,id,ansnum){
			
			
			
			var content = document.getElementById("content"+id);
		
			
			
			var table= document.createElement("table");
			table.setAttribute("class","table table-bordered table-striped");
			table.setAttribute("id","table"+id);
			
			var thead=document.createElement("thead");
			var tr1=document.createElement("tr");
			var th1=document.createElement("th");
			var th2=document.createElement("th");
			th1.innerText = "答案选项";
			th2.innerText = "人数";
			tr1.appendChild(th1);
			tr1.appendChild(th2);
			thead.appendChild(tr1);
			table.appendChild(thead);
			var tbody=document.createElement("tbody");
			for (var i=1;i<=ratio.length;i++){
				
				var tr=document.createElement("tr");
				var td1=document.createElement("td");
				var td2=document.createElement("td");
				td1.innerText = "选项"+i;
				td2.innerText =  ratio[i-1];
				tr.appendChild(td1);
				tr.appendChild(td2);
				tbody.appendChild(tr);
				
			}
			var tr2 =document.createElement("tr");
			var td = document.createElement("td");
			td.setAttribute("colspan","2");
			td.innerText ="受访人数：    "+ ansnum;
			tr2.appendChild(td);
			tbody.appendChild(tr2);
			table.appendChild(tbody);
			
			content.appendChild(table);
		}
		
		function createBar(barChartData,id){
			var content = document.getElementById("content"+id);
			
			var canvas2= document.createElement("canvas");
			canvas2.setAttribute("id","canvas2"+id);
			canvas2.width=570;
			canvas2.height=244;
			content.appendChild(canvas2);
		    var ctx2 = canvas2.getContext("2d"); 
			window.myBar =new Chart(ctx2).Bar(barChartData, {
					responsive:true
			});
			
			
		}
		
		function createPie(pieData,id){
			var content = document.getElementById("content"+id);
			var canvas3 = document.createElement("canvas");
			canvas3.setAttribute("id","canvas3"+id);
			canvas3.width=570;
			canvas3.height=244;
			content.appendChild(canvas3);
	        var ctx3 = canvas3.getContext("2d"); 
	        window.myPie = new Chart(ctx3).Pie(pieData);
	        
	       
		}
		function submit(){
			
		}
		
		
	</script>



     </head>

  <body>
    <%@ include file="header.jsp" %>
	<script src="js/Chart.js"></script>
	
	<br><br><br><br>
<div class="container" id = "all">
	
</div>
<div class = "controls-row" style="margin-left:8%;margin-bottom:2%;">

<form action="UserServlet.do?method=publishAna&qid=<%=qid%>" method="post">
<button class="btn btn-primary" type="button" onclick="javascript:history.back(-1);">&nbsp;&nbsp;返&nbsp;回&nbsp;&nbsp;</button>

</form>
</div>

    <%@ include file="footer.jsp" %>
	
  </body>
</html>
