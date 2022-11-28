package com.ssafy.model.dto;

import lombok.Data;

@Data
public class HouseInfo {
	private String aptCode;
	private String aptName;		// column apartmentName
	private int buildYear;
	private String sidoName;
	private String gugunName;
	private String dongName;
	private String roadName;
	private String roadNameBonbun;
	private String roadNameBubun;
	private String lat;
	private String lng;
	private String recentAmount;
	private String area;
	private String floor;
}
