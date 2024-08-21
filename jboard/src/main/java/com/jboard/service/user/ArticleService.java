package com.jboard.service.user;

import java.util.List;

import jboard.article.dao.ArticleDAO;
import jboard.article.dto.ArticleDTO;

public enum ArticleService {
	INSTANCE;

	private ArticleDAO dao = ArticleDAO.getInstance();


	public int insertArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}

	public ArticleDTO selectArticle(int no) {
		return dao.selectArticle(no);
	}

	public List<ArticleDTO> selectArticles() {
		return dao.selectArticles();
	}

	public void updateArticle(ArticleDTO dto) {
		dao.updataArticle(dto);
	}

	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}
}

