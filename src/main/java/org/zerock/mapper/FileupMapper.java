package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.FileVO;

public interface FileupMapper {

	public List<FileVO> readFiles(Long bno);
	
	public void insert(FileVO file);
	
	public int update(FileVO file);

	public int delete(Long fno);
	
	public int deleteWithBoard(Long bno);
}
