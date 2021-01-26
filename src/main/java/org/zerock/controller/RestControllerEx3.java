package org.zerock.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Rest1;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/rest3")
public class RestControllerEx3 {

	@RequestMapping("/ex1")
	public String method1(String name) {
		log.info("name : " + name);
		return "spring";
	}
	
	@RequestMapping("/ex2/{val}") //Path Variable
	//@PathVariable : URL 상에 경로의 일부를 파라미터로 사용
	//URL 경로에 {}괄호 안 값을 파라미터로 사용할 수 있게 됨
	public String method2(@PathVariable("val") String value) {
		log.info("method2");
		log.info(value);
		return "method2";
	}
	
	@RequestMapping("/ex3/{val}")
	public String method3(@PathVariable String val) {
		log.info("method3");
		
		return val;
	}
	
	@RequestMapping("/ex4/{val}/other/{age}")
	//파리미터에 타입에 맞게 URL 경로의 일부를 자동으로 형변환해줌
	//{}괄호 안 명칭과 파라미터 이름이 같으면 자동으로 할당
	public String method4(@PathVariable String val, @PathVariable int age) {
		log.info("method4");
		return val + age;
	}
	
	@RequestMapping("/ex5")
	public String method5(@RequestBody String b) {
//@RequestBody : 전달된 요청(request)의 내용(body)를 파라미터로 변환
		log.info(b);
		return "method5";
	}
	
	@RequestMapping("/ex6")
	public String method6(@RequestBody Rest1 body) {
//JSON타입의 data를 객체에 맞게 자동으로 값을 할당해줌
		log.info(body);
		log.info(body.getName());
		return "method6";
	}
	
	//consumes의 값은 MIME타입
	//consumes : 특정 미디어 타입만 소비하겠다는 의미
	//Request Header의 Content-Type이 consumes의 값으로 설정됨
	//따라서 해당 타입의 data만 읽을 수 있게 됨
	@RequestMapping(path = "/ex7", consumes = "text/plain")
	//요청경로는 path 또는 value라고 명시하거나 생략가능함
	public String method7(@RequestBody String body) {
		log.info(body);
		return "method7";
	}
	
	//MediaType에 consumes에 넣을 값들이 상수로 들어가있으므로
	//해당 상수를 대신 사용하는 것이 더 편리(오타 줄임)
	@RequestMapping(path = "/ex8", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String method8(@RequestBody String body) {
		log.info(body);
		return "method8";
	}
	
	//consumes의 값을 배열로 여러 개의 값을 줄 수 있음
	@RequestMapping(path = "/ex9", 
			consumes = {MediaType.APPLICATION_JSON_VALUE,
						MediaType.TEXT_PLAIN_VALUE})
	public String method9(@RequestBody String body) {
		log.info(body);
		return "method9";
	}
}
