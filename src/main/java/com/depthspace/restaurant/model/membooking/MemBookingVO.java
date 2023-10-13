package com.depthspace.restaurant.model.membooking;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MEM_BOOKING")
public class MemBookingVO implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BOOKING_ID", updatable = false)
	private Integer bookingId;
	@Column(name = "REST_ID")
	private Integer restId;
	@Column(name = "MEM_ID")
	private Integer memId;
	@Column(name = "CHECK_STATUS")
	private Integer checkStatus;
	@Column(name = "BOOKING_TIME")
	private Integer bookingTime;
	@Column(name = "BOOKING_NUMBER")
	private Integer bookingNumber;
	@Column(name = "BOOKING_DATE")
	private Date bookingDate;

	public MemBookingVO() {
		super();
	}

	public MemBookingVO(Integer bookingId, Integer restId, Integer memId, Integer checkStatus, Integer bookingTime,
			Integer bookingNumber, Date bookingDate) {
		super();
		this.bookingId = bookingId;
		this.restId = restId;
		this.memId = memId;
		this.checkStatus = checkStatus;
		this.bookingTime = bookingTime;
		this.bookingNumber = bookingNumber;
		this.bookingDate = bookingDate;
	}

	public Integer getBookingId() {
		return bookingId;
	}

	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}

	public Integer getRestId() {
		return restId;
	}

	public void setRestId(Integer restId) {
		this.restId = restId;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Integer getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(Integer bookingTime) {
		this.bookingTime = bookingTime;
	}

	public Integer getBookingNumber() {
		return bookingNumber;
	}

	public void setBookingNumber(Integer bookingNumber) {
		this.bookingNumber = bookingNumber;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	@Override
	public String toString() {
		return "MemBookingVO [bookingId=" + bookingId + ", restId=" + restId + ", memId=" + memId + ", checkStatus="
				+ checkStatus + ", bookingTime=" + bookingTime + ", bookingNumber=" + bookingNumber + ", bookingDate="
				+ bookingDate + "]";
	}

}