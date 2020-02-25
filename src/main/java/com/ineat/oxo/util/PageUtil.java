package com.ineat.oxo.util;

/**
 *    이 클래스는 페이지 이동 기능에 필요한 정보를 계산하기 위해서
 *    만들어진 유틸리티적인 클래스이다.
 * 
 * @author   김민재
 * @since   2019.12.03
 * @version   v.1.0
 * @see
 *          변경이력
 *             2019.12.03      - 클래스 제작      - 담당자 : 김민재
 *
 */

//pUtil
public class PageUtil {
   // 변수 선언
   private int nowPage;    // 현재 보고있는 페이지
   private int totalCount;   // 총 게시물 수
   
   private int pageRow;   // 한페이지당 보여줄 게시물 수
   private int pageGroup;   // 한 화면당 이동가능 페이지 수
   
   private int startPage;   // 해당화면에서 나타날 이동 시작 페이지
   private int endPage;
   
   private int startCont;   // 현재페이지에서 보여줄 시작 게시물 번호
   private int endCont;   // 현재 페이지에서 보여줄 마지막 게시물 번호
   
   private int totalPage;   // 총 페이지 수
   
   public PageUtil() {
   }
   
   public void setVar(int nowPage, int totalCount, int pageRow, int pageGroup) {
	      this.nowPage = nowPage;
	      this.totalCount = totalCount;
	      this.pageRow = pageRow;
	      this.pageGroup = pageGroup;
	      
	      // 나머지 변수를 계산해서 채워준다.
	      calcPage();
	      calcStart();
	      calcEnd();
	      calcCont();
	   }
   
   public PageUtil(int nowPage, int totalCount) {
      this.nowPage = nowPage;
      this.totalCount = totalCount;
      this.pageRow = 3;
      this.pageGroup = 3;
      
      // 나머지 변수를 계산해서 채워준다.
      calcPage();
      calcStart();
      calcEnd();
      calcCont();
   }

   // 총 페이지 수를 계산하는 함수
   public void calcPage() {
      /*
         총 페이지수는 총 게시물 수를 한화면에 표시할 게시물 갯수로 나누면 된다.
         
         단, 경우에 따라서는 한페이지가 증가 될 수 있다.
       */
      totalPage = (totalCount % pageRow == 0) ? (totalCount / pageRow) : (totalCount / pageRow + 1);
   }
   
   // 시작페이지를 계산할 함수
   public void calcStart() {
      // 현재 보는 페이지의 그룹을 계산하고
      int tmpGroup = (nowPage - 1) / pageGroup;
      
      // 현재 보는 페이지 그룹의 시작페이지번호를 계산
      startPage = tmpGroup * pageGroup + 1 ;
   }
   
   // 종료 페이지 숫자를 계산해주는 함수
   public void calcEnd() {
      int tmpGroup = (nowPage - 1) / pageGroup;
      endPage = (tmpGroup + 1) * pageGroup;
      
      if(endPage > totalPage) {
         endPage = totalPage;
      }
   }
   
   // 시작과 종료게시물 번호 계산해주는 함수
   public void calcCont() {
      startCont = (nowPage -1) * pageRow + 1;
      endCont = nowPage * pageRow;
   }
   public int getNowPage() {
      return nowPage;
   }
   public void setNowPage(int nowPage) {
      this.nowPage = nowPage;
   }
   public int getTotalCount() {
      return totalCount;
   }
   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
   }
   public int getPageRow() {
      return pageRow;
   }
   public void setPageRow(int pageRow) {
      this.pageRow = pageRow;
   }
   public int getPageGroup() {
      return pageGroup;
   }
   public void setPageGroup(int pageGroup) {
      this.pageGroup = pageGroup;
   }
   public int getStartPage() {
      return startPage;
   }
   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }
   public int getEndPage() {
      return endPage;
   }
   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }
   public int getStartCont() {
      return startCont;
   }
   public void setStartCont(int startCont) {
      this.startCont = startCont;
   }
   public int getEndCont() {
      return endCont;
   }
   public void setEndCont(int endCont) {
      this.endCont = endCont;
   }
   public int getTotalPage() {
      return totalPage;
   }
   public void setTotalPage(int totalPage) {
      this.totalPage = totalPage;
   }
   
   

}
