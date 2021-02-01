package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.mapper.Sample1Mapper;
import org.zerock.mapper.Sample2Mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SampleTxService {

	@Setter(onMethod_ = @Autowired)
	private Sample1Mapper mapper1;
	
	@Setter(onMethod_ = @Autowired)
	private Sample2Mapper mapper2;
	
	@Transactional
//쪼개질 수 업는 하나의 단위 작업 = 트랜잭션
//하나의 트랜잭션으로 관리하고자 하는 메소드에 @Transactional 붙이기
//root-context.xml에 transactionManager bean객체 등록이 필요할 수도 있음
//원자성 원칙:트랜잭션이 A,B로 구성되어 있으면 두 작업 중 하나만 실패해도 원점으로 회복
//원자성 원칙을 구현하는 것이 @Transactional
	public void addData(String value) {
		log.info("mapper1...............");
		mapper1.insertCol1(value);
		
		log.info("mapper2...............");
		mapper2.insertCol2(value);
	}
}
