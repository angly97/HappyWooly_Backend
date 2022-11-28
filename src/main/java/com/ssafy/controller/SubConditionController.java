package com.ssafy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.SubCondition;
import com.ssafy.model.service.SubConditionService;

@RestController
@RequestMapping("/sub-condition")
public class SubConditionController {
	@Autowired
	SubConditionService service;
	
	@GetMapping
	public ResponseEntity<?> getSubCondition(int age, int theme){
		List<SubCondition> result = service.getSubCondition(age, theme);
		return new ResponseEntity<List<SubCondition>>(result, HttpStatus.OK);
	}
}
