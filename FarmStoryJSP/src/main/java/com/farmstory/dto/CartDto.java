package com.farmstory.dto;

public class CartDto {
	private int cartNo;
	private String cartUid;
	private int cartprono;
	private int cartstock;
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getCartUid() {
		return cartUid;
	}
	public void setCartUid(String cartUid) {
		this.cartUid = cartUid;
	}
	public int getCartprono() {
		return cartprono;
	}
	public void setCartprono(int cartprono) {
		this.cartprono = cartprono;
	}
	public int getCartstock() {
		return cartstock;
	}
	public void setCartstock(int cartstock) {
		this.cartstock = cartstock;
	}
	@Override
	public String toString() {
		return "CartDto [cartNo=" + cartNo + ", cartUid=" + cartUid + ", cartprono=" + cartprono + ", cartstock="
				+ cartstock + "]";
	}
}
