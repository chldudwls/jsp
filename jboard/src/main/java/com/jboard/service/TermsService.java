package com.jboard.service;

import java.util.List;


import jboard.user.dao.TermsDAO;
import jboard.user.dto.TermsDTO;

public class TermsService {
	private static TermsService instance = new TermsService();
	public static TermsService getInstance() {
		return instance;
	}
	private TermsService() {}
	
	private TermsDAO dao = TermsDAO.getInstance();
	
	
	
	public void insertTerms(TermsDTO dto) {
		dao.insertTerms(dto);
	}
	
	public TermsDTO selectTerms() {
		return dao.selectTerms();
	}
	public List<TermsDTO> selectTermss(){
		return dao.selectTermss();
	}
	public void updateTerms(TermsDTO dto) {
		dao.updateTerms(dto);
	}
	public void deleteTerms() {
		dao.deleteTerms();
	}
}
