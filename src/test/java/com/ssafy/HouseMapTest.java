package com.ssafy;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.model.repo.HouseMapRepo;

@SpringBootTest
public class HouseMapTest {
	@Autowired
	HouseMapRepo repo;
	
	@Test
	public void getSido() {
		
	}
}
