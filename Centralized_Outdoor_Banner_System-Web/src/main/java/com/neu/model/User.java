package com.neu.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="user")
@Inheritance(strategy=InheritanceType.JOINED) 
public class User implements java.io.Serializable{
	
	private static final long serialVersionUID = -6222045775581012282L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int Id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "userName")
	private String userName;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "confirmPassword")
	private String confirmPassword;
	
	@Column(name = "type")
	private String type;
		
	@Column(name = "emailId")
	private String emailId;
	
	@Column(name = "contactNumber")
	private String contactNumber;
	
	@Column(name = "registrationStatus")
	private boolean registrationStatus;
	
	private Date susbcriptionFrom;
	
	private Date subscriptionTill;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Column(name = "password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public boolean isRegistrationStatus() {
		return registrationStatus;
	}
	public void setRegistrationStatus(boolean registrationStatus) {
		this.registrationStatus = registrationStatus;
	}
	public Date getSusbcriptionFrom() {
		return susbcriptionFrom;
	}
	public void setSusbcriptionFrom(Date susbcriptionFrom) {
		this.susbcriptionFrom = susbcriptionFrom;
	}
	public Date getSubscriptionTill() {
		return subscriptionTill;
	}
	public void setSubscriptionTill(Date subscriptionTill) {
		this.subscriptionTill = subscriptionTill;
	}
	
}
