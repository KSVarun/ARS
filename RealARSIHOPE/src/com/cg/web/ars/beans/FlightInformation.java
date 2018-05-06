package com.cg.web.ars.beans;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class FlightInformation {
	@Id
	@Min(value=1001, message="Please select a valid fare (Greater than 1000)")
	private int flightNo;
	
	@NotEmpty(message="Required field")
	private String airline;
	
	@NotEmpty(message="Required field")
	@Pattern(regexp="[A-Z]{1}[a-z]+",message="Departure City should be only first letter caps")
	private String depCity;
	
	@NotEmpty(message="Required field")
	@Pattern(regexp="[A-Z]{1}[a-z]+",message="Arrival City should be only first letter caps")
	private String arrCity;
	
	private Date depDate;
	private Date arrDate;
	
	@NotEmpty(message="Required field")
	@Pattern(regexp="[0-9]{2}:[0-9]{2}",message="Provide time in the pattern HH:MM")
	private String depTime;
	
	@Pattern(regexp="[0-9]{2}:[0-9]{2}",message="Provide time in the pattern HH:MM")
	private String arrTime;
	
	@Min(value=1, message="Please select a valid number (Greater than 0)")
	private int firstSeats;
	
	@Min(value=1, message="Please select a valid fare (Greater than 100)")
	private double firstSeatsFare;
	
	@Min(value=1, message="Please select a valid number (Greater than 0)")
	private int businessSeats;
	
	@Min(value=1, message="Please select a valid fare (Greater than 100)")
	private double businessSeatsFare;
	
	
	public FlightInformation() {
		super();
		
	}
	
	
	public FlightInformation(String airline, String depCity, String arrCity, Date depDate, Date arrDate, String depTime,
			String arrTime, int firstSeats, double firstSeatsFare, int businessSeats, double businessSeatsFare) {
		super();
		this.airline = airline;
		this.depCity = depCity;
		this.arrCity = arrCity;
		this.depDate = depDate;
		this.arrDate = arrDate;
		this.depTime = depTime;
		this.arrTime = arrTime;
		this.firstSeats = firstSeats;
		this.firstSeatsFare = firstSeatsFare;
		this.businessSeats = businessSeats;
		this.businessSeatsFare = businessSeatsFare;
	}


	public FlightInformation(int flightNo, String airline, String depCity, String arrCity, Date depDate, Date arrDate,
			String depTime, String arrTime, int firstSeats, double firstSeatsFare, int businessSeats,
			double businessSeatsFare) {
		super();
		this.flightNo = flightNo;
		this.airline = airline;
		this.depCity = depCity;
		this.arrCity = arrCity;
		this.depDate = depDate;
		this.arrDate = arrDate;
		this.depTime = depTime;
		this.arrTime = arrTime;
		this.firstSeats = firstSeats;
		this.firstSeatsFare = firstSeatsFare;
		this.businessSeats = businessSeats;
		this.businessSeatsFare = businessSeatsFare;
	}
	
	public FlightInformation(int flightNo, String depCity, String arrCity) {
		super();
		this.flightNo = flightNo;
		this.depCity = depCity;
		this.arrCity = arrCity;
	}


	public int getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getDepCity() {
		return depCity;
	}
	public void setDepCity(String depCity) {
		this.depCity = depCity;
	}
	public String getArrCity() {
		return arrCity;
	}
	public void setArrCity(String arrCity) {
		this.arrCity = arrCity;
	}
	public Date getDepDate() {
		return depDate;
	}
	public void setDepDate(Date depDate) {
		this.depDate = depDate;
	}
	public Date getArrDate() {
		return arrDate;
	}
	public void setArrDate(Date arrDate) {
		this.arrDate = arrDate;
	}
	public String getDepTime() {
		return depTime;
	}
	public void setDepTime(String depTime) {
		this.depTime = depTime;
	}
	public String getArrTime() {
		return arrTime;
	}
	public void setArrTime(String arrTime) {
		this.arrTime = arrTime;
	}
	public int getFirstSeats() {
		return firstSeats;
	}
	public void setFirstSeats(int firstSeats) {
		this.firstSeats = firstSeats;
	}
	public double getFirstSeatsFare() {
		return firstSeatsFare;
	}
	public void setFirstSeatsFare(double firstSeatsFare) {
		this.firstSeatsFare = firstSeatsFare;
	}
	public int getBusinessSeats() {
		return businessSeats;
	}
	public void setBusinessSeats(int businessSeats) {
		this.businessSeats = businessSeats;
	}
	public double getBusinessSeatsFare() {
		return businessSeatsFare;
	}
	public void setBusinessSeatsFare(double businessSeatsFare) {
		this.businessSeatsFare = businessSeatsFare;
	}


	@Override
	public String toString() {
		return "FlightInformation [flightNo=" + flightNo + ", airline=" + airline + ", depCity=" + depCity
				+ ", arrCity=" + arrCity + ", depDate=" + depDate + ", arrDate=" + arrDate + ", depTime=" + depTime
				+ ", arrTime=" + arrTime + ", firstSeats=" + firstSeats + ", firstSeatsFare=" + firstSeatsFare
				+ ", businessSeats=" + businessSeats + ", businessSeatsFare=" + businessSeatsFare + "]";
	}
	
	
}
