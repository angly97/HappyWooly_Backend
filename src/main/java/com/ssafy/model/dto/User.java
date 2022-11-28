package com.ssafy.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
	private String uid;
	private String pw;
	private String name;
	private String email;
	private String token;
	private String createdTime;
}
