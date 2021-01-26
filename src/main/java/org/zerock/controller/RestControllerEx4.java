package org.zerock.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Rest1;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest4")
public class RestControllerEx4 {

	//produces는 consumes와 반대로 서버에서 클라이언트로 전송하는
	//Response Header의 Content-Type의 값을 결정
	//서버에서 클라이언트로 보내는 data의 미디어타입을 결정
	@RequestMapping(value = "/ex1", produces = MediaType.TEXT_PLAIN_VALUE)
	public String method1() {
		log.info("method1");
		return "hello";
	}
	
	@RequestMapping(value = "/ex2", produces = MediaType.APPLICATION_JSON_VALUE)
	public String method2() {
		log.info("method2");
		return "{}";
	}
	
	@RequestMapping(value = "/ex3", 
			produces = {MediaType.APPLICATION_JSON_VALUE,
						MediaType.APPLICATION_XML_VALUE})
//produces 값들 중 가장 먼저 나온 값이 기본 미디어 타입이 됨
//다른 미디어 타입으로도 응답을 보려면 URL뒤에 '.확장자'를 붙이면 됨
	public Rest1 method3() {
		log.info("method3");
		
		Rest1 r = new Rest1();
		r.setName("john");
		r.setAge(33);
		r.setVote(true);
		r.setObj(null);
		
		return r;
	}
	
	@RequestMapping(value = "/ex4", produces = MediaType.TEXT_PLAIN_VALUE)
	public String method4() {
		log.info("method4");		
		return "hello world";
//Request Headers에서 Accept의 값은 받아들이려는 미디어 타입을 결정
//응답의 미디어 타입과 Accept의 미디어 타입이 동일해야 클라이언트가 data를 받을 수 있음
	}
	
	@RequestMapping(value = "/ex5", produces = "text/plain;charset=UTF-8")
//produces는 Content-Type에 접근 가능하므로, charset를 따로 명시할 수 있음
//상수로 저장된 것은 없으므로 직접 작성해야 함
	public String method5() {
		log.info("method5");		
		return "스프링";
	}
}
