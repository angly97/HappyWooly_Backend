package com.ssafy.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubCondition {
	private int scid;
	private int cid;
	private String thirdName;
	private int radius;
}
