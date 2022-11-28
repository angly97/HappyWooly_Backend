package com.ssafy.model.dto;

public class BoardParameter {
	private String uid;
	private String aptCode;
	private int pg;
	private int spp;
	private int start;
	
	public BoardParameter() {
		pg = 1;
		spp = 20;
	}

	public String getUid() {
		return uid;
	}
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getAptCode() {
		return aptCode;
	}
	
	public void setAptCode(String aptCode) {
		this.aptCode = aptCode;
	}
	
	public int getPg() {
		return pg;
	}

	public void setPg(int pg) {
		pg = pg == 0 ? 1 : pg;
		this.pg = pg;
	}

	public int getSpp() {
		return spp;
	}

	public void setSpp(int spp) {
		this.spp = spp;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}
}

