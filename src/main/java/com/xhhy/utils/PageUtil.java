package com.xhhy.utils;

public class PageUtil {
	private int pageNum;//页码
	private int pageRows;//每页显示的条数
	private int totleRows ;//总共的记录数
	private int totlePages;//总共的页码
	
	public PageUtil(int pageNum, int pageRows, int totleRows) {
		super();
		this.pageNum = pageNum;
		this.pageRows = pageRows;
		this.totleRows = totleRows;
		this.totlePages = totleRows%pageRows==0?totleRows/pageRows:totleRows/pageRows+1;
	}
	public PageUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageRows() {
		return pageRows;
	}
	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}
	public int getTotleRows() {
		return totleRows;
	}
	public void setTotleRows(int totleRows) {
		this.totleRows = totleRows;
	}
	public int getTotlePages() {
		return totlePages;
	}
	public void setTotlePages(int totlePages) {
		this.totlePages = totlePages;
	}
	/**
	 * 记录上的起始位置
	 * @return
	 */
	public int getStart(){
		return (pageNum-1)*pageRows;
	}
	@Override
	public String toString() {
		return "PageUtil [pageNum=" + pageNum + ", pageRows=" + pageRows + ", totleRows=" + totleRows + ", totlePages="
				+ totlePages + "]";
	}
	
	
}
