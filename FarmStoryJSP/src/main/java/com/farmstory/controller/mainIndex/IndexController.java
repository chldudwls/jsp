package com.farmstory.controller.mainIndex;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.ArticleDto;
import com.farmstory.dto.PageGroupDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.service.ArticleService;
import com.farmstory.service.ProductService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index.do")
public class IndexController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ProductService service = ProductService.INSTANCE;
	private ArticleService articleService = ArticleService.INSTANCE;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");
		String cate = req.getParameter("cate");
		
		
		if (cate == null || cate.trim().isEmpty()) {
		    cate = "농산물이야기"; // 적절한 기본값으로 설정
		}
		
		
		// 현재 페이지 그룹 구하기
		int currentPage = service.getCurrentPage(pg);
		int arCurrentPage = articleService.getCurrentPage(pg);
		// 전체 계시물 겟수 구하기
		int total = service.selectCountTotal();
		int arTotal = articleService.selectCountTotal(pg, cate);
		
		// 페이지 시작번호 구하기
		int start = service.getStartNum(currentPage);
		int arStart = articleService.getStartNum(arCurrentPage);
		
		List<ProductDto> products = service.selectProducts(start);
		List<ArticleDto> articles = articleService.selectArticles(arStart,cate);
		
		logger.info("Number of articles retrieved: " + articles.size());
		
		int limit = 6;
		if(products.size() > limit) {
			products = products.subList(0, limit);
		}
		int articleLimit = 5;
		if(articles.size() > articleLimit) {
			articles = articles.subList(0, articleLimit);
			
		}
		
		
		// 데이터 조회
		int PageStartNo = total - (currentPage - 1) * 10;
		for(ProductDto product : products) {
			product.setStartNo(PageStartNo --);
			
			int originalPrice = (int) product.getProPrice(); // 원래 가격
			int discountPercent = (int) product.getProSale(); // 할인 비율
			int discountPrice = (int) (originalPrice * (1 - discountPercent / 100.0));
	        product.setsalePrice(discountPrice);
		}
		int arPageStartNo = arTotal - (currentPage - 1) * 10;
		for(ArticleDto article : articles) {
			arPageStartNo --;
		}
		
		
		
		req.setAttribute("products", products);
		req.setAttribute("articles", articles);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}
}
