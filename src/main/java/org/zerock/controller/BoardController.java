package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.FileVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;
import org.zerock.service.FileUpService;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private FileUpService fileupService;
	private BoardService service;
	private ReplyService replyService;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("list : " + cri);
		
		List<BoardVO> boardList = service.getList(cri);
		for(BoardVO board : boardList) {
			board.setReplyCnt(service.updateReplyCnt(board.getBno())); 
		}
		model.addAttribute("list", boardList);
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri) {
		
	}
	@PostMapping("/register")
	public String register(BoardVO board, FileVO fileVO, MultipartFile[] files, RedirectAttributes rttr) {
		log.info("register : " + board);
		
		fileVO.setFilename("");
		
		if(board.getTitle() == null) {
			rttr.addFlashAttribute("nullTitle", "제목을 입력해주세요");
			return "redirect:/board/register";
		}else if(board.getContent() == null) {
			rttr.addFlashAttribute("nullContent", "내용을 입력해주세요");
			return "redirect:/board/register";
		}
		service.register(board);		
		
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
				try {
					fileVO.setFilename(board.getBno() + "_" + file.getOriginalFilename());
					fileVO.setBno(board.getBno());
					fileupService.transfer(file, fileVO.getFilename());
					fileupService.register(fileVO);									
				} catch (Exception e) {
					e.printStackTrace();
					rttr.addFlashAttribute("uploadFail", board.getBno());
					return "redirect:/board/register";
				}
			}					
		}
		
		rttr.addFlashAttribute("message", board.getBno() + "번 글이 등록되었습니다.");
		return "redirect:/board/list";
		
	}
	
	@GetMapping({"/get", "/modify"})  
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get");
		log.info(cri);
		
		BoardVO board = service.get(bno);
		board.setReplyCnt(service.updateReplyCnt(bno));
		
		List<FileVO> images = fileupService.readFiles(bno);
		
		model.addAttribute("images", images);
		model.addAttribute("board", board);
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		
		if(board.getTitle() == null) {
			rttr.addFlashAttribute("message", "제목을 입력해주세요");
			return "redirect:/board/list";
		}else if(board.getContent() == null) {
			rttr.addFlashAttribute("message", "내용을 입력해주세요");
			return "redirect:/board/list";
		}
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("message", board.getBno() + "번 글이 수정되었습니다.");
		}		
		
		log.info(cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		if(service.get(bno) != null) {			
			List<FileVO> files = fileupService.readFiles(bno);
			for(FileVO file : files) {
				if(!files.isEmpty()) {
					try {
						fileupService.fileDelete(file.getFilename());
						fileupService.deleteWithBoard(bno);	
					} catch (Exception e) {
						e.printStackTrace();
						return "redirect:/board/list";
					}
				}
			}				
			replyService.deleteBoard(bno);
			if(service.remove(bno)) {
				rttr.addFlashAttribute("result", "success");
				rttr.addFlashAttribute("message", bno + "번 글이 삭제되었습니다.");
			}	
		}
		log.info(cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
}
