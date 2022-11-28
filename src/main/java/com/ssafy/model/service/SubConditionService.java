package com.ssafy.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.SubCondition;

public interface SubConditionService {
	List<SubCondition> getSubCondition(int age, int theme);
}
