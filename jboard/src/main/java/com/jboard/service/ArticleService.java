package com.jboard.service;

import java.util.List;

import jboard.article.dao.ArticleDAO;
import jboard.article.dto.ArticleDTO;
import jboard.article.dto.PageGroupDTO;

public enum ArticleService {
	INSTANCE;

	private ArticleDAO dao = ArticleDAO.getInstance();

	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		if (total % 10 == 0) {
			lastPageNum = total / 10;
		} else {
			lastPageNum = total / 10 + 1;
		}
		return lastPageNum;
	}

	// 페이지 시작번호(limit)
	public int getStartNum(int currentPage) {
		return (currentPage - 1) * 10;

	}

	public int getCurrentPage(String pg) {
		int currentPage = 1;

		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}

	// 현재 페이지 구룹 구하기
	public PageGroupDTO getCurrentPageGroup(int currentPage) {
		int currentPageGroup = (int) Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		int total = selectCountTotal();
		int pageGroupTotal = (int) Math.ceil(total / 10.0);

		if (pageGroupEnd > pageGroupTotal) {
			pageGroupEnd = pageGroupTotal;
		}
		return new PageGroupDTO(pageGroupStart, pageGroupEnd, pageGroupTotal);
	}

	public int insertArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}

	public int selectCountTotal() {
		return dao.sekectCountTotal();
	}

	public ArticleDTO selectArticle(String no) {
		return dao.selectArticle(no);
	}

	public List<ArticleDTO> selectArticles(int start) {
		return dao.selectArticles(start);
	}

	public void updateArticleHitCount(String no) {
		dao.updateArticleHitCount(no);
	}

	public void updateArticle(ArticleDTO dto) {
		dao.updataArticle(dto);
	}

	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}
}
