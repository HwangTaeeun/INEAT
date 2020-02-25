package com.ineat.oxo.vo;

import java.util.List;

//tVO
public class TasteInfoVO {
	private int ml_no;
	private String ml_time;
	private String ml_title;
	private String ml_tel;
	private String ml_price;
	private String ml_newaddr;
	private String ml_oldaddr;
	private String ml_menu;
	private String ml_tag;
	private String ml_count;
	private String ml_isshow;
	private String ml_type ="cnt";
	private int rno;
	private String mf_filename;
	private List<ReviewVO> rvList;
	private String favorite;
	private String m_id;
	private double avg; //리뷰평균
	private int fvrcnt;
	
	public int getFvrcnt() {
		return fvrcnt;
	}
	public void setFvrcnt(int fvrcnt) {
		this.fvrcnt = fvrcnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public List<ReviewVO> getRvList() {
		return rvList;
	}
	public void setRvList(List<ReviewVO> rvList) {
		this.rvList = rvList;
	}
	public String getMf_filename() {
		return mf_filename;
	}
	public void setMf_filename(String mf_filename) {
		this.mf_filename = mf_filename;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMl_type() {
		return ml_type;
	}
	public void setMl_type(String ml_type) {
		this.ml_type = ml_type;
	}
	public int getMl_no() {
		return ml_no;
	}
	public void setMl_no(int ml_no) {
		this.ml_no = ml_no;
	}
	public String getMl_time() {
		return ml_time;
	}
	public void setMl_time(String ml_time) {
		this.ml_time = ml_time;
	}
	public String getMl_title() {
		return ml_title;
	}
	public void setMl_title(String ml_title) {
		this.ml_title = ml_title;
	}
	public String getMl_tel() {
		return ml_tel;
	}
	public void setMl_tel(String ml_tel) {
		this.ml_tel = ml_tel;
	}
	public String getMl_price() {
		return ml_price;
	}
	public void setMl_price(String ml_price) {
		this.ml_price = ml_price;
	}
	public String getMl_newaddr() {
		return ml_newaddr;
	}
	public void setMl_newaddr(String ml_newaddr) {
		this.ml_newaddr = ml_newaddr;
	}
	public String getMl_oldaddr() {
		return ml_oldaddr;
	}
	public void setMl_oldaddr(String ml_oldaddr) {
		this.ml_oldaddr = ml_oldaddr;
	}
	public String getMl_menu() {
		return ml_menu;
	}
	public void setMl_menu(String ml_menu) {
		this.ml_menu = ml_menu;
	}
	public String getMl_tag() {
		return ml_tag;
	}
	public void setMl_tag(String ml_tag) {
		this.ml_tag = ml_tag;
	}
	public String getMl_count() {
		return ml_count;
	}
	public void setMl_count(String ml_count) {
		this.ml_count = ml_count;
	}
	public String getMl_isshow() {
		return ml_isshow;
	}
	public void setMl_isshow(String ml_isshow) {
		this.ml_isshow = ml_isshow;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
	
	

}
