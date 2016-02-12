package com.neu.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.HibernateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.DAO.UserDAO;
import com.neu.model.Advertiser;
import com.neu.model.Publisher;
import com.neu.model.User;




@Controller
public class RegisterController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	@Qualifier("registerValidator")
	private Validator validator;
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@InitBinder
	private void initBinder (WebDataBinder binder){
		binder.setValidator(validator);
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, @Validated User user, BindingResult result, HttpServletRequest request ) {

		System.out.println("Inside the controller");
		Calendar cal = Calendar.getInstance();
		Date currentDate = cal.getTime();
		cal.add(Calendar.YEAR, 1); 
		Date nextYear = cal.getTime();
		
		if(result.hasErrors()){
			return "index";
		}
		else{
			if(user.getType().equalsIgnoreCase("publisher")){
				System.out.println("Inside the publisher");
				Publisher publisher = new Publisher();
				publisher.setName(user.getName());
				publisher.setUserName(user.getUserName());
				publisher.setPassword(user.getPassword());
				publisher.setEmailId(user.getEmailId());
				publisher.setContactNumber(user.getContactNumber());
				publisher.setType(user.getType());
				publisher.setSusbcriptionFrom(currentDate);
				publisher.setSubscriptionTill(nextYear);
				
			try{
				userDAO.addPublisher(publisher);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else{				
				Advertiser advertiser = new Advertiser();
				advertiser.setName(user.getName());
				advertiser.setUserName(user.getUserName());
				advertiser.setPassword(user.getPassword());
				advertiser.setEmailId(user.getEmailId());
				advertiser.setContactNumber(user.getContactNumber());
				advertiser.setType(user.getType());
				//advertiser.setCompanyname(companyName);
				advertiser.setSusbcriptionFrom(currentDate);
				advertiser.setSubscriptionTill(nextYear);
				try{
						userDAO.addAdvertiser(advertiser);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			
		}
		return "Success";
}
}
