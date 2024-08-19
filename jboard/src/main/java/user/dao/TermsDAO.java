package user.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import user.dto.TermsDTO;
import util.DBHelper;
import util.Sql;


public class TermsDAO extends DBHelper{
	private static final long serialVersionUID = 1L;
	
	private static TermsDAO instance = new TermsDAO();
	public static TermsDAO getInstance() {
		return instance;
	}
	private TermsDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertTerms(TermsDTO dto) {
		
	}
	
	public TermsDTO selectTerms() {
		TermsDTO dto = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			
			if(rs.next()) {
				dto = new TermsDTO();
				dto.setTerms(rs.getString(1));
				dto.setPrivacy(rs.getString(2));
				
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dto;
	}
	public List<TermsDTO> selectTermss(){
		try {
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	public void updateTerms(TermsDTO dto) {}
	public void deleteTerms() {}
}
