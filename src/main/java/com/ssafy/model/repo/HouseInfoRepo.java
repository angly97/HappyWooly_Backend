package com.ssafy.model.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.HouseInfo;

@Mapper
public interface HouseInfoRepo {
	List<HouseInfo> getApts(String dongCode);
}
