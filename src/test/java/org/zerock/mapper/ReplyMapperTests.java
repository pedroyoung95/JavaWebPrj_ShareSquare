package org.zerock.mapper;

import static org.junit.Assert.assertEquals;	
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] bnoArr = {111L, 112L, 113L, 114L, 115L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testExist() {
		assertNotNull(mapper);
	}
	
	@Test //책 383쪽
	public void testCreate() {
//		rangeClosed의 시작 정수부터 끝 정수(끝 정수포함)를 Stream타입으로 리턴
		IntStream.rangeClosed(1, 10).forEach(i -> {
			log.info(i + ", " + i % 5);
			
			ReplyVO reply = new ReplyVO();
			reply.setBno(bnoArr[i % 5]);
			reply.setReply("댓글 테스트 " + i);
			reply.setReplyer("reply " + i);
			
			mapper.insert(reply);
		});
	}
	@Test
	public void testCreate2() {
		ReplyVO reply = new ReplyVO();
		reply.setBno(121L);
		reply.setReply("테스트 댓글");
		reply.setReplyer("테스터");
		
		mapper.insert(reply);
		
		try {
			reply.setBno(120L);
			reply.setReply("none");
			reply.setReplyer("none");
			mapper.insert(reply);
			fail();
		} catch (Exception e) {
			
		}		
	}
	
	@Test 
	public void testRead() {
		ReplyVO reply = mapper.read(1L);
		assertEquals("테스트 댓글", reply.getReply());
	}
	
	@Test
	public void testDelete() {
		try {
			Long rno = 1L;
			mapper.delete(rno);
			assertNull(mapper.read(rno));
		} catch (Exception e) {
			fail();
		}
		
	}
	
	@Test
	public void testUpdate() {
		ReplyVO reply = mapper.read(2L);
		reply.setReply("수정된 댓글 내용");
		mapper.update(reply);
		assertEquals("수정된 댓글 내용", mapper.read(2L).getReply());
	}
	
	@Test
	public void testList() {
		List<ReplyVO> list = mapper.getListWithPaging(121L, null);
		assertNotEquals(list.size(), 0);
	}
}
