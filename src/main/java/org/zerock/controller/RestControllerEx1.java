package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rest1")
@Log4j
public class RestControllerEx1 {

	@RequestMapping("/ex1")
	@ResponseBody
	public String method1() {
		log.info("method1");
		return "hello";
		//응답값이 jsp가 되는 것과 응답값 자체가 되는 것에 차이
		//컨트롤러가 jsp에 결과를 뿌리면 브라우저에서는 유용함
		//그러나 컨트롤러의 결과가 jsp로 가지 않고 바로 어디론가로 보내진다면
		//예를 들어 안드로이드 앱, ios앱, 윈도우 앱에서 바로 받은 그 값을 적절히 처리
		//위 세가지는 jsp, 즉 화면이 필요X, 데이터만 필요함
		//컨트롤러의 메소드가 리턴하는 것이 jsp이름이 아닌 data그 자체로 보내주려고 함
		//@ResponseBody어노테이션으로 가능
		//@RequestMapping + @ResponseBody를 합친 컨트롤러 어노테이션이 @RestController
	}
}
