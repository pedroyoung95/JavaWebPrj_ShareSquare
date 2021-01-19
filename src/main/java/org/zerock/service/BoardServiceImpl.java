package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {	
		log.info("register......" + board);		
		mapper.insertSelectKey(board);
	}
	
	@Override
	public BoardVO get(Long bno) {
		log.info("get........." + bno);		
		return mapper.read(bno);
	}
	
//	@Override
//	public List<BoardVO> getList() {
//		log.info("getLsit...........");		
//		return mapper.getList();
//	}
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getListWithPaging........");
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify...........");
		int cnt = mapper.update(board);
		return cnt == 1;
	}
	
	@Override
	public boolean remove(Long bno) {
		log.info("remove...........");
		int cnt = mapper.delete(bno);
		return cnt == 1;
	}
}
