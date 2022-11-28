package com.ssafy.model.repo;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.HouseMap;
import com.ssafy.model.dto.SidoGugunCode;

@Mapper
public interface HouseMapRepo {
	List<SidoGugunCode> getSido() throws SQLException;
	List<SidoGugunCode> getGugunInSido(String sido) throws SQLException;
	List<HouseMap> getDongInGugun(String gugun) throws SQLException;	
}
