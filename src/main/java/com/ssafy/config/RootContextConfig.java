package com.ssafy.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

import com.ssafy.model.repo.UserRepo;

@Configuration
@MapperScan(basePackageClasses = UserRepo.class)
public class RootContextConfig {
	
}
