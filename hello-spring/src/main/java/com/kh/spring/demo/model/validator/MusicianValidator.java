package com.kh.spring.demo.model.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.spring.demo.model.vo.Musician;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MusicianValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Musician.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.debug("target = {}", target);
		
	}

}
