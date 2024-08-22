package com.jboard.controller.article;

import java.io.IOException;

import com.jboard.service.user.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.article.dto.ArticleDTO;

@WebServlet("/article/view.do")
public class ViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		// 데이터 조회
		ArticleDTO articleDto = service.selectArticle(no);
		
		//파일 조회 카운트 업데이트
		service.updateArticleHitCount(no);
		//
		req.setAttribute("articleDto", articleDto);
		
		//
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/view.jsp");
		dispatcher.forward(req, resp);
	}

}
