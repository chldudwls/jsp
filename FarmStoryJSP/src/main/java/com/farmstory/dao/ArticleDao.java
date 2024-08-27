package com.farmstory.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.ArticleDto;
//import com.farmstory.util.DBHelper;

public class ArticleDao {
	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDto dto) {
		return 0;
	}
	
	public ArticleDto selectArticle(String artNo) {
		return null;
	}
	public List<ArticleDto> selectArticles(int start){
		return null;
	}
	public void updateArticle(ArticleDto dto) {
		
	}
	public int deleteArticle(String artNo) {
		return 0;
	}
	
}
