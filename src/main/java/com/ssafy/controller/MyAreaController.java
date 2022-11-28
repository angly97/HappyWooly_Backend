package com.ssafy.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.MyArea;
import com.ssafy.model.service.MyAreaService;

@RestController
@RequestMapping("/myarea")
public class MyAreaController {
	
	@Autowired
	MyAreaService service;

	@PostMapping("/insert")
	public ResponseEntity<?> insertMyArea(@RequestBody MyArea myarea) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		int result = -1;
		HttpStatus status=null;
		try {
			map.put("uid", myarea.getUid());
			map.put("dongCode", myarea.getDongCode());
			map.put("age", myarea.getAge());
			map.put("theme", myarea.getTheme());
			
			MyArea area = service.select(map);
			System.out.println(map.get("uid"));
			if(area==null) {
				result = service.insert(myarea);
			}
			status = HttpStatus.ACCEPTED;
			if(result != 1) {
				status = HttpStatus.CONFLICT;
			}
			
		} catch(Exception e) {
			return exceptionHandling(e);
		}

		return new ResponseEntity<Integer> (result, status);
	}
	
	@DeleteMapping("/{mid}")
	public ResponseEntity<?> delete(@PathVariable int mid){
		int result = -1;
		try {
			result = service.delete(mid);
			return new ResponseEntity<Integer>(result, HttpStatus.OK);

		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
//	@GetMapping()
//	public ResponseEntity<?> select(String uid){
//		MyArea result = null;
//		try { 
//			result = service.select(map)
//		}catch(Exception e) {
//			return exceptionHandling(e);
//		}
//	}
	
	@GetMapping("/{uid}")
	public ResponseEntity<?> selectAll(@PathVariable String uid){
		List<MyArea> result = null;
		try { 
			result = service.selectAll(uid);
			return new ResponseEntity<List<MyArea>>(result, HttpStatus.OK);
			
		}catch(Exception e) {
			return exceptionHandling(e);
		}
	}
	
	@GetMapping("/dong/{dongCode}")
	public ResponseEntity<?> searchByDongCode(@PathVariable String dongCode){
		Map<String, String> result = null;
		try { 
			result = service.searchByDongCode(dongCode);
			return new ResponseEntity<Map<String, String>>(result, HttpStatus.OK);
			
		}catch(Exception e) {
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Sorry: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}