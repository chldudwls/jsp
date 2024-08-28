package com.farmstory.dto;

public class OrderDto {
	private int orderno;
	private int orderprodno;
	private String orderuid;
	private int orderstock;
	private String orderrdate;
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}
	public int getOrderprodno() {
		return orderprodno;
	}
	public void setOrderprodno(int orderprodno) {
		this.orderprodno = orderprodno;
	}
	public String getOrderuid() {
		return orderuid;
	}
	public void setOrderuid(String orderuid) {
		this.orderuid = orderuid;
	}
	public int getOrderstock() {
		return orderstock;
	}
	public void setOrderstock(int orderstock) {
		this.orderstock = orderstock;
	}
	public String getOrderrdate() {
		return orderrdate;
	}
	public void setOrderrdate(String orderrdate) {
		this.orderrdate = orderrdate;
	}
	@Override
	public String toString() {
		return "OrderDto [orderno=" + orderno + ", orderprodno=" + orderprodno + ", orderuid=" + orderuid
				+ ", orderstock=" + orderstock + ", orderrdate=" + orderrdate + "]";
	}
	
}
