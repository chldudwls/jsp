package article.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import article.dto.ArticleDTO;

public class ArticleDAO {
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	Logger logger = LoggerFactory.getLogger(getClass());
	public void insertArticle(ArticleDTO dto) {}
	public ArticleDTO selectArticle(String no) {
		ArticleDTO dto = null;
		return dto;
	}
	public void selectArticles() {}
	public void updataArticle() {}
	public void deleteArticle() {}
}
