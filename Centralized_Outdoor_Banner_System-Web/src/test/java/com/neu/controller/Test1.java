package com.neu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.DAO.HibernateUtil;
import com.neu.DAO.UserDAO;
import com.neu.model.Advertisements;
import com.neu.model.Advertiser;
import com.neu.model.User;

public class Test1{

	public static void main(String args[]){
		
		User user;
		Advertisements ads = new Advertisements();
		ads.setBookedBy("prateek");
		ads.setLength(100);
		ads.setWidth(50);
		ads.setLocation("Boston");
		ads.setOwner("Yash");
		ads.setStatus(false);
		
		UserDAO userDAO = new UserDAO();
		ArrayList<Advertisements> adsList = new ArrayList<Advertisements>();
		try {
		/*	adsList = userDAO.populateUsers();
			user = (User)userList.get(0);
			System.out.println(user.getUserName());
			userDAO.activateUser(user);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				
		System.out.println("success");		
	}
	
}
