package com.farmstory.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.UserDto;
import com.farmstory.util.DBHelper;
import com.farmstory.util.SQL;

public class UserDao extends DBHelper{
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	private UserDao() { }
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public void insertUser(UserDto user) {
		
	}
	public UserDto selectUser(String userId) {
		UserDto user = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_USERS);
			if(rs.next()) {
				user = new UserDto();
				user.setUserId(rs.getString(1));
				user.setUserPass(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserNick(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setUserHp(rs.getString(6));
				user.setUserRole(rs.getString(7));
				user.setUserGrade(rs.getString(8));
				user.setUserZip(rs.getString(9));
				user.setUserAddr1(rs.getString(10));
				user.setUserAddr2(rs.getString(11));
				user.setUserPoint(rs.getString(12));
				user.setUserRegip(rs.getString(13));
				user.setUserRegdate(rs.getString(14));
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return user;
	}
	public List<UserDto> selectUsers() {
		List<UserDto> users = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_USERS);
			while(rs.next()) {
				UserDto user = new UserDto();
				user.setUserId(rs.getString(1));
				user.setUserPass(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserNick(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setUserHp(rs.getString(6));
				user.setUserRole(rs.getString(7));
				user.setUserGrade(rs.getString(8));
				user.setUserZip(rs.getString(9));
				user.setUserAddr1(rs.getString(10));
				user.setUserAddr2(rs.getString(11));
				user.setUserPoint(rs.getString(12));
				user.setUserRegip(rs.getString(13));
				user.setUserRegdate(rs.getString(14));
				users.add(user);
				logger.debug(user.toString());
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		
		return users;
	}
	
	public void updateUser(UserDto user) {
		
	}
	public void deleteUser(String userId) {
		
	}
	
	
}
