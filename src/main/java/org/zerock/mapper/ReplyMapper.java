package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO reply);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("bno") Long bno, @Param("cri") Criteria cri);
	//bno와 cri 모두 rno를 사용하게 되므로, 어떤 파라미터의 rno인지 구별하기 위해
	//두 개 이상의 데이터를 파라미터로 전달하기 위해 @Param 어노테이션을 사용
	//SQL을 이용할 때 #{}의 이름으로 사용 가능
}
