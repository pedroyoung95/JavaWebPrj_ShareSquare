package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public void signin(MemberVO member);
	
	public int signout(String id);
	
	public MemberVO read(String id);
	
	public int changeName(String id);
	
	public int changePassword(String id);
	
	public int completeCnt(String id);
}
