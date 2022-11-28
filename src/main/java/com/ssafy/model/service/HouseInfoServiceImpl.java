package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.HouseInfo;
import com.ssafy.model.repo.HouseInfoRepo;

@Service
public class HouseInfoServiceImpl implements HouseInfoService {

	@Autowired
	HouseInfoRepo repo;
	
	@Override
	public List<HouseInfo> getApts(String dongCode) {
		return repo.getApts(dongCode);
	}

}
