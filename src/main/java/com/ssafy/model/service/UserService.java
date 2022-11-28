package com.ssafy.model.service;

import java.util.Map;

import com.ssafy.model.dto.User;

public interface UserService {
	public int insert(User user);
	public int update(User user);
	public int delete(String id);
	public User select(Map<String, String> map);
	public User login(User user) throws Exception;
	public User userInfo(String userid) throws Exception;
	public int saveRefreshToken(String userid, String refreshToken) throws Exception;
	public Object getRefreshToken(String userid) throws Exception;
	public int deleRefreshToken(String userid) throws Exception;
}
