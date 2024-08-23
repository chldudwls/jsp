package com.jboard.service;

import java.util.List;

import jboard.article.dao.CommentDAO;
import jboard.article.dto.CommentDTO;

public enum CommentService {
	INSTSNCE;
	private CommentDAO dao = CommentDAO.getInstance();
	
	public int insertComment(CommentDTO dto) {
		return dao.insertComment(dto);
	}
	public CommentDTO  selsctComment(int no) {
		return dao.selsctComment(no);
		 
	}
	public List<CommentDTO> selsctComments(String praent) {
		return dao.selsctComments(praent);
	}
	
	public int updateComment(CommentDTO dto) {
		return dao.updateComment(dto);
	}
	public int deleteComment(String no) {
		return dao.deleteComment(no);
	}
}
