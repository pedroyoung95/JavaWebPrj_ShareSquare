package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public void signin(MemberVO member);
	
	public boolean signout(String id, String password);
	
	public MemberVO get(String id);
	
	public boolean modifyName(String id, String name);
	
	public boolean modifyPassword(String id, String password);
	
	public int boardCnt(String id);
}
