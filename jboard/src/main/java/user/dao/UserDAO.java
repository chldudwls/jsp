package user.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import user.dto.UserDTO;
import util.DBHelper;
import util.Sql;


public class UserDAO extends DBHelper{
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public int selectCountUser(String type, String value) {
		int result = 0;
		
StringBuilder sql = new StringBuilder(Sql.SELECT_COUNT_USER);
		
		if(type.equals("uid")) {
			sql.append(Sql.WHERE_UID);
		}else if(type.equals("nick")) {
			sql.append(Sql.WHERE_NICK);
		}else if(type.equals("email")) {
			sql.append(Sql.WHERE_EMAIL);
		}else if(type.equals("hp")) {
			sql.append(Sql.WHERE_HP);
		}
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql.toString());
			psmt.setString(1, value);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	
	
	public void insertUser(UserDTO dto) {try {
		conn = getConnection();
		psmt = conn.prepareStatement(Sql.INSERT_USER);
		psmt.setString(1,dto.getUid());
		psmt.setString(2,dto.getPass());
		psmt.setString(3,dto.getName());
		psmt.setString(4,dto.getNick());
		psmt.setString(5,dto.getEmail());
		psmt.setString(6,dto.getHp());
		psmt.setString(7,dto.getZip());
		psmt.setString(8,dto.getAddr1());
		psmt.setString(9,dto.getAddr2());
		psmt.setString(10,dto.getRegip());
		psmt.executeUpdate();
		
		closeAll();
	} catch (Exception e) {
		logger.error(e.getMessage());
	}
	}
	
	public UserDTO selectUser(String uid) {
		try {
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return null;
	}
	
	public List<UserDTO> selectUsers() {
		return null;
	}
	
	public void updateUser(UserDTO dto) {}
	
	public void deleteUser(String uid) {}
}
