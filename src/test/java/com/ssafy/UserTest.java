package com.ssafy;

//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//@SpringBootTest
//public class UserTest {
//
//	@Autowired
//	
//	
//
//}



import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Date;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.User;
import com.ssafy.model.service.UserService;

@SpringBootTest
@Transactional
public class UserTest {

    @Autowired
    UserService service;

    Date date = new Date();
    @Test
    void insertTest() throws SQLException {
        //give
    	User user = User.builder().email("ssafy@ssafy.com").uid("ssafy1").name("이싸피").pw("1234").token("").createdTime("2022-11-19 15:03:28").build();
        //when
        int result = service.insert(user);
        //then
        assertEquals(result, 1);
    }

    @Test
    void selectTest() throws SQLException {
    	Map<String, String> map = new HashMap<String, String>();
        //give
        String id = "ssafy";
        String pass = "1234";
        map.put("uid", id);
        map.put("pw", pass);
        //when
        User result = service.select(map);
        //then
        assertNotNull(result);
    }

    @Test
    void updateTest() throws SQLException {
        //give
    	User user = User.builder().email("ssafy1@ssafy.com").uid("ssafy").name("이싸피").pw("1234").token("").createdTime("").build();
        //when
        int result = service.update(user);
        //then
        assertEquals(result, 1);
    }

    @Test
    void deleteTest() throws SQLException {
        //give
        String id = "ssafy";
        //when
        int result = service.delete(id);
        //then
        assertEquals(result, 1);
    }

//    public User login(User User) throws Exception;
    @Test
    void loginTest() throws Exception {
        //give
        User user = User.builder().email("ssafy1@ssafy.com").uid("ssafy").name("이싸피").pw("1234").token("").createdTime("").build();
        Map<String, String> map = new HashMap<>();
        //when
        User result = service.login(user);
        //then
        System.out.println(result.toString());
//        log.debug("result : " + result.toString());
        assertNotNull(result);
    }

    @Test
    void userInfoTest() throws Exception {
        //give
        String id = "ssafy";
        //when
        User result = service.userInfo(id);
        //then
        System.out.println(result.toString());
//        log.debug("result : " + result.toString());
        assertNotNull(result);
    }

    @Test
    void saveRefreshTokenTest() throws Exception {
        //give
        String id = "ssafy";
        String refreshToken = "1ewfe1";

        //when
        int result = service.saveRefreshToken(id, refreshToken);

        //then
        assertEquals(result, 1);
    }

    @Test
    void deleteRefreshTokenTest() throws Exception {
        //give
        String id = "ssafy";

        //when
        int result = service.deleRefreshToken(id);

        //then
        assertEquals(result, 1);
    }


}