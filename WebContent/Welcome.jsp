<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:lightgray">

	<table>
		<tr>
			<td>
				<div class="contentcontainer med left" style="margin-left:60px; margin-top:-25px">
					<img src="Images/ShareIcon.jpg" height="90px">								
				</div>
			</td>
			<td>
				<br>
				
				<div class="contentcontainer med left" style="margin-left:30px;margin-top:-15px">
					<img src="Images/Welcome.jpg" width=170px>
					<h3>Problem Shared Is A Problem Solved!</h3>
				</div>				
			</td>
			<td>
				<%
					HttpSession s=request.getSession(false);
					String s1=(String) s.getAttribute("name");	
					
					if(s1.equals(null))
					{						
						RequestDispatcher rs=request.getRequestDispatcher("Home.jsp");
						rs.include(request, response);
						JOptionPane.showMessageDialog(null, "Login First");
					}
					else
					{
				%>
				<div class="contentcontainer med left" style="margin-left:550px; margin-top:-35px">
					<h4>						
						Welcome <%=s1 %>&nbsp;		
						<img src="Images/User.jpg">				
					</h4> <br>
				</div>
				<%
					}
				%>
				<div class="contentcontainer med left" style="margin-left:690px; margin-top:-25px">				
					<a href="Logout"> <img src="Images/Logout.jpg" height= 35px> </a>
				</div>				
			</td>			
		</tr>
	</table>
	<table>
		<tr>
			<td>	
				<div style="margin-top:-15px; margin-left:30px;">		
					<img src="Images/Line.jpg" width=1280px height="5px">
				</div>
			</td>		
		</tr>
	</table>
	
	<br>
	<form name="myForm3" action="AskQue" onsubmit="return validateForm();" method="post">
	<div class="contentcontainer med left" style="margin-left:230px;">
		<textarea rows="3" cols="70" name="que" placeholder="Ask a question."></textarea> <br><br>
		<textarea rows="8" cols="100" name="que_details" placeholder="Provide question details here."></textarea> <br>	
		<div style="margin-left:653px;">
			<input type="submit" name="ask" value="Ask..!" style="height:30px; width:70px;">
		</div>
	</div>
	
	<script>
       	function validateForm()
   		{
			var a=document.forms["myForm3"]["que"].value;
			var b=document.forms["myForm3"]["que_details"].value;
			
			if(a==null || a=="" && b==null || b=="")
			{
				alert("Ask The Question First");
			    return false;
			}                    
			else if(a==null || a=="")
			{                    
			    alert("Enter question.");
			    return false;                        
			}								
			else if(b==null || b=="")
			{                    
			    alert("Provide question details.");
			    return false;                        
			}
   		}
	</script>	
	</form>
	<br>
	
	<table>
		<tr>		
			<td>
				<div style="margin-left:230px">	
					<a id="sec1" href="javascript:void(0);" style="color: green;"> All Question </a>					
				</div>
			</td>
			<td>
				<h4> | </h4>
			</td>
			<td>
				<a id="sec2" href="MyQuestion.jsp" style="color: blue;"> My Question </a>
			</td>
		</tr>
	</table>

	
	<div class="contentcontainer med left" style="margin-left:230px; margin-top:-20px;">
	<%	
		
		try 
		{
		    Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ashitosh","root","root");
		    
		    PreparedStatement ps = conn.prepareStatement("select ifnull(a.status,'?'),b.que_id, b.que, count(a.ans_id), b.date_time from question b left join answer a on a.que_id=b.que_id group by b.que_id order by a.ans_id");
		    out.println("<form action='javascript:void(0);'>");
		    out.println("<table  width=60% border=1 CELLPADDING=3 CELLSPACING=1 RULES=rows >");
		    ResultSet rs = ps.executeQuery();
		    ResultSetMetaData rsmd = rs.getMetaData();
		    int total = rsmd.getColumnCount();
		    out.println("<tr bgcolor='#BC8F8F'>");
		
		    out.println("<th>Status");;
		    
		    out.println("<th>Question");
		    
		    out.println("<th>Answers");
		    
		    out.println("<th>Date & Time");
		
		    out.println("</tr>");
		    int i=0;
		    while(rs.next()) 
		    {			    	
		    	if(i%2==0)
		    	{		        	
		        	%>
		        	<tr bgcolor="#FFFFE0">		    	
			        <td width="10%" align="center"><% out.print(rs.getString(1)); %> </td>		      
			        <td><% out.print(rs.getString(3)); %><a href="Answer.jsp?qid=<%= rs.getString(2) %>"><img src='Images/Edit.jpg' align='right'></a></td>
			        <td width="15%" align="center"><% out.print(rs.getString(4));%></td>
			        <td width="30%" align="center"><% out.print(rs.getString(5));%></td>
			        </tr>
			    	<%
		    	}
		    	else
		    	{		    		
		    		%>
		        	<tr bgcolor="#F5F5F5">		    	
			        <td width="10%" align="center"><% out.print(rs.getString(1)); %> </td>		      
			        <td><% out.print(rs.getString(3)); %><a href="Answer.jsp?qid=<%= rs.getString(2) %>"><img src='Images/Edit.jpg' align='right'></a></td>
			        <td width="15%" align="center"><% out.print(rs.getString(4));%></td>
			        <td width="30%" align="center"><% out.print(rs.getString(5));%></td>
			        </tr>
			    	<%
		    	}
		    	i++;   			    
		    }
		    
		    out.println("</table>");
		    out.println("</form>");
		    conn.close();
		    
		} 
		catch (Exception e) 
		{
		
		}
	%>
	</div>
</body>
</html>