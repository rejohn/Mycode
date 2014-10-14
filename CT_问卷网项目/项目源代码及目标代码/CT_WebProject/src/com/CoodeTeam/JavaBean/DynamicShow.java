package com.CoodeTeam.JavaBean;
import java.util.ArrayList;

import  com.CoodeTeam.JavaBean.questionnaireCreate;

public class DynamicShow {
	 public String sud="";
	questionnaireCreate temp =null;
	String  t="";
	int number=0;
	int s=0;
	int b=0;
	int m=0;
	int n=0;
	String divs="s";
	String divm="m";
	String divj="j";
	int input=0;
	String Alpha[]={"A.","B.","C.","D.","E.","F.","G.","H.","I."};
	public DynamicShow(questionnaireCreate temp) {
		super();
		this.temp = temp;
		
	}
	public String show()
	{
           return this.sud;
	}
	public String showPage()  //显示好看的可填写的表单
	{  
		 
		   
		t+="<div style='text-align:center;background-color:rgb( 155, 155, 242 );'><span ><lable class ='dfg' margin-top= 25px !important class='dfg' align ="+"center"+">"+temp.title+"</lable></span></div>";
		t+="<form id=dsfsf  class =form-horizontal  align =center action="+"AnswerResponse.jsp?qid="+temp.idQuestionare+" method="+"POST"+">";
		for(int i=0; i<temp.QuestionsItems.size();i++)
		{  QuestionItem  tempquestion= (QuestionItem)temp.QuestionsItems.get(i);
		    if(tempquestion.type.equals("single"))
		    {   s++;
		        n++;
		        String forS=AnswerString(tempquestion);
		        t+="<table align ='center' ><tr></tr><td><br><img src=images/wj1.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px  id ='tb"+tempquestion.order+"'  align =center><tr><td>"+(number+1)+"."+tempquestion.question+"</td><td><lable class='erro' id=in"+input+"L  for=in"+input+" style='display:none; font-color:red;'>该题你没填</lable></td></tr>";
		    	//t+="<tr>";
		    	t+=forS;
		        t+="</table>";
		    	number++;
		    	divs+=tempquestion.answerItems.size()+"z";
		    	
		    }else if(tempquestion.type.equals("mutiple"))
		    {   n++;
		    	m++;
		    	 String forS=AnswerString(tempquestion);
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj2.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td><td><lable class='erro' id=in"+input+"L  for=in"+input+" style='display:none; font-color:red;'>该题你没填</lable></td></tr>";
		    	//t+="<tr>";
		    	t+=forS;
		    	t+="</table>";
		    	number++;
		    	divm+=tempquestion.answerItems.size()+"z";
		    }else if(tempquestion.type.equals("blank"))
		    {   n++; 
		    	b++;
		    	input++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj4.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td><td><lable class='erro' id=in"+input+"L  for=in"+input+" style='display:none; font-color:red;'>该题你没填</lable></td></tr>";
		    	 number++;
		    	 divj+=tempquestion.answerItems.size()+"z";
		    	 t+="<tr><td><label><input id =in"+input+" name ='"+tempquestion.order+"b'   type=text ></label></td></tr>";
		    	 t+="</table>";
		    }
		    else if(tempquestion.type.equals("judge"))
		    {   n++; 
		    	b++;
		    	input++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj3.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td><td><lable class='erro' id=in"+(input)+"L  for=in"+input+" style='display:none; font-color:red;'>该题你没填</lable></td></tr>";
		    	 number++;
		    	 divj+=tempquestion.answerItems.size()+"z";
		    	 t+="<tr><td><input id =in"+input+" name ='"+tempquestion.order+"j' value='"+tempquestion.order+"jZf0' type=radio  checked =unchecked name=jj"+tempquestion.order+" > 正确</td></tr>";
		    	 input++;
		    	 t+="<tr><td><input id =in"+(input)+" name ='"+tempquestion.order+"j' value='"+tempquestion.order+"jZf1' type=radio  checked =unchecked name=jj"+tempquestion.order+" > 错误</td></tr>";
		    	 t+="</table>";
		    }
		
		}
		t+="</br></br><div align =center ><a class='btn btn-primary' onclick='javascript:validate();'  />提&nbsp;交 </a></div>";
		t+="</form>";
		divs+="ps";
		divm+="pm";
		divj+="pj";
		sud="T"+n+"S"+s+"B"+b+"M"+m+divs+divm+divj;
		//t.replaceAll("id =fghjdsd","id ="+sud);
		
		//t.replaceFirst("fghjdsd",);
		//t+="<input align = "+"center"+"  type=submit value=提交>";
		
		return t;
	}
	public String AnswerString (QuestionItem  temp1)
	{   String a="";
	
		if(!temp1.AnswerString.equals(""))
		{  
			if(temp1.type.equals("single"))
			{
				//a+="<tr>";
			    //a+="";
			for(int i=0;i<temp1.answerItems.size();i++)
			{    input++;
				a+="<tr><td> <input id =in"+input+" value="+temp1.order+"sZf"+i+"  type=radio  name="+"ss"+temp1.order+">";
				a+=Alpha[i]+(String)temp1.answerItems.get(i).replace(" ", "")+"</td></tr>";
			}
			   //a+=" ";
			}
			else if(temp1.type.equals("mutiple"))
			{
				//a+="<td>";
			  
			for(int i=0;i<temp1.answerItems.size();i++)
			{   input++;
				a+="<tr><td><input id=in"+input+"  name ="+temp1.order+"mZf"+i+"  type=checkbox  class=group"+temp1.order+">";
				a+=Alpha[i]+(String)temp1.answerItems.get(i).replace(" ", "")+"</td></tr>";
			}
			    // a+=" </div>        </div></td>";
			}
			if(temp1.type.equals("blank"))
			{
				//a+="<td>";
			  //  a+="<div class="+"control-group"+"><label class="+"control-label"+"></label><div class="+"controls"+"><!-- Inline Radios -->";
			for(int i=0;i<temp1.answerItems.size();i++)
			{
				a+="<tr><td><input  type=checkbox   name=group>";
				a+=(String)temp1.answerItems.get(i)+"</label>";
			}
			    // a+=" </div>        </div></td>";
			}
			
			return a;
				
			}
		else{ 	return a;}
	
		}
	public String GetMyAnswer( QuestionItem temp1 ,String UserID)
	{
		 String a="";
			
			  
				if(temp1.type.equals("single"))
				{
					for(int i=0;i<temp1.answerItems.size();i++)
					{
						//a+="<tr><td> <input value="+temp1.order+"sZf"+i+"  type=radio  checked =unchecked name="+"ss"+">";
						a+="<tr><td>"+Alpha[i]+(String)temp1.answerItems.get(i).replace(" ", "")+"</td></tr>";
					}
					 Users tempU=new Users(UserID);
					 Answers TempA=new Answers(this.temp.idQuestionare);
					 ArrayList<String> Ansa;
					 tempU.SetMyAnswerArray(TempA, this.temp.idQuestionare);
					 Ansa=  tempU.getAnswer(this.temp.idQuestionare, Integer.parseInt(temp1.order));
					 a+="<tr><td><lable class=erro>我的答案：";
				for(int i=0;i<Ansa.size();i++)
				{
					
					a+=Ansa.get(i)+".";
				}
				   
				    a+=" </lable></td></tr>";
				}
				else if(temp1.type.equals("mutiple"))
				{   
					for(int i=0;i<temp1.answerItems.size();i++)
					{
						//a+="<tr><td><input name ="+temp1.order+"mZf"+i+" type=checkbox   name=group>";
						a+="<tr><td>"+Alpha[i]+(String)temp1.answerItems.get(i).replace(" ", "")+"</td></tr>";
					}
					 Users tempU=new Users(UserID);
					 Answers TempA=new Answers(this.temp.idQuestionare);
					 ArrayList<String> Ansa;
					 tempU.SetMyAnswerArray(TempA, this.temp.idQuestionare);
					 Ansa=  tempU.getAnswer(this.temp.idQuestionare, Integer.parseInt(temp1.order));
					 
					 a+="<tr><td><lable class=erro>我的答案：";
						for(int i=0;i<Ansa.size();i++)
						{
							
							a+=Ansa.get(i)+"&nbsp;,";
						}
						   
						    a+=" </lable></td></tr>";
				}
				else
				if(temp1.type.equals("blank"))
				{
					 Users tempU=new Users(UserID);
					 Answers TempA=new Answers(this.temp.idQuestionare);
					 ArrayList<String> Ansa;
					 tempU.SetMyAnswerArray(TempA, this.temp.idQuestionare);
					 Ansa=  tempU.getAnswer(this.temp.idQuestionare, Integer.parseInt(temp1.order));
					 
				for(int i=0;i<Ansa.size();i++)
				{
					a+="<tr><td><lable class=erro>";
					a+="我的答案："+Ansa.get(i)+"</lable></td></tr>";
				}
				}else
					if(temp1.type.equals("judge"))
					{    	a+="<tr><td>正确</td></tr>";
					         a+="<tr><td>错误</td></tr>";
						 Users tempU=new Users(UserID);
						 Answers TempA=new Answers(this.temp.idQuestionare);
						 ArrayList<String> Ansa;
						 tempU.SetMyAnswerArray(TempA, this.temp.idQuestionare);
						 Ansa=  tempU.getAnswer(this.temp.idQuestionare, Integer.parseInt(temp1.order));
						 
					for(int i=0;i<Ansa.size();i++)
					{
						a+="<tr><td><lable class=erro>";
						a+="我的答案："+Ansa.get(i)+"</lable></td></tr>";
					}
					}
				return a;
					
				}
		
	
	public String showMyAnswerPage(String Usrid  )
	{  
		
		t+="<div style='text-align:center;background-color:rgb( 155, 155, 242 );'><span ><lable class ='dfg' margin-top= 25px !important class='dfg' align ="+"center"+">"+temp.title+"</lable></span></div>";
		t+="<form class =form-horizontal  align =center >";
		for(int i=0; i<temp.QuestionsItems.size();i++)
		{  QuestionItem  tempquestion= (QuestionItem)temp.QuestionsItems.get(i);
		    if(tempquestion.type.equals("single"))
		    {   s++;
		      
		        t+="<table align ='center' ><tr></tr><td><br><img src=images/wj1.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px  id ='tb"+tempquestion.order+"'  align =center><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	//t+="<tr>";
		    	t+=GetMyAnswer(tempquestion,Usrid);
		        t+="</table>";
		    	number++;
		    	divs+=tempquestion.answerItems.size()+"z";
		    	
		    }else if(tempquestion.type.equals("mutiple"))
		    {   n++;
		    	m++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj2.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	//t+="<tr>";
		    	t+=GetMyAnswer(tempquestion ,Usrid);
		    	t+="</table>";
		    	number++;
		    	divm+=tempquestion.answerItems.size()+"z";
		    }else if(tempquestion.type.equals("blank"))
		    {   n++; 
		    	b++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj4.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	 number++;
		    	
		    	 
		         t+=GetMyAnswer(tempquestion ,Usrid);
		    	 t+="</table>";
		    }
		    else if(tempquestion.type.equals("judge"))
		    {   n++; 
		    	b++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj3.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	 number++;
		    	 divj+=tempquestion.answerItems.size()+"z";
		    	 t+=GetMyAnswer(tempquestion ,Usrid);
		    	 t+="</table>";
		    }
		
		}
		
		t+="</form>";
		divs+="ps";
		divm+="pm";
		divj+="pj";
		sud="T"+n+"S"+s+"B"+b+"M"+m+divs+divm+divj;
		//t.replaceAll("id =fghjdsd","id ="+sud);
		
		//t.replaceFirst("fghjdsd",);
		//t+="<input align = "+"center"+"  type=submit value=提交>";
		
		return t;
	}
	
	
	
