package com.ssafy.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	private int articleno;
	private String uid;
	private String aptCode;
	private String subject;
	private String content;
	private int hit;
	private String regtime;

}