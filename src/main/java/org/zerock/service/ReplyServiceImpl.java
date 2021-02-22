package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}
	
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(bno, cri);
	}
	
	@Override
	public int register(ReplyVO reply) {
		return mapper.insert(reply);
	}
	
	@Override
	public int modify(ReplyVO reply) {
		return mapper.update(reply);
	}
	
	@Override
	public int remove(Long rno) {
		ReplyVO reply = mapper.read(rno);
		return mapper.delete(rno);
	}
	
	@Override
	public void updateReplyerName(String id, String name) {
		mapper.updateReplyerName(id, name);
	}
	
	@Override
	public void signoutReply(String id) {
		mapper.signoutReply(id);
	}
	
	@Override
	public void deleteBoard(Long bno) {
		mapper.deleteWithBoard(bno);
	}
}
