package com.ssafy.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.User;
import com.ssafy.model.repo.UserRepo;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepo repo;
	
	@Override
	public int insert(User user) {
		return repo.insert(user);
	}

	@Override
	public int update(User user) {
		return repo.update(user);
	}

	@Override
	public int delete(String id) {
		return repo.delete(id);
	}

//	@Override
//	public User select(Map<String, String> map) {
//		return repo.select(map);
//	}
	@Override
	public User select(Map<String, String> map) {
		return repo.select(map);
	}
	
	@Override
	public User login(User user) throws Exception {
		if (user.getUid() == null || user.getPw() == null)
			return null;
		return repo.login(user);
	}
	
	@Override
	public User userInfo(String uid) throws Exception {
		return repo.userInfo(uid);
	}
	
	@Override
	public int saveRefreshToken(String userid, String refreshToken) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid", userid);
		map.put("token", refreshToken);
		return repo.saveRefreshToken(map);
	}

	@Override
	public Object getRefreshToken(String userid) throws Exception {
		return repo.getRefreshToken(userid);
	}

	@Override
	public int deleRefreshToken(String userid) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid", userid);
		map.put("token", null);
		return repo.deleteRefreshToken(map);
	}

}
