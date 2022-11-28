package com.ssafy;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.MyArea;
import com.ssafy.model.service.MyAreaService;

@SpringBootTest
@Transactional
public class MyAreaTest {
	
	@Autowired
	MyAreaService service;
	
	@Test
	void insertTest() throws SQLException{
		MyArea area = MyArea.builder().uid("ssafy").dongCode("1100000000").age(1).theme(2).build();
		
		int result = service.insert(area);
		
		assertEquals(result, 1);
	}
	
	
//	@Test
//	void deleteTest() throws SQLException{
//		MyArea area = MyArea.builder().uid("ssafy").dongCode("1100000000").age(1).theme(2).build();
//		
//		int result = service.delete(area);
//		
//		assertEquals(result, 1);
//	}
	
	@Test
	void selectAllTest() throws SQLException{
		String uid = "ssafy";
		List<MyArea> result = service.selectAll(uid);
		
		assertEquals(result.size(), 1); 
	}
	
	@Test
	void selectTest() throws SQLException{
		String uid = "ssafy";
		String dongCode = "1111000000";
		Map<String, String> map = new HashMap<>();
		map.put("uid", uid);
		map.put("dongCode", dongCode);
		MyArea result = service.select(map);
		
		assertNotNull(result); 
	}
	
}
