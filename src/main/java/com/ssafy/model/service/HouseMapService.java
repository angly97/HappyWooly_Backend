package com.ssafy.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.model.dto.HouseMap;
import com.ssafy.model.dto.SidoGugunCode;

@Service
public interface HouseMapService {
	List<SidoGugunCode> getSido() throws Exception;
	List<SidoGugunCode> getGugunInSido(String sido) throws Exception;
	List<HouseMap> getDongInGugun(String gugun) throws Exception;
}
