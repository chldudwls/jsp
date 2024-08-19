package controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/customer/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = -6087397849233006940L;

	private CustomerService service = CustomerService.INSTANCE;
	
	// 로고 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<CustomerDTO> customers = service.selectCustomers();

		
		logger.info("customer -"+customers);
		
		// 데이터 공유 참조
		req.setAttribute("customers", customers);
				
		// 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	
}
