<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:lightgray">
	<form name="myForm" action=""></form>
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
				<div class="contentcontainer med left" style="margin-left:690px; margin-top:-25px">				
					<a href="Home.jsp"> <img src="Images/Login.jpg" height= 45px> </a>
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
	<div class="contentcontainer med left" style="margin-left:100px; margin-top:-20px;">
	<table>
		<td>			
	<%	
		
		try 
		{
		    Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ashitosh","root","root");
		    Statement stmt=conn.createStatement();
		    stmt.executeQuery("set @s=0");
		    PreparedStatement ps = conn.prepareStatement("select @s:=@s+1, b.que, count(a.ans_id), b.que_id from question b right join answer a on a.que_id=b.que_id group by b.que_id having count(a.ans_id) > '"+ 0 +"' order by a.ans_id");
		    ResultSet rs = ps.executeQuery();
		    ResultSetMetaData rsmd = rs.getMetaData();
		    int total = rsmd.getColumnCount();
			%>
		    <table  width=600px border=1 CELLPADDING=3 CELLSPACING=1 RULES=all style="margin-bottom: 250px">		    
			    <tr bgcolor="#BC8F8F">
			    	<th>No.</th>
				    <th>Question</th>	    
				    <th>Answers</th>    	
			    </tr>
		    <%
		    int i=0;
		    while(rs.next()) 
		    {			    	
		    	if(i%2==0)
		    	{		        	
		        	%>
		        	<tr bgcolor="#FFFFE0">
			        <td width="2%" align="center"><% out.print(rs.getString(1)); %></td>
			        <td width="30%"><% out.print(rs.getString(2)); %><a href="Home3.jsp?qid=<%= rs.getInt(4) %>&qno=<%= rs.getString(1) %>"><img src="Images/Read.jpg" align="right" height="30px"></a></td>		      
			        <td width="1%"><% out.print(rs.getString(3)); %></td>			        
			        </tr>
			    	<%
		    	}
		    	else
		    	{
		    		%>
		        	<tr bgcolor="#F5F5F5">
		        	<td width="2%" align="center"><% out.print(rs.getString(1)); %></td>
			        <td width="30%" id="first"><% out.print(rs.getString(2)); %><a href="Home3.jsp?qid=<%= rs.getInt(4) %>&qno=<%= rs.getString(1) %>"><img src="Images/Read.jpg" align="right" height="30px"></a></td>
			        <td width="1%"><% out.print(rs.getString(3)); %></td>
			        </tr>
			    	<%
		    	}
		    	i++;
		    }

		    stmt.close();
		    ps.close();
		    conn.close();
		   %>
		   
			</table>
		    </td>
		    <td>
		    </td>
		    <td>
		    <br>
		    <table width="550px" height="100px" style="margin-bottom: 320px; margin-top: 15px;" border=1 CELLPADDING=3 CELLSPACING=1 rules="rows" FRAME=HSIDES>		    	
		    	<%		    	
		    	try
	    		{
		    		int qid=Integer.parseInt(request.getParameter("qid"));
		    		int qno=Integer.parseInt(request.getParameter("qno"));
		    	%>
		    		<tr>
	    				<th>No</th>
	    				<th>Answers of Question <%=qno %></th>
	    			</tr>
		    	<%
			    	Class.forName("com.mysql.jdbc.Driver");
					Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost/ashitosh","root","root");
					Statement stmt1=conn1.createStatement();
				    stmt1.executeQuery("set @s=0");
					PreparedStatement ps1 = conn1.prepareStatement("select @s:=@s+1 se, ans from answer where que_id="+qid);
					ResultSet rs1 = ps1.executeQuery();
					while(rs1.next())
				    {
				    	%>
				    		
				    		<tr>
							<td align="center"> 
							 	<% out.print(rs1.getString(1)); %>&nbsp;								
							 </td>
							 <td>
							 	<% out.print(rs1.getString(2)); %><br>
							 </td>
							 </tr>
				    	<%
				    }
	    		}
	    		catch(Exception e)
	    		{
	    			e.printStackTrace();
	    		}
				%>
		    </table>
		</td>
		<%
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	%>
	</table>
	</div>
</body>
</html>