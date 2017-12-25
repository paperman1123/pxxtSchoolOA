package com.corporation.manager.domain;

public class announcementDTO {
	private String queryStartTime; // 筛选开始时间
	private String queryEndTime; // 筛选结束时间
	private String queryName; // 查询名字
	private String querySort; // 查询排序方式 desc降序 asc升序
	private String currCorporation; // 当前社团
	private int currPage;

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage2) {
		this.currPage = currPage2;
	}

	public String getQueryStartTime() {
		return queryStartTime;
	}

	public void setQueryStartTime(String queryStartTime) {
		this.queryStartTime = queryStartTime;
	}

	public String getQueryEndTime() {
		return queryEndTime;
	}

	public void setQueryEndTime(String queryEndTime) {
		this.queryEndTime = queryEndTime;
	}

	public String getQueryName() {
		return queryName;
	}

	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}

	public String getQuerySort() {
		return querySort;
	}

	public void setQuerySort(String querySort) {
		this.querySort = querySort;
	}

	public String getCurrCorporation() {
		return currCorporation;
	}

	public void setCurrCorporation(String currCorporation) {
		this.currCorporation = currCorporation;
	}

}
