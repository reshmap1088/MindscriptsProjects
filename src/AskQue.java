import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.*;
impoet java.lang.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AskQue extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession s1=request.getSession(false);
		int uid=(int) s1.getAttribute("uid");
		String que=request.getParameter("que");
		String que_details=request.getParameter("que_details");
		String status="?";
		try 
		{
			Date dNow = new Date( );
		    SimpleDateFormat ft =  new SimpleDateFormat ("DD/MM/YYYY hh:mm:ss");
			Connection con=DBConnection.DBConnection();
			PreparedStatement pstmt=con.prepareStatement("insert into question (uid,que,que_details,date_time,status) values(?,?,?,now(),?)");
			pstmt.setInt(1, uid);			
			pstmt.setString(2, que);
			pstmt.setString(3, que_details);
			//pstmt.setString(4, date1);
			pstmt.setString(4, status);
			pstmt.executeUpdate();
			response.sendRedirect("MyQuestion.jsp");
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}		
	}
}
