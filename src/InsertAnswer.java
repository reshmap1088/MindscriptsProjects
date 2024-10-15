

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InsertAnswer extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession s1=request.getSession(false);
		int uid=(int) s1.getAttribute("uid");
		int qid=(int) s1.getAttribute("qid");
		String ans=request.getParameter("answer");	
		String status="=";
		try 
		{
			Date dNow = new Date( );
		    SimpleDateFormat ft =  new SimpleDateFormat ("DD/MM/YYYY hh:mm:ss");
			Connection con=DBConnection.DBConnection();
			PreparedStatement pstmt=con.prepareStatement("insert into answer (uid,que_id,ans,date_time,status) values(?,?,?,now(),?)");
			pstmt.setInt(1, uid);			
			pstmt.setInt(2, qid);
			pstmt.setString(3, ans);
			//pstmt.setString(4, date1);
			pstmt.setString(4, status);
			pstmt.executeUpdate();
			response.sendRedirect("Answer.jsp?qid="+qid);
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
