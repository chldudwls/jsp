package controller.user2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import user2.User2Service;

@WebServlet("/user2/delete.do")
public class DeleteController extends HttpServlet{
	
	private static final long serialVersionUID = -6559824777220358499L;

	private User2Service service = User2Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
				
	}
}
