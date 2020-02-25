package com.ineat.oxo.vo;

public class SearchVO {
	private int num; 
	private String contents; // 검색 키워드
	private int price[];  // 가격대 필터 저장 배열 

	private int ml_no;
	private String tag;
	private String order="ml_no";
	
	private String ml_count;
	private String favorite;
	private String rv_cnt;
	
	
	
	public String getMl_count() {
		return ml_count;
	}
	public void setMl_count(String ml_count) {
		this.ml_count = ml_count;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getRv_cnt() {
		return rv_cnt;
	}
	public void setRv_cnt(String rv_cnt) {
		this.rv_cnt = rv_cnt;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public int getMl_no() {
		return ml_no;
	}
	public void setMl_no(int ml_no) {
		this.ml_no = ml_no;
	}
	public int[] getPrice() {
		return price;
	}
	public void setPrice(int[] price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
