package com.neu.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.neu.model.Advertisements;
import com.neu.model.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	@Qualifier("userValidator")
	private Validator validator;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		User user = new User();
		model.addAttribute("user",user);
		return "index";
	}
	
	@InitBinder("user")
	private void initBinder (WebDataBinder binder){
		binder.setValidator(validator);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, @Validated User user, BindingResult result, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		User validateuser = null;
		if(result.hasErrors()){
			return "error";
		}
		else{
		try{
			 validateuser = userDAO.validateUser(user.getUserName(), user.getPassword());
			 model.addAttribute("contextPath", request.getContextPath());
			 
			 if(validateuser == null){
					return "LoginError";
		     }
            if(!validateuser.isRegistrationStatus()) {
				 
				 return "RegistrationError";
			 } 
			 
		}
		catch(Exception e){		
			e.printStackTrace();
		}	
		session.setAttribute("user",validateuser);
		
		model.addAttribute("advertisements", new Advertisements());
        
		if(validateuser.getType().equalsIgnoreCase("admin")) {
			
			return "admin";
		}
		
        if(validateuser.getType().equalsIgnoreCase("publisher")) {
			
			return "publisher";
		}
        return "advertiser";
	}
}

	
	@RequestMapping(value = "/findUser", method = RequestMethod.POST)
	public String regUsers(Locale locale, Model model) {
		
        ArrayList <User> userList = new ArrayList();
		
		try {
			userList = userDAO.populateUsers();
			model.addAttribute("userList",userList);
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
         return "results";
	}
	
	//Method to show the list of advertisements posted by the publisher to be approved
	@RequestMapping(value = "/findAds", method = RequestMethod.GET)
	public String getUnApprovedAdvertisement(Model model, HttpSession session) {		
				ArrayList <Advertisements> adsList = new ArrayList<Advertisements>();		
				try {
					adsList = userDAO.populateAdvertisement();
					model.addAttribute("adsList",adsList);
				    } catch (Exception e) {
				    	e.printStackTrace();
				    }
		         return "adsResults";
				//return "UnapprovedAdvertisement";
			}
	
	@RequestMapping(value = "/activate")
	public String aprUsers(Locale locale, Model model,@RequestParam("userid")String userName) {
		try {
			userDAO.activateUser(userName);
			
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
         return "userApprovalSuccess";
	}
	
	@RequestMapping(value = "/activateAd", method = RequestMethod.GET)
	public String aprAds(Locale locale, Model model,@RequestParam("adid") int ad_Id) {
		try {
			userDAO.activateAds(ad_Id);
			
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
         return "approveAdSuccess";
	}
	
	@RequestMapping(value = "/changePassword")
	public String changePasswordPage(Locale locale, Model model) {
         return "changePassword";
	}
	
	
	@RequestMapping(value = "/passwordChange")
	public String changePassword(Locale locale, Model model,HttpServletRequest request, @RequestParam("oldPassword") String oldPassword,@RequestParam("newPassword") String newPassword) {
		try {
			
			HttpSession session = request.getSession();		
			User user = (User) session.getAttribute("user");
			userDAO.changePassword(user,oldPassword,newPassword);
			
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
         return "changePasswordSuccess";
	}
	
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		 session.invalidate();
         return "redirect:/";
	}
	
	
}
