package com.depthspace.attractions.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="ATTRACTIONS")
public class AttractionsVO implements Serializable{
	@Id
	@Column(name="ATTRACTIONS_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer attractionsId;
	
//	@ManyToOne(fetch = FetchType.EAGER) //多方Many搭配Join，name為自己要映射的表格欄位名、ref為對方要被關聯的表格欄位名
//	@JoinColumn(name="ATTRACTIONS_TYPE_ID",referencedColumnName = "ATTRACTIONS_TYPE_ID")
//	private AttractionsVO attractionsTypeId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="ATTRACTIONS_TYPE_ID", referencedColumnName = "ATTRACTIONS_TYPE_ID")
	private AttractionsTypeVO attractionsTypeId;

	
	@Column(name="AREA_ID")
	private Integer areaId;
	
	@Column(name="ATTRACTIONS_NAME")
	private String attractionsName;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="ATTRACTIONS_STATUS", columnDefinition ="tinyint")
	private Integer attractionsStatus;
	
	@Column(name="ADDRESS")
	private String address;
	
	@Column(name="LON")
	private Double lon;
	
	@Column(name="LAT")
	private Double lat;
	
	
	public AttractionsVO() {
		super();
	}
	
	
	
	public AttractionsVO(Integer attractionsId, AttractionsTypeVO attractionsTypeId, Integer areaId,
			String attractionsName, String description, Integer attractionsStatus, String address) {
		super();
		this.attractionsId = attractionsId;
		this.attractionsTypeId = attractionsTypeId;
		this.areaId = areaId;
		this.attractionsName = attractionsName;
		this.description = description;
		this.attractionsStatus = attractionsStatus;
		this.address = address;
	}



	public AttractionsVO(Integer attractionsId, AttractionsTypeVO attractionsTypeId, Integer areaId, String attractionsName,
			String description, Integer attractionsStatus) {
		super();
		this.attractionsId = attractionsId;
		this.attractionsTypeId = attractionsTypeId;
		this.areaId = areaId;
		this.attractionsName = attractionsName;
		this.description = description;
		this.attractionsStatus = attractionsStatus;
	}
	
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getLon() {
		return lon;
	}
	public void setLon(Double lon) {
		this.lon = lon;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Integer getAttractionsId() {
		return attractionsId;
	}
	public void setAttractionsId(Integer attractionsId) {
		this.attractionsId = attractionsId;
	}
	public AttractionsTypeVO getAttractionsTypeId() {
		return attractionsTypeId;
	}
	public void setAttractionsTypeId(AttractionsTypeVO attractionsTypeId) {
		this.attractionsTypeId = attractionsTypeId;
	}
	public Integer getAreaId() {
		return areaId;
	}
	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}
	public String getAttractionsName() {
		return attractionsName;
	}
	public void setAttractionsName(String attractionsName) {
		this.attractionsName = attractionsName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getAttractionsStatus() {
		return attractionsStatus;
	}
	public void setAttractionsStatus(Integer attractionsStatus) {
		this.attractionsStatus = attractionsStatus;
	}
	@Override
	public String toString() {
		return "AttractionsVO [attractionsId=" + attractionsId + ", attractionsTypeId=" + attractionsTypeId
				+ ", areaId=" + areaId + ", attractionsName=" + attractionsName + ", description=" + description
				+ ", attractionsStatus=" + attractionsStatus + ", address=" + address + ", lon=" + lon + ", lat=" + lat
				+ "]";
	}
	
}
