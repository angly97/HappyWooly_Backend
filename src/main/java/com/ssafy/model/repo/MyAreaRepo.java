package com.ssafy.model.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.model.dto.MyArea;

public interface MyAreaRepo {
	public List<MyArea> selectAll(String memberId) throws SQLException;
	public MyArea select(Map map) throws SQLException;
	public int insert(MyArea myarea) throws SQLException;
	public int delete(int mid) throws SQLException;
	public Map<String, String> searchByDongCode(String dongCode) throws SQLException;
}
