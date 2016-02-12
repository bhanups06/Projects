package com.neu.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.model.Advertisements;

public class AdvertisementValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "length", "validate.length", "Length  is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "width", "validate.width", "Width  is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type", "validate.type", "Type is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "location", "validate.location", "Location  is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "validate.price", "Price  is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "availableFrom", "validate.availableFrom", "Available From Date  is required field");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "availableTill", "validate.availableTill", "Available Till Date  is required field");
		
		Advertisements advertisement = (Advertisements)target;
		
		System.out.println(advertisement.getAvailableFrom());
		System.out.println(advertisement.getAvailableTill());
		System.out.println("before comparision");
		if(advertisement.getAvailableFrom().compareTo(advertisement.getAvailableTill())>0){
			errors.rejectValue("availableFrom", "availableFrom.exceed", "Available From cannot be greater than Availabe Till Date");  
		}
		
		System.out.println("after comparision");
		
		if(advertisement.getAvailableFrom().compareTo(advertisement.getAvailableTill())==0){
			errors.rejectValue("availableFrom", "availableFrom.exceed", "Available From and Available Till cannot be same");  
		}
		
		if(advertisement.getLength()<0){
			errors.rejectValue("length", "length.exceed", "Length cannot be negative number");  
		}
		
		if(advertisement.getWidth()<0){
			errors.rejectValue("width", "width.exceed", "Width cannot be negative number");  
		}
		
		if(advertisement.getPrice()<0){
			errors.rejectValue("price", "price.exceed", "Price cannot be negative number");  
		}
		
	}

}