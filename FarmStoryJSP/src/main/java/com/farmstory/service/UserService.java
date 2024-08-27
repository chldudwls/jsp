package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.UserDao;
import com.farmstory.dto.UserDto;

public enum UserService {
	INSTANCE;
	private UserDao dao = UserDao.getInstance();
	
	public void insertUser(UserDto user) {
		dao.insertUser(user);
	}
	public UserDto selectUser(String userId) {
		return dao.selectUser(userId);
	}
	public List<UserDto> selectUsers() {
		return dao.selectUsers();
	}
	public void updateUser(UserDto user) {
		dao.updateUser(user);
	}
	public void deleteUser(String userId) {
		dao.deleteUser(userId);
	}
}
