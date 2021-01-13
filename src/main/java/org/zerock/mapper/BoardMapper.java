package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	//@Select("SELECT * FROM tbl_board WHERE bno > 0")
	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	//insert를 실행할 때 동시에 seq_board에서 nextval로 bno를 생성
	//동시에 bno를 생성하므로, 어떤 bno일지 insert전 까지는 알 수 없음
	
	public void insertSelectKey(BoardVO board);
	//1. seq_board에서 nextval로 bno를 먼저 생성
	//2. 생성된 bno값을 가지고 insert 실행
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}
