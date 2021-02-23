package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public void signin(MemberVO member) {
		log.info("sign in.........." + member);
		memberMapper.signin(member);		
	}
	
	@Override
	public boolean signout(String id, String password) {
		log.info("sign out.........." + id);
		int signoutCnt = memberMapper.signout(id, password);
		return signoutCnt == 1;
	}
	
	@Override
	public MemberVO get(String id) {
		MemberVO member = memberMapper.read(id);
		return member;
	}
	
	@Override
	public boolean modifyName(String id, String name) {
		int modifyCnt= memberMapper.changeName(id, name);
		return modifyCnt == 1;
	}
	
	@Override
	public boolean modifyPassword(String id, String password) {
		int modifyCnt= memberMapper.changePassword(id, password);
		return modifyCnt == 1;
	}
	
	@Override
	public int boardCnt(Long mno) {		
		return memberMapper.boardCnt(mno);
	}
	
	@Override
	public int replyCnt(Long mno) {
		return memberMapper.replyCnt(mno);
	}
}
