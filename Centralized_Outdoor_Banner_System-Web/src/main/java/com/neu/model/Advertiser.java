package com.neu.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.neu.model.Booking;

@Entity
@Table(name="advertiser")  
@PrimaryKeyJoinColumn(name="Id")
public class Advertiser extends User{
	
	private static final long serialVersionUID = -8487549477459158482L;
	
	@Column(name = "companyName")
	private String companyname;
	
	@Column(name = "totalAdBooked")
	private int totalAdBooked;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "advertiser")
	public List<Booking> bookingAdvertisementList = new ArrayList<Booking>();

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public List<Booking> getBookingAdvertisementList() {
		return bookingAdvertisementList;
	}

	public void setBookingAdvertisementList(List<Booking> bookingAdvertisementList) {
		this.bookingAdvertisementList = bookingAdvertisementList;
	}

	public int getTotalAdBooked() {
		return totalAdBooked;
	}

	public void setTotalAdBooked(int totalAdBooked) {
		this.totalAdBooked = totalAdBooked;
	}
}
