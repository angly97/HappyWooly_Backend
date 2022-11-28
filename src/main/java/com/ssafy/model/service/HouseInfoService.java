package com.ssafy.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.model.dto.HouseInfo;

@Service
public interface HouseInfoService {
	List<HouseInfo> getApts(String dongCode);
}
