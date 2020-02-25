package com.ineat.oxo.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

// sbVO
public class StoryBoardVO {
	private int cnt;
	private int bno;
	private int mno;
	private int fno;
	private int writer;
	private String mid;
	private String title;
	private String content;
	private String content2;
	private Date sbDate;
	private int views;
	private MultipartFile sFile;
	private MultipartFile[] file;
	private String saveName;
	private String isshow;
	private int llike;
	private int hhate;
	private int cbno;
	private String cmid;
	private String ccontent;
	private int cno;
	private Date cDate;
	private int cmtCnt;
	private String sid;
	
	
	
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getCmtCnt() {
		return cmtCnt;
	}
	public void setCmtCnt(int cmtCnt) {
		this.cmtCnt = cmtCnt;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public int getCbno() {
		return cbno;
	}
	public void setCbno(int cbno) {
		this.cbno = cbno;
	}
	public String getCmid() {
		return cmid;
	}
	public void setCmid(String cmid) {
		this.cmid = cmid;
	}
	public int getLlike() {
		return llike;
	}
	public void setLlike(int llike) {
		this.llike = llike;
	}
	public int getHhate() {
		return hhate;
	}
	public void setHhate(int hhate) {
		this.hhate = hhate;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public MultipartFile getsFile() {
		return sFile;
	}
	public void setsFile(MultipartFile sFile) {
		this.sFile = sFile;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
		setContent2();
	}
	public Date getSbDate() {
		return sbDate;
	}
	public void setSbDate(Date sbDate) {
		this.sbDate = sbDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String toString() {
		return 
				"bno : " + bno + 
				" | mid : " + mid +
				" | title : " + title +
				" | content : " + content +
				" | writer : " + writer
				; 
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public void setContent2() {
		this.content2 = content.replaceAll("\r\n", "<br>");
	}
	
}
