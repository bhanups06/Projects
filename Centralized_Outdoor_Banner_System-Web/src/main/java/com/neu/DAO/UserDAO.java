package com.neu.DAO;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.neu.model.Advertisements;
import com.neu.model.Booking;
import com.neu.model.User;
import com.neu.model.Advertiser;
import com.neu.model.Publisher;


public class UserDAO extends DAO{
	
	public User validateUser(String userName, String password) throws Exception{
		try{
			
			Query q = getSession().createQuery("from User where userName = :username and password = :password");
			//q.setCacheable(true);
			//q.setCacheRegion("user");
			q.setString("username", userName);
            q.setString("password", password);
            User user = (User) q.uniqueResult();
            close();
            return user;
		}catch(HibernateException e){
			
			throw new Exception("Could not find user in database " + userName, e);
		}
	}
	
	public void changePassword(User user,String oldPassword, String newPassword) throws Exception{
		
		try {
			Session session = getSession();
			Transaction tx = session.beginTransaction();
			System.out.println(newPassword);
			user.setPassword(newPassword);
			System.out.println(user.getPassword());
			session.update(user);
			tx.commit();
			close();
		} 
		catch (HibernateException e) {
				throw new Exception("Could not change password");
		}
	}	

		
	public void addAdvertiser(Advertiser advertiser) throws Exception{
		Transaction tx = null;
    	Session session = getSession();	
		try{
				tx = session.beginTransaction();			
				session.save(advertiser);
				tx.commit();
				close();
				
			}catch(HibernateException e){
				if (tx!=null) tx.rollback();
				throw new Exception("Error in saving advertiser");
			}
			
     }
	
	public void addPublisher(Publisher publisher) throws Exception{
		try{
			Session session = HibernateUtil.getSessionFactory().openSession();
			System.out.println("Inside the pubdao");
			Transaction tx = session.beginTransaction();			
			session.save(publisher);
			tx.commit();
			close();
			
		}catch(HibernateException e){
			
			throw new Exception("Error in saving publisher");
		}
		
 }
	
public ArrayList<User> populateUsers() throws Exception {
    	
    	ArrayList<User> userList = new ArrayList<User>();
    	Transaction tx = null;
    	Session session = getSession();
    	try {
    	tx = session.beginTransaction();
    	Query query = session.createQuery("from User where registrationStatus = 0");
    	
    	userList = (ArrayList) query.list();
    	
    	tx.commit();
    	
    	return userList; 
    	
    	}
    	
    	catch(HibernateException e) {
    		if (tx!=null) tx.rollback();
    		throw new Exception("Could not fetch user details" + e);
    	}
    }
			
   public void activateUser (String userid) throws Exception {
	
	    Transaction tx = null;
	    Session session = getSession();
	    try {
		
		     tx = session.beginTransaction();
		     Query query = session.createQuery("FROM User where userName = :userid");
		     query.setString("userid",userid);
		     User user = (User) query.uniqueResult();
		     user.setRegistrationStatus(true);
		     session.update(user);
		     tx.commit();
		     close();
	       } 
	    catch (HibernateException e) {
		       if(tx != null) {
			    tx.rollback();
		   }
		     e.printStackTrace(); 
	     }	
     }
	
   public ArrayList<Advertisements> populateAdvertisement() throws Exception{
		
		ArrayList<Advertisements> adsList = new ArrayList<Advertisements>();
		Transaction tx = null;
   	Session session = getSession();
		    try{
			    tx = session.beginTransaction();
			    Query query = getSession().createQuery("from Advertisements where status=0");
			    adsList = (ArrayList<Advertisements>)query.list();
			    System.out.println("Number of advertisements to be approved "+adsList.size());
			    tx.commit();
			    close();
			    return adsList;
			
		     }catch(HibernateException e){
			    if (tx!=null) tx.rollback();
			    throw new Exception("Could not fetch Ads details" + e);
		     }
}
	
