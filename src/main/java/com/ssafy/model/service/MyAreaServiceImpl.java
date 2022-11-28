package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.MyArea;
import com.ssafy.model.repo.MyAreaRepo;

@Service
@Transactional
public class MyAreaServiceImpl implements MyAreaService {

	@Autowired
	MyAreaRepo repo;
	
	@Override
	public List<MyArea> selectAll(String memberId) throws SQLException {
		return repo.selectAll(memberId);
	}
	
	@Override
	public int insert(MyArea myarea) throws SQLException {
		return repo.insert(myarea);
	}


	@Override
	public int delete(int mid) throws SQLException {
		return repo.delete(mid);
	}

	@Override
	public MyArea select(Map map) throws SQLException {
		// TODO Auto-generated method stub
		return repo.select(map);
	}

	@Override
	public Map<String, String> searchByDongCode(String dongCode) throws SQLException {
		// TODO Auto-generated method stub
		return repo.searchByDongCode(dongCode);
	}
	
	

}
