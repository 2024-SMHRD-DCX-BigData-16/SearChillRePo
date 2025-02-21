package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MapAddress {

	private String roadAddress;
	private String jibunAddress;
	private String PRDT_NM;
}
