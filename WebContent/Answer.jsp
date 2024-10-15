<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
					<a href="Welcome.jsp"><img src="Images/ShareIcon.jpg" height="90px"></a>								
				</div>
			</td>
			<td>
				<br>
				
				<div class="contentcontainer med left" style="margin-left:30px;margin-top:-15px">
					<img src="Images/Welcome.jpg" width=170px >
					<h3>Problem Shared Is A Problem Solved!</h3>
				</div>				
			</td>
			<td>
				<%
					HttpSession s=request.getSession(false);
					String s1=(String) s.getAttribute("name");
					
					if(s1.equals(null))
					{						
						response.sendRedirect("Home.jsp");
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
	
	<div style="margin-left:250px; margin-top:10px;">	
		<table width=70% border=1 CELLPADDING=3 CELLSPACING=1 rules="all">
			<tr style="margin-top: -10px;">
	<%
		try
		{
			int id=Integer.parseInt(request.getParameter("qid"));
			HttpSession s2=request.getSession();
			s2.setAttribute("qid", id);
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ashitosh","root","root");
		    
		    PreparedStatement ps1 = conn.prepareStatement("select name, location, country, uid from user where uid in(select uid from question where que_id='"+ id +"')");
		    ResultSet rs1 = ps1.executeQuery();
		    
		    PreparedStatement ps2 = conn.prepareStatement("select ifnull(a.status,'?'), b.que, b.que_details, count(a.ans_id), b.date_time from question b left join answer a on a.que_id=b.que_id where b.que_id='"+ id +"'");
		    ResultSet rs2 = ps2.executeQuery();
		    while(rs1.next() & rs2.next())
		    {
		    	%>
					<td width="15%" align="left">
						<h4 style="margin-bottom: -20px; margin-top:-40px;"><% out.print(rs1.getString(1)); %></h4><br>
						<% out.print(rs1.getString(2)); %><br>
						<% out.print(rs1.getString(3)); %><br>						
					 </td>
					 <td> 
					 	<h3 style="margin-bottom: -1px; margin-top:5px;"><% out.print(rs2.getString(2)); %></h3>
						<% out.print(rs2.getString(5)); %>&nbsp; - &nbsp; 
						<% out.print(rs2.getString(4)); %> answers received &nbsp; - &nbsp;Status
						(<% out.print(rs2.getString(1)); %>)<br>
						<h4 style="margin-bottom: -1px;">Details</h4>
						<% out.print(rs2.getString(3)); %><br>
						<input type="button" name="answer" value="Give Answer" onclick="document.getElementById('scr').focus();" style="margin-left: 530px; font-family:monospace; font-size:large; height:25px; width:110px" /><br>
					 </td>
		    	<%
		    }
		    conn.close();
		    ps1.close();
		    ps2.close();
		}
		catch(Exception e)
		{
			
		}		
	%>
			</tr>
		</table><br>
		
		<h3 style="margin-bottom: 4px;">Answers</h3>
		<table width=70% border=1 CELLPADDING=3 CELLSPACING=1 rules="rows" FRAME=HSIDES >			
				<%
					try
					{
						int id=Integer.parseInt(request.getParameter("qid"));
						HttpSession s2=request.getSession(false);
						s2.setAttribute("id", "id");
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ashitosh","root","root");
						
						PreparedStatement ps = conn.prepareStatement("select distinct(uid) from answer where que_id="+id);
						ResultSet rs = ps.executeQuery();
						
						while(rs.next())
						{						
						    PreparedStatement ps3 = conn.prepareStatement("select u.name, u.location, u.country, a.status, a.ans, a.date_time from user u natural join answer a where a.uid='"+ rs.getInt(1) +"' and a.que_id="+id);
						    ResultSet rs1 = ps3.executeQuery();
						    while(rs1.next())
						    {
						    	%>
						    		<tr>
									<td width="15%" align="left">
										<h4 style="margin-bottom: -20px; margin-top:1px;"><% out.print(rs1.getString(1)); %></h4><br>
										<% out.print(rs1.getString(2)); %><br>
										<% out.print(rs1.getString(3)); %>
									 </td>
									 <td> 
									 	<% out.print(rs1.getString(4)); %><br>
										<% out.print(rs1.getString(5)); %><br>
										<center style="margin-left: 450px"><% out.print(rs1.getString(6)); %></center>
									 </td>
									 </tr>
						    	<%
						    }
						    ps3.close();
						}
						conn.close();
						ps.close();
					}
					catch(Exception e)
					{
						
					}		
				%>			
		</table><br><br>
		<form name="myForm4" action="InsertAnswer" onsubmit="return validAnswer();" method="post">
			<h3 style="margin-bottom: 4px">Your Answer</h3>
			<textarea rows="8" cols="100" id="scr" name="answer" placeholder="Provide your answer here."></textarea> <br>
			<div style="margin-left:613px;">
				<input type="submit" value="Save Answer" style="font-family:monospace; font-size:large; height:26px; width:110px" />	
			</div>
			<script>
				function validAnswer()
				{
					var ans=document.forms["myForm4"]["answer"].value;
					if(ans==null || ans=="")				
					{
						alert("Provide the answer first");
						return false;
					}
				}
			</script>
		</form>		
	</div>
</body>
</html>