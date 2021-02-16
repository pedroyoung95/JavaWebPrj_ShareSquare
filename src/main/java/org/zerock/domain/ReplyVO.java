package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;
	private Long bno;	
	private String reply;
	private String replyer_id;
	private String replyer_name;
	private Date replyDate;
	private Date updateDate;
	
}
