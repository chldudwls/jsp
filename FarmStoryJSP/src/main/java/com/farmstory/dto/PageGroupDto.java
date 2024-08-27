package com.farmstory.dto;

public class PageGroupDto {
	private int start; 
	private int end;
	private int total;
	@Override
	public String toString() {
		return "PageGroupDTO [start=" + start + ", end=" + end + ", total=" + total + "]";
	}
	public PageGroupDto(int start, int end, int total) {
		super();
		this.start = start;
		this.end = end;
		this.total = total;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	 
}
