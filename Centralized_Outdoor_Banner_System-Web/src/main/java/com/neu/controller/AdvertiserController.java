package com.neu.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neu.DAO.UserDAO;
import com.neu.model.Advertisements;
import com.neu.model.Booking;
import com.neu.model.Publisher;
import com.neu.model.User;

@Controller
public class AdvertiserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	@Qualifier("advertisementValidator")
	private Validator validator;
	
	@RequestMapping(value = "/addAd", method = RequestMethod.POST) 
	public String openAdForm(Model model,HttpServletRequest request,Advertisements advertisements){
		
		return "AddAd";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST) 
	public String add_advert(Model model,@Validated Advertisements advertisements,BindingResult result, HttpServletRequest request){
		
		String returnVal = "ErrorInAddingAd";
		
		if(result.hasErrors()){
			return returnVal;
		}
		
		HttpSession session = request.getSession();
		
		Publisher publisher = (Publisher) session.getAttribute("user");
		
		if(advertisements.getAvailableFrom().compareTo(new Date())<0){
			return "ErrorInAddingAd";
		}
		
		if(advertisements.getAvailableFrom().compareTo(advertisements.getAvailableTill())>0){
			return "ErrorInAddingAd";
		}
		
	
		advertisements.setPublisher(publisher);
		advertisements.setOwner(publisher.getName());
		
		advertisements.setStatus(false);
		
		try {
			userDAO.addAdvertisement(advertisements);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "AdAddedSuccess";
		
	}
	
	@RequestMapping(value = "/listad" , method = RequestMethod.POST) 
	public String listad (Model model,HttpServletRequest request){
		
	HttpSession session = request.getSession();
	ArrayList adsList = new ArrayList<Advertisements>();
		
		User user = (User) session.getAttribute("user");
		
		try {
			adsList = userDAO.populateAdvertisementForPublisher(user.getId());
			model.addAttribute("adList",adsList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "added";
		
	}
	
	@RequestMapping(value = "/findAdsForAdvertiser", method = RequestMethod.POST) 
	public String listadForAdvertiser (Model model,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		ArrayList<Booking> adsListForAdvertiser = new ArrayList<Booking>();
			
			User user = (User) session.getAttribute("user");
			System.out.println("Inside the listadFor advertiser method");
			try {
				adsListForAdvertiser = userDAO.populateBookingsByAdvertiser(user.getId());
				model.addAttribute("adsListForAdvertiser",adsListForAdvertiser);
				System.out.println("Search Successful");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "bookedAdsForAdvertiser";
			
		}
	 
	@RequestMapping(value = "/AdssearchBylocation") 
	public String searchAdsByLocation (Model model,HttpServletRequest request){
		
		return "searchAvailableBanners";
	}
	
	
	
	
@RequestMapping(value = "/searchBanner", method = RequestMethod.POST) 
public String searchAds(Model model,HttpServletRequest request,@RequestParam("location") String location){		
		System.out.println("Search Ad method executed");
		System.out.println(location);
			
			try {
				ArrayList<Advertisements> searchadsList = new ArrayList<Advertisements>();
				searchadsList = userDAO.searchAdForAdvertiser(location);
				System.out.println(searchadsList.size());
				System.out.println("Search List Generated");
				model.addAttribute("searchadsList",searchadsList);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "searchAvailableBanners";
			
		}
	

@RequestMapping(value = "/viewAd") 
public String viewAd(Model model,HttpServletRequest request,@RequestParam("adid") int ad_Id){
		
		HttpSession session = request.getSession();
		//ArrayList<Advertisements> searchadsList = new ArrayList<Advertisements>();		
		User user = (User) session.getAttribute("user");
		
		//System.out.println("Search Ad method executed");
		//System.out.println(location);
			
			try {
				Advertisements ads = userDAO.populateFullAdInfo(ad_Id);
				model.addAttribute("ads",ads);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "viewFullAd";
			
		}
	
@RequestMapping(value = "/finalBooking", method = RequestMethod.POST) 
public String finalBooking(Model model,HttpServletRequest request,@RequestParam("week") int weeks, @RequestParam("ad_Id") int ad_Id){
		
	    //System.out.println(weeks);
	    //System.out.println(ad_Id);
	
		HttpSession session = request.getSession();		
		User user = (User) session.getAttribute("user");
		//Advertisements advertisement = (Advertisements)session.getAttribute("advertisements");
			try {
				Date fromDate = userDAO.forAvailableFromDate(ad_Id);
				userDAO.updateAdvertisements(user,weeks,ad_Id);
				userDAO.updateBookingData(user, weeks, ad_Id,fromDate);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "bookingSuccess";
			
		}




}
