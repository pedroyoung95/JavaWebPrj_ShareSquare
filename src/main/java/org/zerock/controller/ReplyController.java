package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@Log4j
@RestController
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	//consumes : 클라이언트가 서버에게 보내는 data를 어떤 미디어 타입으로 소비하라고 지시
	//produces : 서버가 클라이언트에게 data를 어떤 미디어 타입으로 전송했다고 명시
	@PostMapping(path = "/new",
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVO reply) {
		log.info("reply : " + reply);
		
		int insertCount = service.register(reply);
		
		log.info("insertCount : " + insertCount);
		
		if(insertCount == 1) {
			return new ResponseEntity<>("success999", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//댓글 목록은 서버에서 클라이언트로 data를 보내는 행위이므로
	//produces만 필요
	@GetMapping(path = "/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		Criteria cri = new Criteria(page, 10);
		List<ReplyVO> list = service.getList(cri, bno);
		
		log.info(list);
		return new ResponseEntity<List<ReplyVO>> (list, HttpStatus.OK);
	}
	
	@GetMapping(path = "/{rno}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
		ReplyVO vo = service.get(rno);
		
		return new ResponseEntity<ReplyVO> (vo, HttpStatus.OK);
	}
	
	//댓글 조회 메소드랑 같은 경로이지만 get 방식으로 가면 조회 실행
	//delete 방식으로 가면 삭제 실행
	@DeleteMapping(path = "/{rno}",
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		int removeCount = service.remove(rno);
		
		log.info(removeCount);
		
		if(removeCount == 1) {
			return new ResponseEntity<>("success999", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//'/{rno}'경로 중 PUT 또는 PATCH방식으로 오는 경우에는 수정 메소드가 실행
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			path = "/{rno}",
			consumes = MediaType.APPLICATION_JSON_VALUE,
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody ReplyVO reply, @PathVariable Long rno) {
		reply.setRno(rno);
		
		int modifyCount = service.modify(reply);
		
		log.info(modifyCount);
		
		if(modifyCount == 1) {
			return new ResponseEntity<String>("success999", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
