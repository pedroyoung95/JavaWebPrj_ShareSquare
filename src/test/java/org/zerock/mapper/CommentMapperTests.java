package org.zerock.mapper;

import static org.junit.Assert.*;

import java.util.List;

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
public class CommentMapperTests {

	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
//	@Test
//	public void testGetList() {
//		List<CommentVO> list = mapper.getList();
//		assertEquals(list.size(), 7);
//	}
	
//	@Test
//	public void testInsert() {
//		CommentVO comment = new CommentVO();
//		comment.setBno(1L);
//		comment.setContent("새 댓글");
//		comment.setWriter("newbie");
//		
//		int before = mapper.getList().size();
//		mapper.insert(comment);
//		int after = mapper.getList().size();
//		assertEquals(before+1, after);
//	}
	
//	@Test
//	public void testInsertSelectKey() {
//		CommentVO comment = new CommentVO();
//		comment.setBno(1L);
//		comment.setContent("새 댓글");
//		comment.setWriter("newbie");
//		
//		int before = mapper.getList().size();
//		mapper.insertSelectKey(comment);
//		int after = mapper.getList().size();
//		assertEquals(before+1, after);
//	}
	
	@Test
	public void testRead() {
		assertNotNull(mapper.read(7L));
	}
	
//	@Test
//	public void testUpdate() {
//		CommentVO comment = mapper.read(7L);
//		comment.setContent("변경된 댓글 내용");
//		comment.setWriter("newbie");
//		
//		int cnt = mapper.update(comment);
//		assertEquals(cnt, 1);
//		
//		CommentVO updateComment = mapper.read(comment.getCno());
//		assertEquals("변경된 댓글 내용", updateComment.getContent());
//	}
	
	@Test
	public void testDelete() {
		CommentVO comment = new CommentVO();
		comment.setBno(1L);
		comment.setContent("새 댓글");
		comment.setWriter("newbie");		
		
		mapper.insertSelectKey(comment);		
		int before = mapper.getList().size();

		mapper.delete(comment.getCno());
		int after = mapper.getList().size();
		assertEquals(before-1, after);
	}
}
