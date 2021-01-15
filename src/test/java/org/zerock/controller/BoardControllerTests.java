package org.zerock.controller;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.service.BoardServiceTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	private MockMvc mockMvc;
	//mock : 가짜의, 모의의(흉내를 내는 느낌)
	//MockMvc : 모의 mvc를 만들어서 실제 서버 실행을 안 해도 웹 앱을 테스트 할 수 있음
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testExist() {
		assertNotNull(ctx);
		assertNotNull(mockMvc);
	}
	
	@Test
	public void testList() throws Exception {
		ModelAndView mv = mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView();

		Map<String, Object> model = mv.getModel();
		Object o = model.get("list");
		
		String viewName = mv.getViewName();
		
		log.info(viewName + "##################################");
		assertNotNull(o);
		assertTrue(o instanceof List);
		assertNotEquals(((List) o).size(), 0);
		//MockMvcRequestBuilders.get("/board/list") -> 모의 브라우저 요청
//		ResultActions result = mockMvc.perform(MockMvcRequestBuilders.get("/board/list"));
//		MvcResult rs = result.andReturn(); -> .andReturn() : MockMvc의 실행결과
//		ModelAndView mv = rs.getModelAndView(); -> .getModelAndView() : 뷰에 대한 정보
	}
	
//	@Test
//	public void testRegister() throws Exception {
//		int before = mapper.getList().size();
//		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
//				.param("title", "테스트 새글 제목")
//				.param("content", "테스트 새글 내용")
//				.param("writer", "user00"))
//				.andReturn();
//		
//		ModelAndView mv = result.getModelAndView();
//		FlashMap map = result.getFlashMap();
//		
//		int after = mapper.getList().size();
//		
//		assertEquals(before + 1, after);
//		assertEquals("redirect:/board/list", mv.getViewName());
//		assertNotNull(map.get("result"));
//		
//		log.info(map.get("result") + "*************************");
//	}
	
	@Test
	public void testGet() throws Exception {
		MvcResult result =  mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "5")).andReturn();
		String viewName = result.getModelAndView().getViewName();
		Map<String, Object> modelMap = result.getModelAndView().getModel();
		
		assertEquals("board/get", viewName);
		assertNotNull(modelMap.get("board"));
		assertEquals(new Long(5), ((BoardVO) modelMap.get("board")).getBno());
//		.param("파라미터명", "파라미터값") : 모의 웹 앱에 파라미터를 보내줌
	}
	
//	@Test
//	public void testModify() throws Exception {
//		MvcResult result =  mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
//				.param("bno", "4")
//				.param("title", "수정된 테스트 새 글 제목")
//				.param("content", "수정된 테스트 새 글 내용")
//				.param("writer", "user00"))
//				.andReturn();
//		String viewName = result.getModelAndView().getViewName();
//		FlashMap map = result.getFlashMap();
//		BoardVO board = mapper.read(4L);
//		
//		assertEquals("수정된 테스트 새 글 제목", board.getTitle());
//		assertEquals("수정된 테스트 새 글 내용", board.getContent());
//		assertEquals(viewName, "redirect:/board/list");
//		assertNotNull(map.get("result"));		
//	}

//	@Test
//	public void testRemove() throws Exception {
//		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//				.param("bno", "3")).andReturn();
//		
//		String viewName = result.getModelAndView().getViewName();
//		FlashMap map = result.getFlashMap();
//		
//		assertEquals(viewName, "redirect:/board/list");
//		assertNotNull(map.get("result"));	
//	}
}
