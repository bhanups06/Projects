package com.neu.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.model.User;

public class RegisterValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		User user = (User)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "validate.userName", "Please enter UserName");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "validate.password", "Please enter Password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "validate.name", "Please enter Name");
	}
	
	

}
