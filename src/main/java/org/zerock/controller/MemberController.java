package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	private MemberService memberService;
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/signin")
	public void signin() {
		
	}
	@PostMapping("/signin")
	public String signin(MemberVO member, RedirectAttributes rttr) {
		log.info("signin........" + member);
		MemberVO existMember = memberService.get(member.getId());
		if(existMember == null) {
			memberService.signin(member);
			rttr.addFlashAttribute("signoutResult", "가입이 완료되었습니다");
			rttr.addFlashAttribute("signoutMessage", "ToDo Share를 시작하세요");
			return "redirect:/member/main";
		} else {
			rttr.addFlashAttribute("signinFail", "빈칸이 있거나 이미 존재하는 아이디 입니다.");
			return "redirect:/member/signin";
		}		
	}
	
	@GetMapping("/signout")
	public void signout() {
		
	}
	@PostMapping("/signout")
	public String signout(String id, String password, RedirectAttributes rttr) {
		MemberVO member = memberService.get(id);		
		log.info("signout.........." + member);
		if(member != null) {
			if(member.getPassword().equals(password)) {
				memberService.signout(id);
				rttr.addFlashAttribute("signoutResult", "탈퇴가 완료되었습니다");
				rttr.addFlashAttribute("signoutMessage", "이용해주셔서 감사합니다");
				return "redirect:/member/main";
			}else {
				rttr.addFlashAttribute("failByPassword", "잘못된 암호입니다.");
				return "redirect:/member/signout";
			}
		}else {
			rttr.addFlashAttribute("failById", "없는 아이디입니다.");
			return "redirect:/member/signout";
		}
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	@PostMapping("/login")
	public String login(String id, String password, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = memberService.get(id);
		log.info("login............." + member);
		if(member != null) {
			if(member.getPassword().equals(password)) {
				session.setAttribute("authUser", member);
				return "redirect:/member/main";
			}else {
				rttr.addFlashAttribute("wrongPassword", "잘못된 암호입니다.");
				return "redirect:/member/login";
			}			
		}else {
			rttr.addFlashAttribute("wrongId", "없는 아이디입니다.");
			return "redirect:/member/login";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);		
		log.info("logout.............." + session.getAttribute("authUser"));
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/member/main";
	}
}
