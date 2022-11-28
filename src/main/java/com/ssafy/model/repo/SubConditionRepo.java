package com.ssafy.model.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.SubCondition;

@Mapper
public interface SubConditionRepo {
	List<SubCondition> getSubCondition(int age, int theme);
}
