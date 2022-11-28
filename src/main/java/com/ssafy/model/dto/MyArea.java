package com.ssafy.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyArea {
	private int mid;
	private String uid;
	private String dongCode;
	private int age;
	private int theme;
}
