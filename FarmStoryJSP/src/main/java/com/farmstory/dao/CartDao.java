package com.farmstory.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.CartDto;
import com.farmstory.util.DBHelper;
import com.farmstory.util.SQL;

public class CartDao extends DBHelper{
	private static CartDao instance = new CartDao();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public static CartDao getInstance() {
		return instance;
	}

	private CartDao() {	}
	public void intsertCart(CartDto dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_CART);
			psmt.setString(1, dto.getCartUid());
			psmt.setInt(1, dto.getCartprono());
			psmt.setInt(1, dto.getCartstock());
			psmt.executeUpdate();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
	}
	public List<CartDto> selectCarts(String cartuid){
		List<CartDto> carts = new ArrayList<CartDto>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_CARTS);
			psmt.setString(1, cartuid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CartDto dto = new CartDto();
				dto.setCartNo(rs.getInt(1));
				dto.setCartUid(rs.getString(2));
				dto.setCartprono(rs.getInt(3));
				dto.setCartstock(rs.getInt(4));
				carts.add(dto);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return carts;
	}
	public int deleteCart(String cartno,String cartuid) {
		int result = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.DELETE_CART);
			psmt.setString(1, cartno);
			psmt.setString(2, cartuid);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			closeAll();
		}
		return result;
	}
	
}
