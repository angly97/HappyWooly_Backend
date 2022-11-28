package com.ssafy.model.repo;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.model.dto.User;

public interface UserRepo {
	public int insert(User user);
	public int update(User user);
	public int delete(String id);
	public User select(Map<String, String> map);
	public User login(User user) throws Exception;
	public User userInfo(String userid) throws SQLException;
	public int saveRefreshToken(Map<String, String> map) throws SQLException;
	public Object getRefreshToken(String userid) throws SQLException;
	public int deleteRefreshToken(Map<String, String> map) throws SQLException;

}
