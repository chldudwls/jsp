package jboard.article.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jboard.article.dto.ArticleDTO;
import util.DBHelper;
import util.Sql;

public class ArticleDAO extends DBHelper{
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	
	private ArticleDAO() {}
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public int insertArticle(ArticleDTO dto) {
		int no = 0;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getFile());
			psmt.setString(4, dto.getWriter());
			psmt.setString(5, dto.getRegip());
			psmt.executeUpdate();

			
			rs = stmt.executeQuery(Sql.SELECT_MAX_NO);
			
			if(rs.next()) {
				no = rs.getInt(1);
			}
			conn.commit();
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return no;
	}
	public ArticleDTO selectArticle(int no) {
		ArticleDTO dto = null;
	
		return dto;
	}
	public List<ArticleDTO> selectArticles() {
		return null;
	}
	public void updataArticle(ArticleDTO dto) {}
	public void deleteArticle(int no) {}
}
