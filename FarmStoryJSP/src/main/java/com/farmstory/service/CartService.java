package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.CartDao;
import com.farmstory.dto.CartDto;

public enum CartService {
	INSTANCE;
	private CartDao dao = CartDao.getInstance();
	public void intsertCart(CartDto dto) {
		dao.intsertCart(dto);
	}
	public List<CartDto> selectCarts(String cartuid){
		return dao.selectCarts(cartuid);
	}
	public int deleteCart(String cartno,String cartuid) {
		return dao.deleteCart(cartno, cartuid);
	}
}
