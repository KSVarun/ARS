package com.cg.web.ars.beans;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BookingInformation {
	@Id
	private int bookingId;
	
	private String custEmail;
	private int noOfPassengers;
	private String classType;
	private int totalFare;
	private String seatNumber;
	private String creditCardInfo;
	private String srcCity;
	private String destCity;
	private int flightNo;
	
	public BookingInformation() {
		super();
		
	}

	public BookingInformation(int bookingId, String custEmail, int noOfPassengers, String classType, int totalFare,
			String seatNumber, String creditCardInfo, String srcCity, String destCity, int flightNo) {
		super();
		this.bookingId = bookingId;
		this.custEmail = custEmail;
		this.noOfPassengers = noOfPassengers;
		this.classType = classType;
		this.totalFare = totalFare;
		this.seatNumber = seatNumber;
		this.creditCardInfo = creditCardInfo;
		this.srcCity = srcCity;
		this.destCity = destCity;
		this.flightNo = flightNo;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public int getNoOfPassengers() {
		return noOfPassengers;
	}

	public void setNoOfPassengers(int noOfPassengers) {
		this.noOfPassengers = noOfPassengers;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public int getTotalFare() {
		return totalFare;
	}

	public void setTotalFare(int totalFare) {
		this.totalFare = totalFare;
	}

	public String getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}

	public String getCreditCardInfo() {
		return creditCardInfo;
	}

	public void setCreditCardInfo(String creditCardInfo) {
		this.creditCardInfo = creditCardInfo;
	}

	public String getSrcCity() {
		return srcCity;
	}

	public void setSrcCity(String srcCity) {
		this.srcCity = srcCity;
	}

	public String getDestCity() {
		return destCity;
	}

	public void setDestCity(String destCity) {
		this.destCity = destCity;
	}

	public int getFlightNo() {
		return flightNo;
	}

	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}

	@Override
	public String toString() {
		return "BookingInformation [bookingId=" + bookingId + ", custEmail=" + custEmail + ", noOfPassengers="
				+ noOfPassengers + ", classType=" + classType + ", totalFare=" + totalFare + ", seatNumber="
				+ seatNumber + ", creditCardInfo=" + creditCardInfo + ", srcCity=" + srcCity + ", destCity=" + destCity
				+ ", flightNo=" + flightNo + "]";
	}
	
	
}
