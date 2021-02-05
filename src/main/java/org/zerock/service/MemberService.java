package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	public void signin(MemberVO member);
	
	public int signout(String id);
	
	public MemberVO get(String id);
	
	public boolean modifyName(String id);
	
	public boolean modifyPassword(String id);
}
