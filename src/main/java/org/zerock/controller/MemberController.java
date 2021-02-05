package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.BoardService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService memberService;
	
	@RequestMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/signin")
	public void signin() {
		
	}
	@PostMapping("/signin")
	public String signin(MemberVO member, RedirectAttributes rttr) {
		try {
			memberService.signin(member);
			rttr.addFlashAttribute("signinSuccess", "회원 가입에 성공했습니다.");
			return "redirect:/member/login";
		} catch (Exception e) {
			rttr.addFlashAttribute("signinFail", "빠짐없이 작성해주세요.");
			return "redirect:/member/signin";
		}
		
	}
	
	@GetMapping("/signout")
	public void signout() {
		
	}
	@PostMapping("/signout")
	public String signout(String id, String password, RedirectAttributes rttr) {
		MemberVO member = memberService.get(id);		
		if(member != null) {
			if(member.getPassword().equals(password)) {
				rttr.addFlashAttribute("signoutSuccess", "회원 탈퇴가 완료되었습니다.");
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
	
	@PostMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);		
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/member/main";
	}
	
	@RequestMapping("/name")
	@ResponseBody
	public void newName() {
		
	}
	
	@PostMapping("/password")
	@ResponseBody
	public void newPassword() {
		
	}
}
