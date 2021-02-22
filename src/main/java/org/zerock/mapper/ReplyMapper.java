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
	
	public void updateReplyerName(
			@Param("replyer_id") String replyer_id, 
			@Param("replyer_name") String replyer_name);
	
	public void signoutReply(String replyer_id);
	
	public void deleteWithBoard(Long bno);
}
