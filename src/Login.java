

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

public class Login extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uname=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		try
		{
			Connection con=DBConnection.DBConnection();
			Statement stmt= con.createStatement();
			ResultSet rs=stmt.executeQuery("select name, uid from user where email='"+uname+"' and password='"+pass+"' ");
			
			if(rs.next())
			{
				String s1=rs.getString(1);
				int uid=rs.getInt(2);
				HttpSession s=request.getSession();
				s.setAttribute("name", s1);
				s.setAttribute("uid", uid);				

				response.sendRedirect("Welcome.jsp");				
			}
			else 
			{
				response.sendRedirect("Home.jsp");
				JOptionPane.showMessageDialog(null,"Incorrect username or password", null, 0);
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
