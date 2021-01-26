package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Rest1;
import org.zerock.domain.Rest2;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
//@RestController가 되면 모든 메소드들의 결과값은 @ResponseBody 처리가 됨
//즉, 뷰로 전달되지 않고 데이터 자체가 전달됨
@RequestMapping("/rest2")
public class RestControllerEx2 {
	
	@RequestMapping("/ex1")
	public String method1() {
		return "hello";
	}
	
	@RequestMapping("/ex2")
	public Rest1 method2() {
		//전송, 수신 방법이 HTTP(HyperText Transport Protocol)규약을 따름
		//전송과 수신이 text로 이루어짐
		log.info("method2");
		
		Rest1 r = new Rest1();
		r.setName("donald");
		r.setAge(45);
		return r; 
		//HTTP규약이기 때문에 텍스트가 아닌 데이터를 전송, 수신하면 오류가 생김
	}
	
	@RequestMapping("/ex3")
	public String method3() {
		
		log.info("method2");
		
		Rest1 r = new Rest1();
		r.setName("donald");
		r.setAge(45);
//		String res = "이름 : " + r.getName() + ", " + "나이 : " + r.getAge();
//		HTTP로 인해 객체값도 텍스트로 변환해서 전달해야 함
//		객체를 텍스트로 표기하는 방법이 JSON(JavaScript Object Notation)
//		JSON : 자바스크립트를 이용한 객체 표기법
//		object = {"propertyName":"propertyValue", "propertyName2":"propertyValue2"}
		String res = "{\"Name\":\"" + r.getName() + "\", \"age\":" + r.getAge() + "}"; 
		//자바에서 큰타옴표 텍스트는 \"(역슬래쉬 큰따옴표)로 작성
//		Maven에 자바 객체를 JSON으로 변환해주는 라이브러리가 있으므로 활용하면 됨
		return res; 
	}
	
	@RequestMapping("/ex4")
	public Rest1 method4() {
		
		log.info("method2");
		
		Rest1 r = new Rest1();
		r.setName("donald");
		r.setAge(45);
		
		return r; 
	}
	
	@RequestMapping("/ex5")
	public Rest2 method5() {
		Rest2 r2 = new Rest2();
		r2.setAddress("seoul");
		r2.setNumbers(new int [] {1,2,3,4,5});
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("java", 1);
		map.put("spring", 2);
		map.put("python", 3);
		r2.setMap(map);
		
		Rest1 r1 = new Rest1();
		r1.setName("jeju");
		r1.setAge(100);
		r1.setVote(true);
		
		r2.setRest1(r1);
		
		return r2;
	}
	
	@RequestMapping("/ex6")
	public String[] method6() {
		String [] arr = {"java", "spring", "json"};
		return arr;
	}
	//배열, 리스트, Map 등 컬랙션 타입도 JSON으로 변환 가능
	@RequestMapping("/ex7")
	public List<String> method7() {
		List<String> list = new ArrayList<String>();
		list.add("java");
		list.add("spring");
		list.add("json");
		
		return list;
	}
	
	@RequestMapping("/ex8")
	public Map<String, String> method8() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("java", "script");
		map.put("hello", "world");
		map.put("spring", "boot");
		
		return map;
	}
	
	@RequestMapping("/ex9")
	public List<Rest1> method9() {
		List<Rest1> list = new ArrayList<Rest1>();
		
		Rest1 r1 = new Rest1();
		r1.setName("donald");
		r1.setAge(33);
		r1.setVote(true);
		list.add(r1);
		
		Rest1 r2 = new Rest1();
		r1.setName("biden");
		r1.setAge(45);
		r1.setVote(false);
		list.add(r2);
		
		return list;
	}
	
	//HTTP Response의 status code를 특정 status code로 응답할 때
	//ResponseEntity를 사용하면 status code와 header를 직접 작성할 수 있게 됨
	//ResponseEntity를 사용하지 않으면 status code와 header가 자동설정됨
	@RequestMapping("/ex10")
	public ResponseEntity<String> method10() {
//		ResponseEntity의 <?>(제네릭 타입)은 본문(body)의 타입
		return ResponseEntity.status(200).body("hello");		
	}
	
	@RequestMapping("/ex11")
	public ResponseEntity<String> method11(int num) {
		if(num > 0) {
			return ResponseEntity.status(200).body("spring");
		} else {
			return ResponseEntity.status(404).body("");
		}
	}
}