    public void activateAds(int adId) throws Exception{
		
    	 Transaction tx = null;
 	    Session session = getSession();
    	
 	   try {
		     tx = session.beginTransaction();
		     Query query = session.createQuery("FROM Advertisements where ad_Id = :adId");	     
		     query.setInteger("adId",adId);
		     Advertisements ads = (Advertisements) query.uniqueResult();
		     ads.setStatus(true);
		     session.update(ads);
		     tx.commit();
		     close();
		     
	       }  catch (HibernateException e) {
		       if(tx != null) {
			    tx.rollback();
		   }
		     e.printStackTrace(); 
	     }	
     }

    public ArrayList<Advertisements> populateAdvertisementForPublisher(int pubId) throws Exception{
    	
        ArrayList adOfPublisherList = new ArrayList<Advertisements>();
        Transaction tx = null;
    	Session session = getSession();
		try{
			tx = session.beginTransaction();
			Query query = getSession().createQuery("from Advertisements where publisherId =:pubId");
			query.setInteger("pubId", pubId);
			adOfPublisherList = (ArrayList<Advertisements>)query.list();
			tx.commit();
			return adOfPublisherList;
		}catch(HibernateException e){
			if (tx!=null) tx.rollback();
			throw new Exception("Could not fetch Ads" + e);
		}
    }
    
    public ArrayList<Booking> populateBookingsByAdvertiser(int id) throws Exception{
    	
    	ArrayList<Booking> bookingList = new ArrayList<Booking>();
    	Transaction tx = null;
     	Session session = getSession();
    	try{
    		tx = session.beginTransaction();
    		System.out.println("Before querying the booking database");
    		Query query = getSession().createQuery("from Booking where advertiserId=:id");
    		query.setInteger("id",id);
    		bookingList = (ArrayList<Booking>)query.list();
    		tx.commit();
    		close();
			return bookingList;
		   }catch(HibernateException e){
			if (tx!=null) tx.rollback();
			throw new Exception("Could not fetch Booking Details" + e);
		   }
    	}
    
    public void addAdvertisement(Advertisements advertisements) throws Exception{
    	
    	Transaction tx = null;
    	Session session = getSession();	
		try{
				tx = session.beginTransaction();			
				session.save(advertisements);
				tx.commit();
				close();
				
			}catch(HibernateException e){
				if (tx!=null) tx.rollback();
				throw new Exception("Error in saving advertisement");
			}
    }
    
   public ArrayList<Advertisements> searchAdForAdvertiser(String location) throws Exception{
    	
	  // System.out.println("Inside the search method");
	    ArrayList adsForAdvertiserList = new ArrayList<Advertisements>();
    	Transaction tx = null;
    	Session session = getSession();	
		try{
			tx = session.beginTransaction();
    		Query query = getSession().createQuery("from Advertisements where location=:loc AND status=1 ");
    		query.setString("loc", location);
    		adsForAdvertiserList = (ArrayList<Advertisements>)query.list();   		
    		tx.commit();	
    		close();
    		
		   }catch(HibernateException e){
			if (tx!=null) tx.rollback();
			throw new Exception("Could not fetch Ads Details" + e);
		   }
		return adsForAdvertiserList;
		
    }
   
   public Advertisements populateFullAdInfo(int ad_Id) throws Exception{
	   
		Transaction tx = null;
	   	Session session = getSession();
	   	Advertisements ads = null;
	    try {
		     tx = session.beginTransaction();
		     Query query = session.createQuery("FROM Advertisements where ad_Id = :ad_Id");	     
		     query.setInteger("ad_Id",ad_Id);
		     ads = (Advertisements) query.uniqueResult();
		     tx.commit();
		     close();
		     return ads;
	    }catch(HibernateException e) {
		       if(tx != null) 
				    tx.rollback();
		       e.printStackTrace();
		       }
	    
		 return ads;      
   }
   
