package com.ssafy.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.HouseInfo;
import com.ssafy.model.service.HouseInfoService;

@RestController
@RequestMapping("/house-info")
public class HouseInfoController {
	@Autowired
	HouseInfoService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HouseInfoController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@GetMapping
	public ResponseEntity<?> searchApt(String dongCode) throws SQLException{	
		List<HouseInfo> result = service.getApts(dongCode);
		return new ResponseEntity<List<HouseInfo>> (result, HttpStatus.OK);
	}
}
