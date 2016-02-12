package com.neu.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;  
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="booking")
public class Booking implements java.io.Serializable{
	
	private static final long serialVersionUID = 77748155647903915L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Id")
	private int bookingId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "advertiserId", nullable = false)
	private Advertiser advertiser;
	
	 
    @Column(name="advertisementId")  
    @GeneratedValue(generator="gen")  
    @GenericGenerator(name="gen", strategy="foreign",   
    parameters=@Parameter(name="property", value="advertisements"))   
    private Integer advertisementId;
	
	@OneToOne  
	@PrimaryKeyJoinColumn
	private Advertisements advertisements;
	
	@Column(name = "fromBookedDate")
	private Date fromBookedDate;
	
	@Column(name = "tillBookedDate")
	private Date tillBookedDate;
	
	@Column(name = "publisherId")
	private int publisherId;
	
	public int getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Advertiser getAdvertiser() {
		return advertiser;
	}

	public void setAdvertiser(Advertiser advertiser) {
		this.advertiser = advertiser;
	}
	

	public Date getFromBookedDate() {
		return fromBookedDate;
	}

	public void setFromBookedDate(Date fromBookedDate) {
		this.fromBookedDate = fromBookedDate;
	}

	public Date getTillBookedDate() {
		return tillBookedDate;
	}

	public void setTillBookedDate(Date tillBookedDate) {
		this.tillBookedDate = tillBookedDate;
	}

	public Integer getAdvertisementId() {
		return advertisementId;
	}

	public void setAdvertisementId(Integer advertisementId) {
		this.advertisementId = advertisementId;
	}

	public Advertisements getAdvertisements() {
		return advertisements;
	}

	public void setAdvertisements(Advertisements advertisements) {
		this.advertisements = advertisements;
	}
	
}
