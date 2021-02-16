package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.BoardService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	private MemberService memberService;
	private BoardService boardService;
	
	@GetMapping("/main")
	public void main(HttpServletRequest req) {
	
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
			rttr.addFlashAttribute("result", "가입이 완료되었습니다");
			rttr.addFlashAttribute("message", "Share Square를 시작하세요");
			return "redirect:/member/main";
		} else {
			rttr.addFlashAttribute("signinFail", "빈칸이 있거나 이미 존재하는 아이디 혹은 이름 입니다");
			return "redirect:/member/signin";
		}		
	}
	
	@GetMapping("/signout")
	public void signout() {
		
	}
	@PostMapping("/signout")
	public String signout(String id, String password, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("signout.........." + id);
		if(memberService.signout(id, password)) {				
			rttr.addFlashAttribute("result", "탈퇴가 완료되었습니다");
			rttr.addFlashAttribute("message", "이용해주셔서 감사합니다");
			HttpSession session = req.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			return "redirect:/member/main";			
		}else {
			rttr.addFlashAttribute("signoutFail", "아이디 혹은 암호가 잘못 되었습니다");
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
				rttr.addFlashAttribute("result", "로그인에 성공했습니다");
				rttr.addFlashAttribute("message", "활동을 시작해보세요");
				return "redirect:/member/main";
			}else {
				rttr.addFlashAttribute("wrongPassword", "잘못된 암호입니다");
				return "redirect:/member/login";
			}			
		}else {
			rttr.addFlashAttribute("wrongId", "없는 아이디입니다");
			return "redirect:/member/login";
		}		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession(false);		
		log.info("logout.............." + session.getAttribute("authUser"));
		if(session != null) {
			session.invalidate();
		}
		rttr.addFlashAttribute("result", "알림");
		rttr.addFlashAttribute("message", "로그아웃되었습니다.");
		return "redirect:/member/main";
	}
	
	@GetMapping("/info")
	public void info(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(false);
		log.info("info.............." + session.getAttribute("authUser"));
		MemberVO member = (MemberVO)session.getAttribute("authUser");
		
		int boardCnt = memberService.boardCnt(member.getId());
		member.setBoardCnt(boardCnt);
		
		model.addAttribute("member", memberService.get(member.getId()));
	}
	@PostMapping("/info")
	public String changeName(String id, String name, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("changeName................" + memberService.get(id).getName());
		memberService.modifyName(id, name); 
		rttr.addFlashAttribute("result", "변경 완료");
		rttr.addFlashAttribute("message", "이름이 변경되었습니다");
		
		HttpSession session = req.getSession(false);
		session.setAttribute("authUser", memberService.get(id));
		
		String writer_id = id;
		String writer_name = name;
		boardService.updateWriterName(writer_id, writer_name);
		
		return "redirect:/member/info";		
	}
	
	@GetMapping("/changePw")
	public void changePw() {
		
	}
	@PostMapping("/changePw")
	public String changePassword(String id, String password, RedirectAttributes rttr) {
		log.info("changePassword................" + memberService.get(id).getPassword());
		if(memberService.modifyPassword(id, password)) {
			rttr.addFlashAttribute("result", "암호 변경 완료");
			rttr.addFlashAttribute("message", "다음부터 새 암호로 로그인하세요");
			return "redirect:/member/main";
		}else {
			rttr.addFlashAttribute("changeFail", "없는 아이디이거나 새 암호가 없습니다");
			return "redirect:/member/changePw";
		}
	}
}
