package com.farmstory.controller.market;

import java.io.IOException;

import com.farmstory.dto.ProductDto;
import com.farmstory.service.ProductService;
import com.farmstory.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet{

	private static final long serialVersionUID = -5384513430322205886L;
	UserService userservice = UserService.INSTANCE;
	ProductService productservice = ProductService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int ordercheck = Integer.parseInt(req.getParameter("ordercheck"));
		String uid = "p101";
		//view 에서 바로구매 버튼을 눌렀을때 동작
		if(ordercheck==1) {
			String quantity = req.getParameter("quantity");
			String proNo = req.getParameter("proNo");
			ProductDto prodto = productservice.selectProduct(Integer.parseInt(proNo));
			req.setAttribute("prodto", prodto);
		}
		//장바구니에서 구매 버튼을 눌렀을때만 동작
		else if(ordercheck==2) {
			String[] selectedItems = req.getParameterValues("selectedItems");  // 선택된 상품의 ID 리스트
	        req.setAttribute("selectedItems", selectedItems);
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/market/order.jsp");
        dispatcher.forward(req, resp);
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
