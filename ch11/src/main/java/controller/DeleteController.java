package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servce.CustomerService;

@WebServlet("/customer/delete.do")
public class DeleteController extends HttpServlet{
	private static final long serialVersionUID = -893782725067255864L;

	
	private CustomerService service = CustomerService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId = req.getParameter("custId");
	
		service.deleteCustomer(custId);
		
		resp.sendRedirect("/ch11/customer/list.do");
	}
	
}
