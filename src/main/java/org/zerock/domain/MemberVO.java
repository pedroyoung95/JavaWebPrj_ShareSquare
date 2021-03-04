package org.zerock.domain;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class MemberVO {

	private Long mno;
	
	@Pattern(regexp = "^[A-Za-z[0-9]]{10,20}$")
	private String id;
	
	@Pattern(regexp = "^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$")
	private String password;
	
	private String name;
	
	@Email()
	private String email;
	
	private Date signDate;
	private int boardCnt;
	private int replyCnt;
}
