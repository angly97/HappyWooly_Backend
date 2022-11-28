package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.SubCondition;
import com.ssafy.model.repo.SubConditionRepo;

@Service
public class SubConditionServiceImpl implements SubConditionService {
	@Autowired
	SubConditionRepo repo;
	
	@Override
	public List<SubCondition> getSubCondition(int age, int theme) {
		return repo.getSubCondition(age, theme);
	}

}
