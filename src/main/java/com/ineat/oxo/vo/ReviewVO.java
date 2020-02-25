package com.ineat.oxo.vo;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//rvVO
public class ReviewVO {
	private int rv_no;
	private int rv_mlno;
	private int rv_mno;
	private String rv_body;
	private int rv_fno;
	private String s_score;
	private Double rv_score;
	private Date rv_date;
	private Time rv_time;
	private String m_id;
	private List<String> rf_savename;
	
	private MultipartFile[] sfile;
	
	private int cnt;
	
	private String p_savename;
	private String profile;
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getP_savename() {
		return p_savename;
	}
	public void setP_savename(String p_savename) {
		this.p_savename = p_savename;
	}
	public List<String> getRf_savename() {
		return rf_savename;
	}
	public void setRf_savename(List<String> rf_savename) {
		this.rf_savename = rf_savename;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getS_score() {
		return s_score;
	}
	public void setS_score(String s_score) {
		this.s_score = s_score;
	}
	public MultipartFile[] getSfile() {
		return sfile;
	}
	public void setSfile(MultipartFile[] sfile) {
		this.sfile = sfile;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public int getRv_mlno() {
		return rv_mlno;
	}
	public void setRv_mlno(int rv_mlno) {
		this.rv_mlno = rv_mlno;
	}
	public int getRv_mno() {
		return rv_mno;
	}
	public void setRv_mno(int rv_mno) {
		this.rv_mno = rv_mno;
	}
	public String getRv_body() {
		return rv_body;
	}
	public void setRv_body(String rv_body) {
		this.rv_body = rv_body;
	}
	public int getRv_fno() {
		return rv_fno;
	}
	public void setRv_fno(int rv_fno) {
		this.rv_fno = rv_fno;
	}
	public Double getRv_score() {
		return rv_score;
	}
	public void setRv_score(Double rv_score) {
		this.rv_score = rv_score;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	public Time getRv_time() {
		return rv_time;
	}
	public void setRv_time(Time rv_time) {
		this.rv_time = rv_time;
	}
	
	
}
