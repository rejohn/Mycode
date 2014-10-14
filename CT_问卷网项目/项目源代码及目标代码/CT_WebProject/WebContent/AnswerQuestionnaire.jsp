<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@page import ="com.CoodeTeam.JavaBean.questionnaireCreate"%>
      <%@page import ="com.CoodeTeam.JavaBean.DynamicShow"%>
      <%@page import ="com.CoodeTeam.JavaBean.QuestionaireData"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/scojs.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/styles.css"/> 

   <script src="js/jquery-1.11.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.pin.min.js"></script>
   
  
 <% 
 
 String Qid =request.getParameter("id")+"";
 String username = (String)session.getAttribute("username");
questionnaireCreate temp=new questionnaireCreate(Qid);
DynamicShow a=new DynamicShow(temp);
String af="";
%>
<%
String str = request.getRemoteAddr()+""; 
//System.out.print(str);

QuestionaireData d = new QuestionaireData();
//out.println(Qid); out.println(str);
//out.println(d.checkip(str,Qid));
if(d.checkState(Qid)==1){

//out.println("该问卷已被关闭");
response.sendRedirect("index.jsp");
}
else if(d.checkip(str,Qid)==1){
//out.println("您已提交过答案");
response.sendRedirect("sameIP.jsp");
}
if (username == null){
	if(d.isAnonymous(Qid) == 0){
		response.sendRedirect("niming.jsp");
	}
	
}

%>

<script type="text/javascript">
function validate(){
	if(check()){document.getElementById('dsfsf').submit();}
	else {
		alert("您还有问题没填呢!");
	}
	  
}
function check(){
	
	var y=document.getElementsByTagName("input").length;
	var z;
	z=document.getElementsByTagName("input");
     var  checknum=0;
     var  radionum=0;
     var hui=true;
	for (var i=1;i<=y;i++)
	  {
	     var temp="";
	    temp="in"+i.toString();
	   
		var k=document.getElementById(temp);
	
		var type=$("#"+temp).attr("type");
		if (type=="text")
			{
			  var val=$("#"+temp).val();
			// alert(val);
			  if (val=='')
				  {
				 // alert("B"+"in"+(i)+"1"); 
				  $("#"+"in"+(i)+"L").css("display","");  hui=false;
				  }
			  else {
				  $("#"+"in"+(i)+"L").css("display","none");
			  }
			}
		else if(type=="radio")
		{      
			   if($("#"+"in"+i).attr("name")==$("#"+"in"+(i+1)).attr("name"))
		    	  {
				   if(($("#"+"in"+i).prop('checked'))){ radionum=1;}
				   else{
					   
				   }    
		    	  }
		     
		      else
		      if($("#"+"in"+i).attr("name")!=$("#"+"in"+(i+1)).attr("name"))
		    	  {
		    	     if(($("#"+"in"+i).prop('checked'))){   radionum=0; $("#"+"in"+(i)+"L").css("display","none"); }
		    	     else{
		    	    	 if(radionum==0) { 
			    	    	   // alert("R"+"in"+(i)+"1"); 
			    	    	     $("#"+"in"+(i)+"L").css("display","");
			    	    	    
			    	    	     hui=false;
			    	    	    
			    	     }
		    	    	 else {
		    	    		 $("#"+"in"+(i)+"L").css("display","none");
		    	    		 
		    	    	 }
		    	    	 radionum=0;
		    	     }
		    	  }
		 
		}
		else if (type=="checkbox")
		{     
			//var now=$("#"+"in"+i);
		     // var next=$("#"+"in"+(i+1));
		     // alert("fac44"+$("#"+"in"+i).prop('checked'));
		     var lk=0;
		     lk=(i+1);
		    // alert("C"+"in"+(i)+"Next"+lk+$("#"+"in"+lk).attr("class"));
		    // alert("C"+"in"+(i)+"NOw"+$("#"+"in"+(i)).attr("class"));
		      if($("#"+"in"+i).attr("class")==$("#"+"in"+(i+1)).attr("class"))
		    	  {
		    	     
		    	     if(($("#"+"in"+i).prop('checked'))){   checknum=1; }
		    	     else{	    
			    	     }
		    	  
		    	     }
		      else
		    	    if($("#"+"in"+i).attr("class")!=$("#"+"in"+(i+1)).attr("class"))
		    	  {  
		    	    if(($("#"+"in"+i).prop('checked'))){   checknum=0; $("#"+"in"+(i)+"L").css("display","none"); }
		    	     else{
		    	    	 if(checknum==0) { 
			    	    	   //  alert("fac4"+checknum); 
			    	    	 //  alert("C"+"in"+(i)+"1"); 
			    	    	     $("#"+"in"+(i)+"L").css("display","");
			    	    	    
			    	    	     hui=false;
			    	    	    
			    	     }
		    	    	 else {
		    	    		 $("#"+"in"+(i)+"L").css("display","none");
		    	    	 }
		    	    	 checknum=0;
		    	     }
		    	  
		    	  
		    	  
		    	  }
		}
	  }
	return hui;
	
}
</script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>回答问卷</title>
</head>
<body >


<div class="container clearfix">

    <div class="row">
        <div class="left-col">
              <h2></h2>
            <p class="lead"></p>
            <p id="link-one"></p>
            <p id="link-two"></p>
            <p id="link-three"></p>
            <p><%=a.showPage() %>
        
           </p>
            <p></p>
           
        </div>
        <div class="right-col">
           <div class="pin-wrapper" style="height: 122px;">
               
            </div>
             <div class="pin-wrapper" style="height: 122px;">
                <ul class="nav pinned" >
                    
                  <a id="scrollUp" href="#top" title="" style="position: fixed; z-index: 2147483647;outline : none;"></a>

                    
                </ul>
            </div>
        </div>
    </div>

</div>
</body>
</html>

