package controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import servce.CustomerService;

@WebServlet("/customer/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = -6087397849233006940L;

	private CustomerService service = CustomerService.INSTANCE;
	
	// 로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/register.jsp");
	dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String custId 	= req.getParameter("custId");
	String name		= req.getParameter("name");
	String hp 		= req.getParameter("hp");
	String addr		= req.getParameter("addr");
	String rdate 	= req.getParameter("rdate");
	//System.out.println(dto);
	logger.debug("custId -"+custId);
	logger.debug("custId -"+name);
	logger.debug("custId -"+hp);
	
	// DTO 생성
	CustomerDTO dto = new CustomerDTO();
	dto.setCustId(custId);
	dto.setName(name);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setRdate(rdate);
	
	logger.info(dto.toString());
	
	// 서비스 실행
	service.insertCustomer(dto);
	
	
	// 리다이트
	resp.sendRedirect("/ch11/customer/list.do");
	}
}
