package org.zerock.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		List<BoardVO> list = mapper.getList();

		assertEquals(list.size(), 8);
	}
	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setWriter("newbie");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
//	
//	@Test
//	public void testInsertSelectKey() {
//			BoardVO board = new BoardVO();
//			board.setTitle("새로 작성하는 글 select key");
//			board.setContent("새로 작성하는 내용 select key");
//			board.setWriter("newbie");
//			
//			mapper.insertSelectKey(board);
//			
//			log.info(board);
//	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 제목");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		mapper.insertSelectKey(board);
		int before = mapper.getList().size();
		
		mapper.delete(board.getBno());
		int after = mapper.getList().size();
		
		assertEquals(before-1, after);
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(9L);
		board.setTitle("변경된 제목2");
		board.setContent("변경된 내용2");
		board.setWriter("user02");		
		int cnt = mapper.update(board);
		
		assertEquals(1, cnt);
		
		BoardVO updateVO = mapper.read(board.getBno());
		assertEquals("변경된 제목2", updateVO.getTitle());
		assertEquals("변경된 내용2", updateVO.getContent());
	}
}
