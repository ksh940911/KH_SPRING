package com.kh.java.enum_;

import lombok.ToString;

@ToString
public enum ItemType {
	GLASSES(123), PERFUME(456), COSMETIC(789);
	
	private int value;
	
	//constructor
	ItemType(int value){
		this.value = value;
	}
	
	//getter
	public int getValue() { 
		return this.value;
	}
	
	//setter
	//valueOf
	public static ItemType valueOf(int value) {
		switch(value) {
		case 123 : return GLASSES;
		case 456 : return PERFUME;
		case 789 : return COSMETIC;
		default:
			throw new AssertionError("Unknown ItemType : " + value);
		}
	}
	
	
	
}
