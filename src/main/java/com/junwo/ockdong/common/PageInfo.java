package com.junwo.ockdong.common;

public class PageInfo {
	// 페이징 처리 한다고 할때 리스트의 전체 갯수 필요함
	private int currentPage; // 현재 페이지
	private int listCount; // 총 페이지
	private int limit; // 한번에 보여줄 페이지 수
	private int maxPage; // 전체 페이징 마지막 페이지
	private int startPage; //현제 페이지에서 보여질 페이징의 시작점
	private int endPage; // 현재 페이지에서 보여질 게시글 최대 개수
	private int boardLimit; // 딱히 없어도 문제 없을듯 함
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	
	
	
	public PageInfo() {
		super();
	}
	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage,
	        int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.boardLimit = boardLimit;
	}
	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
		        + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", boardLimit=" + boardLimit + "]";
	}
	
	
	
	
	
	
}
