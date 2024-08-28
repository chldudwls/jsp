package com.farmstory.controller.market;

import java.io.IOException;
import java.util.List;

import com.farmstory.dto.CartDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.service.CartService;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/market/cart.do")
public class CartController extends HttpServlet{

	private static final long serialVersionUID = 1329079888171038798L;
	private CartService cartservice = CartService.INSTANCE;
	private ProductService productservice = ProductService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = "p101";
		int ordercheck = Integer.parseInt(req.getParameter("ordercheck"));
		//view 에서 장바구니 버튼을 눌렀을때만 동작
		if(ordercheck == 1) {
			String quantity = req.getParameter("quantity");
			String proNo = req.getParameter("proNo");
			CartDto dto = new CartDto();
			dto.setCartUid(uid);
			dto.setCartprono(Integer.parseInt(proNo));
			dto.setCartstock(Integer.parseInt(quantity));
			cartservice.intsertCart(dto);
		}
		List<CartDto> cartDto = cartservice.selectCarts(uid);
		req.setAttribute("cartDto", cartDto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/cart.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = "p101";
		int ordercheck = 2;
	    String[] selectedItems = req.getParameterValues("selectedItems");

	    if (selectedItems != null && selectedItems.length > 0) {
	        // 세션에 데이터 저장
	        HttpSession session = req.getSession();
	        session.setAttribute("uid", uid);
	        
	        session.setAttribute("selectedItems", selectedItems);

	        // 리다이렉트
	        resp.sendRedirect("/WEB-INF/market/order.do?ordercheck=2");
	    } else {
	        resp.sendRedirect("/WEB-INF/market/cart.do");  // 선택된 항목이 없을 경우
	    }
	}
}
