package jboard.article.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jboard.article.dto.ArticleDTO;
import jboard.article.dto.FileDTO;
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
		} catch (Exception e) {
			logger.error(e.getMessage());
			try {
				conn.rollback();
			} catch (Exception e2) {
				logger.error(e.getMessage());
			}
		}finally {
			closeAll();
		}
		return no;
	}
	public int sekectCountTotal() {
		int total = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}finally {
			closeAll();
		}
		
		return total;
	}
	
public ArticleDTO selectArticle(String no) {
		
		ArticleDTO dto = null;
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				if(dto == null) {
					dto = new ArticleDTO();
					dto.setNo(rs.getInt(1));
					dto.setCate(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setComment(rs.getInt(5));
					dto.setFile(rs.getInt(6));
					dto.setHit(rs.getInt(7));
					dto.setWriter(rs.getString(8));
					dto.setRegip(rs.getString(9));
					dto.setRdate(rs.getString(10));
				}
				
				FileDTO fileDto = new FileDTO();
				fileDto.setFno(rs.getInt(11));
				fileDto.setAno(rs.getInt(12));
				fileDto.setoName(rs.getString(13));  
				fileDto.setsName(rs.getString(14));  
				fileDto.setDownload(rs.getInt(15));
				fileDto.setRdate(rs.getString(16));
				files.add(fileDto);
			}
			
			dto.setFiles(files);
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return dto;
	}
	public List<ArticleDTO> selectArticles(int start) {
		List<ArticleDTO> articles = new ArrayList<ArticleDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_LIST);
			psmt.setInt(1 , start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setCate(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setComment(rs.getInt(5));
				dto.setFile(rs.getInt(6));
				dto.setHit(rs.getInt(7));
				dto.setWriter(rs.getString(8));
				dto.setRegip(rs.getString(9));
				dto.setRdateSubString(rs.getString(10));
				dto.setNick(rs.getString(11));
				articles.add(dto);
			}
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}finally {
			closeAll();
		}
		return articles;
	}
	public void updateArticleHitCount(String no) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT_COUNT);
			psmt.setString(1, no);
			psmt.executeUpdate();
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}finally {
			closeAll();
		}
	}
	public void updataArticle(ArticleDTO dto) {}
	public void deleteArticle(int no) {}
}
