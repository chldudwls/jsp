package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;


import com.jboard.service.user.ArticleService;
import com.jboard.service.user.FileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jboard.article.dto.ArticleDTO;
import jboard.article.dto.FileDTO;

@WebServlet("/article/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ArticleService articleService = ArticleService.INSTANCE;
	private FileService fileService = FileService.INSTANCE;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/write.jsp");
			dispatcher.forward(req, resp);
		}
				
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();
		
		// 파일 업로드
		List<FileDTO> files = fileService.fileUpload(req);
		
		ArticleDTO dto = new ArticleDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(files.size());
		dto.setWriter(writer);
		dto.setRegip(regip);

		//글등록
		int no = articleService.insertArticle(dto);
		
		
		//파일 등록
		for(FileDTO fileDto : files) {
			fileDto.setAno(no);
			fileService.insertFile(fileDto);
		}
		
		resp.sendRedirect("/jboard/article/list.do");
	}

}
