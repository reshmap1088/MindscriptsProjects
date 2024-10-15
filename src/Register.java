

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class Register extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String sname=request.getParameter("studname");
		String email=request.getParameter("email");
		String country=request.getParameter("ct");
		String loc=request.getParameter("loc");
		String pass=request.getParameter("pass");
		
		try
		{
			Connection con=DBConnection.DBConnection();
			PreparedStatement pstmt=con.prepareStatement("insert into user (name,email,country,location,password) values(?,?,?,?,?)");
			pstmt.setString(1, sname);			
			pstmt.setString(2, email);
			pstmt.setString(3, country);
			pstmt.setString(4, loc);
			pstmt.setString(5, pass);
			pstmt.executeUpdate();
						
			response.sendRedirect("Home.jsp");
			JOptionPane.showMessageDialog(null,"Registration Successfull....!");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}