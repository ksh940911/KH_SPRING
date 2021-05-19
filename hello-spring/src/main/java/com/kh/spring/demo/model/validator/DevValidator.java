package com.kh.spring.demo.model.validator;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.spring.demo.model.vo.Dev;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DevValidator implements Validator {

	/**
	 * 검사하고하는 하는 객체가 Dev타입일때만 유효성 검사 지원
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		return Dev.class.isAssignableFrom(clazz);
	}

	/**
	 * 필드별로 유효성 검사를 실시.
	 * 부적합한 값이 경우, Errors객체에 해당 오류사실을 저장.
	 */
	@Override
	public void validate(Object target, Errors errors) {
		//커맨드객체
		Dev dev = (Dev)target;
		log.info("dev = {}", dev);
	
		//1. 이름검사
		String name = dev.getName();
		if(name == null || name.isEmpty()) {
			// void org.springframework.validation.Errors.rejectValue(@Nullable String field, String errorCode, String defaultMessage)
			errors.rejectValue("name", "error-name", "개발자명 누락!");
		}
		if(!Pattern.matches("[가-힣]{2,}", name)) {
			errors.rejectValue("name", "error-name","한글 이름 부적절!");
		}
		
		//2. 경력검사
		int career = dev.getCareer();
		if(career < 0) {
			errors.rejectValue("career", "error-career","경력 기간 오류!");
		}
	}

}
