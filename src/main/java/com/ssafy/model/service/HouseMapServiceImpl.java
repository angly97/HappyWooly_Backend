package com.ssafy.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.HouseInfo;
import com.ssafy.model.dto.HouseMap;
import com.ssafy.model.dto.SidoGugunCode;
import com.ssafy.model.repo.HouseMapRepo;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	private HouseMapRepo repo;

	@Override
	public List<SidoGugunCode> getSido() throws Exception {
		return repo.getSido();
	}

	@Override
	public List<SidoGugunCode> getGugunInSido(String sido) throws Exception {
		return repo.getGugunInSido(sido);
	}

	@Override
	public List<HouseMap> getDongInGugun(String gugun) throws Exception {
		return repo.getDongInGugun(gugun);
	}
}
