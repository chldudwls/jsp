package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.OrderDao;
import com.farmstory.dto.OrderDto;
import com.farmstory.dto.ProductDto;

public enum OrderService {
	INSTANCE;
	private OrderDao dao = OrderDao.getInstance();
	public void insertOrder(ProductDto productDto, int quantity) {
		dao.insertOrder(productDto, quantity);
	}
	public OrderDto selectOrder(String order) {
		return dao.selectOrder(order);
	}
	public List<OrderDto> selectOrders(){
		return dao.selectOrders();
	}
	public void updateOrder(OrderDto order) {
		dao.updateOrder(order);
	}
	public void deleteOrder(String orderno) {
		dao.deleteOrder(orderno);
	}
}
