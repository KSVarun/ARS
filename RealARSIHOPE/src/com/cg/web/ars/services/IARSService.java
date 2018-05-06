package com.cg.web.ars.services;

import java.util.Date;
import java.util.List;

import com.cg.web.ars.beans.BookingInformation;
import com.cg.web.ars.beans.FlightInformation;
import com.cg.web.ars.beans.Users;
import com.cg.web.ars.exception.AirlineException;

public interface IARSService {
	public String retriveRole(String username, String password) throws AirlineException;
	
	public List<FlightInformation> getAllFlightInfo() throws AirlineException;
	
	public FlightInformation addFlight(FlightInformation flightInformation) throws AirlineException;
	
	public void deleteAFlightById(int flightNo) throws AirlineException;
	
	public void insertExecutive(Users user) throws AirlineException;
	
	public void updateFlight(FlightInformation flightInformation) throws AirlineException;
	
	public FlightInformation getFlightInfo(int flightno) throws AirlineException;
	
	public List<FlightInformation> bookFlight(String source, String destination) throws AirlineException;
	
	public int insertBookingDetails(FlightInformation flightInformation, String email, String creditCard, String classType, int noOfPassengers) throws AirlineException;
	
	public List<FlightInformation> getFlightInfoByDate(Date date) throws AirlineException;
	
	public int[] getOccupancyById(int flightNo) throws AirlineException;
	
	public BookingInformation viewBookingDetails(int bookingId) throws AirlineException;
	
	public void cancelBooking(int bookingId) throws AirlineException;
}
