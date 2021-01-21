package org.zerock.mapper;

import org.zerock.domain.Ex1Criteria;

public interface MyBatisEx1Mapper {

	public int select1(Ex1Criteria cri);
	
	public int select2(Ex1Criteria cri);
	
	public int select3(Ex1Criteria cri);
	
	public int select4(Ex1Criteria cri);
	
	public int select5(Ex1Criteria cri);
	
	//forEach 태그 - list
	public int select6(Ex1Criteria cri);
	//forEach 태그 - map
	public int select7(Ex1Criteria cri);
}
