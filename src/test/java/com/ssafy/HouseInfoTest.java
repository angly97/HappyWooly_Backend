package com.ssafy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.model.dto.HouseInfo;
import com.ssafy.model.repo.HouseInfoRepo;

@SpringBootTest
public class HouseInfoTest {
	@Autowired
	HouseInfoRepo repo;
	
	@Test
	public void getAptsTest() {
		List<HouseInfo> results = repo.getApts("2817710600");
		
		assertEquals(results.size(), 20);
	}
}
