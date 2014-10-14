<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.CoodeTeam.JavaBean.*" import="java.util.Date" 
    import="java.util.Calendar" import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file= "head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>问卷链接</title>
<script src="js/jquery-1.11.1.min.js"></script>
<%@include file= "header2.jsp" %>
</head>

<body>
<%
String idQuestionare = (String) request.getParameter("id");
String isAnonymous = (String) request.getParameter("anony");
String ageMin = (String) request.getParameter("ageMin");
String ageMax =(String) request.getParameter("ageMax");
String sexLimit = (String) request.getParameter("sex");
String ipLimit = (String) request.getParameter("ipLimit");
//System.out.println(ipLimit);
%>
<% 
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

Date startTime = new Date();//得到当前系统时间

String str_date1 = formatter.format(startTime); //将日期时间格式化 
//String str_date2 = startTime.toString(); //将Date型日期时间转换成字符串形式 
String time=(String)request.getParameter("time");
//out.println("aa");
int day =Integer.parseInt(time);


Calendar ca = Calendar.getInstance();
ca.setTime(startTime);
ca.add(Calendar.DATE, day);
startTime=ca.getTime();
String str_date3 = formatter.format(startTime);

QuestionaireData a =new QuestionaireData();
a.submit(isAnonymous, ageMin, ageMax, sexLimit,str_date1, str_date3, ipLimit, idQuestionare);

%>
<%
	String id = (String) request.getParameter("id");
	String url = "http://192.168.17.212:8080/CT_WebProject/"+id+".html";
	// String url1 = "http://localhost:8080/CT_WebProject/AnswerQuestionnaire.jsp?id="+id;
 %> 
               <br/><br/><br/> 
              <div class="caption" style="margin:50px auto 50px;width:834px;">
 <h2 style="text-rendering: optimizelegibility;font-family:黑体">问卷访问链接</h2>
 <br/>
 <p>可以直接把访问问卷访问链接，或者聊天工具中直接发给被访人</p>
 </div>
 <div class="copylink" style="margin:30px auto 30px;width:834px;border:1px #1C6b85 solid;border-radius:2px;padding:15px 20px 16px 40px;
background:#efefef;position:relative;color:#828282;">
 <span><a href="<%=url %>"><%=url %></a></span> 
 <div class="span1" style="float:right"></div>
 </div>
 <div class="bdsharebuttonbox" style = "margin-left:260px;"  style="display:none;">
<a class="bds_more" href="#" data-cmd="more"></a>
<a title="分享到新浪微博" class="bds_tsina" href="#" data-cmd="tsina"></a>
<a title="分享到腾讯微博" class="bds_tqq" href="#" data-cmd="tqq"></a>
<a title="分享到人人网" class="bds_renren" href="#" data-cmd="renren"></a>
<a title="分享到搜狐微博" class="bds_tsohu" href="#" data-cmd="tsohu"></a>
<a title="分享到百度空间" class="bds_hi" href="#" data-cmd="hi"></a></div>
<script>
window._bd_share_config={"common":{"bdSnsKey":

{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":

["tsina","tqq","renren","tsohu","hi"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":

["tsina","tqq","renren","tsohu","hi"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement

('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
 
<button style="margin-left:260px;margin-top:30px;" class ="btn btn-large btn-primary" onclick="location.href='MyQO.jsp'">返回已发布的问卷</button> 				  
 <%@include file = "footer.jsp" %>
</body>
</html>