   public void updateBookingData(User user,int weeks, int ad_Id, Date fromDate) throws Exception{
	   
	Transaction tx = null;
   	Session session = getSession();	
   	int days = 7*weeks;
	
    try {
	     tx = session.beginTransaction();
	     int id = user.getId();
	     System.out.println(id);
	     Advertiser advertiser = (Advertiser)user;
	     //Query query = session.createQuery("FROM booking where ad_Id = :ad_Id");	     
	     //query.setInteger("ad_Id",ad_Id);
	     
	    // Date fromDate = forAvailableFromDate(ad_Id);
	     
		 System.out.println("Inside booking dao method");
		 Calendar c = Calendar.getInstance(); 
		 c.setTime(fromDate); 
		 c.add(Calendar.DATE, days);
		 Date tillDate = c.getTime();
		 System.out.println(tillDate);
		 
	     Date bookingFromDate = fromDate;
	     Date bookingtillDate = tillDate;
	    
	     Booking booking = new Booking();
	     booking.setFromBookedDate(bookingFromDate);
	     booking.setTillBookedDate(bookingtillDate);
	     booking.setAdvertiser(advertiser);
	     booking.setAdvertisementId(ad_Id);
	     int Id = forPublisherId(ad_Id);
	     booking.setPublisherId(Id);
	     
	     session.save(booking);
	     tx.commit();
	     close();
	     
      }  catch (HibernateException e) {
	       if(tx != null) {
		    tx.rollback();
	   }
   	
   }

    
   }
   
   
 public Date forAvailableFromDate(int ad_Id) throws Exception{
	   
	   Transaction tx = null;
	   	Session session = getSession();	
		Advertisements ads = null;
		Date fromDate=null;
	   try{
		   tx = session.beginTransaction();
		   Query query = session.createQuery("FROM Advertisements where ad_Id = :ad_Id");
		   query.setInteger("ad_Id",ad_Id);
		   ads = (Advertisements) query.uniqueResult();
		   fromDate= ads.getAvailableFrom();
		   tx.commit();
		   close();
		   return fromDate;   
	   }catch(HibernateException e) {
	       if(tx != null) {
		    tx.rollback();
	   }
   }
	return fromDate;   
}
   
   public int forPublisherId(int ad_Id) throws Exception{
	   
	   Transaction tx = null;
	   	Session session = getSession();	
		Advertisements ads = null;
		int pubId=0;
	   try{
		   tx = session.beginTransaction();
		   Query query = session.createQuery("FROM Advertisements where ad_Id = :ad_Id");
		   query.setInteger("ad_Id",ad_Id);
		   ads = (Advertisements) query.uniqueResult();
		   pubId= ads.getPublisher().getId();
		   tx.commit();
		   close();
		   return pubId;   
	   }catch(HibernateException e) {
	       if(tx != null) {
		    tx.rollback();
	   }
   }
	return pubId;   
}
   
   public void updateAdvertisements(User user,int weeks, int ad_Id) throws Exception{
	   
		Transaction tx = null;
	   	Session session = getSession();	
	   	int days = 7*weeks;
		
	    try {
		     tx = session.beginTransaction();
		     //Query query = session.createQuery("FROM booking where ad_Id = :ad_Id");	     
		     //query.setInteger("ad_Id",ad_Id);
			 Date fromDate = forAvailableFromDate(ad_Id);
		     
			 Calendar c = Calendar.getInstance(); 
			 c.setTime(fromDate); 
			 c.add(Calendar.DATE, days);
			 Date froomDate = c.getTime();
			 
			 
			 
		     Date availableFromDate = froomDate;
		     
		     Query query = session.createQuery("FROM Advertisements where ad_Id = :ad_Id");	     
		     query.setInteger("ad_Id",ad_Id);
		     Advertisements ads = (Advertisements) query.uniqueResult();
		     ads.setBookedBy(user.getName());
		     ads.setAvailableFrom(availableFromDate);
		     ads.setAvailableTill(null);
		     session.update(ads);
		     tx.commit();
		     close();
	    }catch (HibernateException e) {
		       if(tx != null) {
			    tx.rollback();
		   }
	   	
	   }
	   }   	
   
   
   
    	
}
	