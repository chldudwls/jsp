package com.farmstory.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.farmstory.dto.OrderDto;
import com.farmstory.dto.ProductDto;
import com.farmstory.util.DBHelper;

public class OrderDao extends DBHelper{
	private static OrderDao instance = new OrderDao();
	Logger loger = LoggerFactory.getLogger(getClass());
	public static OrderDao getInstance() {
		return instance;
	}
	private OrderDao() {}
	public void insertOrder(ProductDto productDto, int quantity) {
		
	}
	public OrderDto selectOrder(String order) {
		return null;
	}
	public List<OrderDto> selectOrders(){
		return null;
	}
	public void updateOrder(OrderDto order) {
		
	}
	public void deleteOrder(String orderno) {
		
	}
}
