package org.zerock.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test
	public void testExist() {
		assertNotNull(service);
	}
	
//	@Test
//	public void testRegister() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새 글 제목");
//		board.setContent("새 글 내용");
//		board.setWriter("새 작성자");
//		
//		int before = service.getList().size();		
//		service.register(board);
//		int after = service.getList().size();		
//		assertEquals(before+1, after);
//	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria(2, 5);
		List<BoardVO> list = service.getList(cri);
		
		assertNotEquals(list.size(), 0);
		assertEquals(list.size(), 5);
	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO board = service.get(1L);
//		board.setTitle("제목 수정합니다.");
//		board.setContent("내용 수정합니다.");
//		
//		assertEquals(service.modify(board), true);
//	}
	
//	@Test
//	public void testDelete() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새 글 제목");
//		board.setContent("새 글 내용");
//		board.setWriter("새 작성자");
//		
//		int before = service.getList().size();		
//		service.register(board);
//		service.remove(board.getBno());
//		int after = service.getList().size();	
//		assertEquals(before, after);
//	}

}
