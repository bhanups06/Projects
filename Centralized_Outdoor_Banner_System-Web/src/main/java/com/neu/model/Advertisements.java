package com.neu.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="advertisements")
public class Advertisements implements java.io.Serializable{
	
	private static final long serialVersionUID = -9086837338947456097L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ad_Id")
	private int advertisementId;
	
	@Column(name = "length")
	private int length;
	
	@Column(name = "width")
	private int width;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "availableFrom")
	private Date availableFrom;
	
	@Column(name = "availableTill")
	private Date availableTill;
	
	@Column(name = "price")
	private float price;
	
	@Column(name = "owner")
	private String owner;
	
	@Column(name = "bookedBy")
	private String bookedBy;
	
	@Column(name = "status")
	private boolean status;
	
	@Column(name="location")
	private String location;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "publisherId", nullable = false)
	private Publisher publisher;
	
	@OneToOne(mappedBy="advertisements", cascade=CascadeType.ALL)  
    private Booking booking; 
	
	public int getAdvertisementId() {
		return advertisementId;
	}

	public void setAdvertisementId(int advertisementId) {
		this.advertisementId = advertisementId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getAvailableFrom() {
		return availableFrom;
	}

	public void setAvailableFrom(Date availableFrom) {
		this.availableFrom = availableFrom;
	}

	public Date getAvailableTill() {
		return availableTill;
	}

	public void setAvailableTill(Date availableTill) {
		this.availableTill = availableTill;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getBookedBy() {
		return bookedBy;
	}

	public void setBookedBy(String bookedBy) {
		this.bookedBy = bookedBy;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
