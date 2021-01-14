package org.zerock.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.CommentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentServiceTest {

	@Setter(onMethod_ = @Autowired)
	private CommentService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
//	@Test
//	public void testRegister() {
//		CommentVO comment = new CommentVO();
//		comment.setBno(2L);
//		comment.setContent("새 댓글 내용");
//		comment.setWriter("user00");
//		
//		int before = service.getList().size();
//		service.register(comment);
//		int after = service.getList().size();
//		assertEquals(before+1, after);
//	}
	
	@Test
	public void testGet() {
		assertNotNull(service.get(14L));
	}
	
	@Test public void testGetList() {
		assertEquals(service.getList().size(), 10);
	}
	
	@Test
	public void testUpdate() {
		CommentVO comment = service.get(1L);
		comment.setContent("변경된 댓글 내용");
		
		assertEquals(service.modify(comment), true);
	}
	
	@Test
	public void testDelete() {
		CommentVO comment = new CommentVO();
		comment.setBno(2L);
		comment.setContent("새 댓글 내용");
		comment.setWriter("user01");
		
		int before = service.getList().size();
		service.register(comment);
		service.remove(comment.getCno());
		int after = service.getList().size();
		assertEquals(before, after);
	}

}
