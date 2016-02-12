package com.neu.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.neu.model.Advertisements;

@Entity
@Table(name="publisher")
@PrimaryKeyJoinColumn(name="Id") 
public class Publisher extends User{
	
	private static final long serialVersionUID = 9148507090841324560L;

	@Column(name = "totalAdPosted")
	private int totalAdPosted;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "publisher")
	private List<Advertisements> advertisementDetails = new ArrayList<Advertisements>();
	
	public List<Advertisements> getAdvertisementDetails() {
		return advertisementDetails;
	}

	public void setAdvertisementDetails(List<Advertisements> advertisementDetails) {
		this.advertisementDetails = advertisementDetails;
	}

	public int getTotalAdPosted() {
		return totalAdPosted;
	}

	public void setTotalAdPosted(int totalAdPosted) {
		this.totalAdPosted = totalAdPosted;
	}	
}
