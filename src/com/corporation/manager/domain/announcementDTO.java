package com.corporation.manager.domain;

public class announcementDTO {
	private String queryStartTime; // ɸѡ��ʼʱ��
	private String queryEndTime; // ɸѡ����ʱ��
	private String queryName; // ��ѯ����
	private String querySort; // ��ѯ����ʽ desc���� asc����
	private String currCorporation; // ��ǰ����
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
