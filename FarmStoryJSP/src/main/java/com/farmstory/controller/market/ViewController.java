package com.farmstory.controller.market;

import java.io.IOException;

import com.farmstory.dto.ProductDto;
import com.farmstory.service.OrderService;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/market/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = -1051308723058841536L;
	private ProductService productservice = ProductService.INSTANCE;
	private OrderService orderservice = OrderService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//int no = Integer.parseInt(req.getParameter("no"));
		int no = 1;
		ProductDto ProductDto = productservice.selectProduct(no);
		
		req.getSession().setAttribute("ProductDto", ProductDto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/view.jsp");
		dispatcher.forward(req, resp);
	}
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	    ProductDto productDto = (ProductDto) req.getSession().getAttribute("ProductDto");
//	    // 사용자가 클릭한 버튼에 따른 동작 구분
//	    String action = req.getParameter("action");
//	    int quantity = Integer.parseInt(req.getParameter("quantity"));
//	    
//	    
//	    if ("addToCart".equals(action)) {
//	        // 장바구니에 추가하는 처리
//	    	orderservice.insertOrder(productDto, quantity);
//            // 장바구니 추가 성공 시 처리 (예: 장바구니 페이지로 이동)
//            resp.sendRedirect(req.getContextPath() + "/market/cartSuccess.jsp");
//	        
//	    } else if ("buyNow".equals(action)) {
//	        // 바로구매 처리
//	        
//
//	        if (success) {
//	            // 주문 성공 시 처리 (예: 주문 완료 페이지로 이동)
//	            resp.sendRedirect(req.getContextPath() + "/market/orderSuccess.jsp");
//	        } else {
//	            // 실패 시 처리 (예: 에러 메시지 설정 후 원래 페이지로 리디렉션)
//	            req.setAttribute("errorMessage", "주문을 처리하는 중 오류가 발생했습니다.");
//	            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/view.jsp");
//	            dispatcher.forward(req, resp);
//	        }
//	    } else {
//	        // 알 수 없는 action에 대한 처리 (예: 에러 페이지로 이동)
//	        resp.sendRedirect(req.getContextPath() + "/market/error.jsp");
//	    }
//	}

	
}
