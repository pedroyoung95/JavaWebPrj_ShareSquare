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
	public int signout(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	@Transactional
	public MemberVO get(String id) {
		MemberVO member = memberMapper.read(id);
		return member;
	}
	
	@Override
	public boolean modifyName(String id) {
		int modifyCnt= memberMapper.changeName(id);
		return modifyCnt == 1;
	}
	
	@Override
	public boolean modifyPassword(String id) {
		int modifyCnt= memberMapper.changePassword(id);
		return modifyCnt == 1;
	}
	
	
}
