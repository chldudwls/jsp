package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.article.dto.ArticleDTO;
import jboard.article.dto.PageGroupDTO;

@WebServlet("/article/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		// 현제 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 현재 페이지 그룹 구하기
		PageGroupDTO pageGroup = service.getCurrentPageGroup(currentPage);
		

		// 전체 계시물 겟수 구하기
		int total = service.selectCountTotal();
		
		// 마지막 페이지 번호 구하기
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 시작번호 구하기
		int start = service.getStartNum(currentPage);
		
		//파일 조회 카운트 업데이트
		service.updateArticleHitCount(no);

		//데이터 조회
		List<ArticleDTO> articles = service.selectArticles(start);
		int PageStartNo = total - (currentPage - 1) * 10;
	    for (ArticleDTO article : articles) {
	    	article.setStartNo(PageStartNo --);
	    }

	    //공유 참조
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroup", pageGroup);
		req.setAttribute("currentPage", currentPage);
		//포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/list.jsp");
		dispatcher.forward(req, resp);
	}

	
}