	public String GetMyAnswer1( QuestionItem temp1 )
	{
		 String a="";
			
			  
				if(temp1.type.equals("single"))
				{
					for(int i=0;i<temp1.answerItems.size();i++)
					{
						//a+="<tr><td> <input value="+temp1.order+"sZf"+i+"  type=radio  checked =unchecked name="+"ss"+">";
						a+="<tr><td>"+Alpha[i]+(String)temp1.answerItems.get(i).replace(" ", "")+"</td></tr>";
					}
				
				}
				else if(temp1.type.equals("mutiple"))
				{   
					for(int i=0;i<temp1.answerItems.size();i++)
					{
						//a+="<tr><td><input name ="+temp1.order+"mZf"+i+" type=checkbox   name=group>";
						a+="<tr><td>"+Alpha[i]+(String)temp1.answerItems.get(i).replace(" ", "")+"</td></tr>";
					}
					
				}
				else
				if(temp1.type.equals("blank"))
				{
					
				}else
					if(temp1.type.equals("judge"))
					{    	a+="<tr><td>正确</td></tr>";
					         a+="<tr><td>错误</td></tr>";
						
					}
				return a;
					
				}
		
	
	public String showQuestionnairePage( )
	{  
		
		t+="<div style='text-align:center;background-color:rgb( 155, 155, 242 );'><span ><lable class ='dfg' margin-top= 25px !important class='dfg' align ="+"center"+">"+temp.title+"</lable></span></div>";
		t+="<form class =form-horizontal  align =center >";
		for(int i=0; i<temp.QuestionsItems.size();i++)
		{  QuestionItem  tempquestion= (QuestionItem)temp.QuestionsItems.get(i);
		    if(tempquestion.type.equals("single"))
		    {   s++;
		      
		        t+="<table align ='center' ><tr></tr><td><br><img src=images/wj1.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px  id ='tb"+tempquestion.order+"'  align =center><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	//t+="<tr>";
		    	t+=GetMyAnswer1(tempquestion);
		        t+="</table>";
		    	number++;
		    	divs+=tempquestion.answerItems.size()+"z";
		    	
		    }else if(tempquestion.type.equals("mutiple"))
		    {   n++;
		    	m++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj2.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	//t+="<tr>";
		    	t+=GetMyAnswer1(tempquestion );
		    	t+="</table>";
		    	number++;
		    	divm+=tempquestion.answerItems.size()+"z";
		    }else if(tempquestion.type.equals("blank"))
		    {   n++; 
		    	b++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj4.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	 number++;
		    	
		    	 
		         t+=GetMyAnswer1(tempquestion);
		    	 t+="</table>";
		    }
		    else if(tempquestion.type.equals("judge"))
		    {   n++; 
		    	b++;
		    	t+="<table align ='center' ><tr></tr><td><br><img src=images/wj3.png height=80px width=800px > </td></tr></table>";
		    	t+="<table width=800px id ='tb"+tempquestion.order+"'  align =center ><tr><td>"+(number+1)+"."+tempquestion.question+"</td></tr>";
		    	 number++;
		    	 divj+=tempquestion.answerItems.size()+"z";
		    	 t+=GetMyAnswer1(tempquestion );
		    	 t+="</table>";
		    }
		
		}
		
		t+="</form>";
		divs+="ps";
		divm+="pm";
		divj+="pj";
		sud="T"+n+"S"+s+"B"+b+"M"+m+divs+divm+divj;
		//t.replaceAll("id =fghjdsd","id ="+sud);
		
		//t.replaceFirst("fghjdsd",);
		//t+="<input align = "+"center"+"  type=submit value=提交>";
		
		return t;
	}
		
	}
	


