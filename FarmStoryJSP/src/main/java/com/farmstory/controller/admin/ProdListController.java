package com.farmstory.controller.admin;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/product/list.do"})
public class ProdListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("page");

		int current = service.getCurrentPage(pg);
		int start = service.getStartNum(current);
		int total = service.selectCountTotal();
		int lastPage = service.getLastPageNum(total);
		PageGroupDto pageGroup = service.getCurrentPageGroup(current);
		
		logger.debug("total : "+total);
		logger.debug("current : "+current);
		logger.debug("last : "+lastPage);
		
		List<ProductDto> products = service.selectProducts(start);
		req.setAttribute("Products", products);
		req.setAttribute("Current", current);
		req.setAttribute("PageGroup", pageGroup);
		req.setAttribute("LastPage", lastPage);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/product/list.jsp");
        dispatcher.forward(req, resp);
	}
}
