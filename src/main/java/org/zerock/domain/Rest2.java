package org.zerock.domain;

import java.util.Map;

import lombok.Data;

@Data
public class Rest2 {

	private String address;
	private Rest1 rest1;
	private int[] numbers;
	private Map<String, Integer> map;
}
