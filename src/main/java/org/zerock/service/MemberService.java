package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public void signin(MemberVO member);
	
	public boolean signout(String id, String password);
	
	public MemberVO get(String id);
	
	public boolean modifyInfo(MemberVO member);
	
	public boolean modifyPassword(String id, String password);
	
	public int boardCnt(Long mno);
	
	public int replyCnt(Long mno);
}
