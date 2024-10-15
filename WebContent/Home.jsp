<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:lightgray" >
	<fieldset style="width: auto; height: 80px; background-color: #993300; 
                        background-image: url(Images/Logo1.jpg);                        
			background-repeat: no-repeat;
			background-position: 70px;"> 
			<div style="margin-left: 1200px; margin-top: 0.3%;">
				<a href="Home2.jsp"><img src="Images/Home.jpg" width="60" height="60"></a>				
			</div>
    </fieldset>       
       
	<table>		
		<tr height="40in">
		</tr>
		<tr>
			<td>
				<div class="contentcontainer med left" style="margin-left:100px; margin-bottom: 5px">
					<img src="Images/Problem.jpg" width="450px" height="400px">
				</div>
			</td>
			<td>
				<div class="contentcontainer med left" style="margin-left:200px;">
					<form name="myForm1" action="Register" onsubmit="return validateForm();" method="post">				
						<img src="Images/SignUp.jpg">
						<br><br>Name:<br><input type="text" name="studname" value="" style="margin-bottom: 10px" /><br>
						Email ID:<br><input type="text" name="email" value="" style="margin-bottom: 10px" /><br>
						Country:<br><input type="text" name="ct" value="" style="margin-bottom: 10px"/><br>
						Location:<br><input type="text" name="loc" value="" style="margin-bottom: 10px"/><br>
						Password:<br><input type="password" name="pass" value="" style="margin-bottom: 10px" /><br>						
						<input type="submit" name="reg" value="Submit" style="font-family:monospace; font-size:large; height:30px; width:70px"/>&nbsp;&nbsp;
						
						<script>
					       	function validateForm()
					   		{
								var a=document.forms["myForm1"]["studname"].value;
								var b=document.forms["myForm1"]["email"].value;
								var c=document.forms["myForm1"]["ct"].value;
								var d=document.forms["myForm1"]["loc"].value;
								var e=document.forms["myForm1"]["pass"].value;
								
								if(a==null || a=="" && b==null || b=="" && c==null || c=="" && d==null || d=="" && e==null || e=="")
								{
									alert("Fill The Registration Form");
								    return false;
								}                    
								else if(a==null || a=="")
								{                    
								    alert("Enter Name");
								    return false;                        
								}
								else if(!isNaN(a))
								{                    
								    alert("Name: Characters Only");
								    return false;                        
								}
								else if(b==null || b=="")
								{                    								    
								    alert("Enter Email ID");
								    return false;                        
								}
								else if(b)
								{
									var at="@"
							        var dot="."
							        var lat=b.indexOf(at)
							        var ldot=b.indexOf(dot)
							        if (b.indexOf(at)==-1 || b.indexOf(dot)==-1)
							        {
							            alert("Invalid E-mail ID")							     
							        	return false;
							        }
							   		else if(b.indexOf(dot)==0 || b.indexOf(at)==0)
							        {
							        	alert("Invalid E-mail ID")							     
							        	return false;
							        }	
							        else
							        	return true;
								}
								else if(c==null || c=="")
								{                    
								    alert("Enter your country");
								    return false;                        
								}
								else if(!isNaN(c))
								{                    
								    alert("Country: Characters Only");
								    return false;                        
								}
								else if(d==null || d=="")
								{                    
								    alert("Enter your location");
								    return false;                        
								}
								else if(!isNaN(d))
								{                    
								    alert("Location: Characters Only");
								    return false;                        
								}
								else if(e==null || e=="")
								{                    
								    alert("Enter Password");
								    return false;                        
								}
					   		}
					   	</script>
					</form>
				</div>
			</td>
							
			<td width="50px" style=" border-right: 3px solid black; height: 100px">					
			</td>				
			
			<td>	
				<div style="margin-top:-70%; margin-left:50px;">				
				<form name="myForm2" action="Login" onsubmit="return validateForm1();" method="post">		
				
					<img src="Images/SignIn.jpg">					
					<br><br>
					Login Id (Email Id):<br><input type="text" name="id" value="" style="margin-bottom: 10px"/><br>
					Password:<br><input type="password" name="pass" value="" style="margin-bottom: 10px" /><br>
					<input type="submit" name="log" value="Login" style="font-family:monospace; font-size:large; height:30px; width:70px " />&nbsp;&nbsp;						
					
					<script>
					       	function validateForm1()
					   		{
								var a=document.forms["myForm2"]["id"].value;
								var b=document.forms["myForm2"]["pass"].value;
								
								if(a==null || a=="" && b==null || b=="")
								{
									alert("Fill The Login Details");
								    return false;
								}                    
								else if(a==null || a=="")
								{                    
								    alert("Enter Login ID");
								    return false;                        
								}	
								else if(a)
								{
									var at="@"
							        var dot="."
							        var lat=b.indexOf(at)
							        var ldot=b.indexOf(dot)
							        if (a.indexOf(at)==-1 || a.indexOf(dot)==-1)
							        {
							            alert("Invalid E-mail ID")							     
							        	return false;
							        }
							   		else if(a.indexOf(dot)==0 || a.indexOf(at)==0)
							        {
							        	alert("Invalid E-mail ID")							     
							        	return false;
							        }	
							        else
							        	return true;
								}
								else if(b==null || b=="")
								{                    
								    alert("Enter Password");
								    return false;                        
								}
					   		}
					</script>
					
				</form>
				</div>	
			</td>				
		</tr>					
	</table>
	 
</body>
</html>