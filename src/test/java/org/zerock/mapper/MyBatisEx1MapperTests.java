package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.Ex1Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyBatisEx1MapperTests {

	@Setter(onMethod_ = @Autowired)
	private MyBatisEx1Mapper mapper;
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	@Test
	public void testSelect1() {
		Ex1Criteria cri = new Ex1Criteria();
		cri.setBno(0);
		
		mapper.select1(cri);
	}
	
	@Test
	public void testSelectEx1() {
		Ex1Criteria cri = new Ex1Criteria();
		cri.setBno(1);
		
		mapper.select1(cri);
	}
}
