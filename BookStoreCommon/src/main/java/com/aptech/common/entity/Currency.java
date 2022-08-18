package com.aptech.common.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "currencies")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Currency extends IdBasedEntity {
	
	@Column(nullable = false, length = 64)
	private String name;
	
	@Column(nullable = false, length = 3)
	private String symbol;
	
	@Column(nullable = false, length = 4)
	private String code;

	@Override
	public String toString() {
		return name + " - " + code + " - " + symbol;
	}

	
}
