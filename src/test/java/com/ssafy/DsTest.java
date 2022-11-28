package com.ssafy;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DsTest {
	@Autowired
	DataSource ds;
	
	@Autowired
	SqlSessionFactory factory;
	
	@Test
	void testDs() throws SQLException {
		assertNotNull(ds);
		
		Connection con = ds.getConnection();
		assertNotNull(con);
	}
	
	@Test
	void testFactory() {
		assertNotNull(factory);
	}
}
