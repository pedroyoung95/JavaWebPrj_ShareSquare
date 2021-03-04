package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public void signin(MemberVO member);
	
	public int signout(@Param("id") String id, @Param("password") String password);
	
	public MemberVO read(String id);
	
	public int changeInfo(MemberVO member);
	
	public int changePassword(@Param("id") String id, @Param("password") String password);
	
	public int boardCnt(Long mno);
	
	public int replyCnt(Long mno);
}
