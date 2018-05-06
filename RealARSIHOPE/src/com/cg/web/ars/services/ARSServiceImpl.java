package com.cg.web.ars.services;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cg.web.ars.beans.BookingInformation;
import com.cg.web.ars.beans.FlightInformation;
import com.cg.web.ars.beans.Users;
import com.cg.web.ars.dao.IARSDao;
import com.cg.web.ars.exception.AirlineException;

@Service
@Transactional 
public class ARSServiceImpl implements IARSService{

	@Autowired
	private IARSDao arsDao;
	
	
	public IARSDao getArsDao() {
		return arsDao;
	}

	public void setArsDao(IARSDao arsDao) {
		this.arsDao = arsDao;
	}

	@Override
	public String retriveRole(String username, String password) throws AirlineException {
		return arsDao.retriveRole(username, password);
	}

	@Override
	public List<FlightInformation> getAllFlightInfo() throws AirlineException {
		return arsDao.getAllFlightInfo();
	}

	@Override
	public FlightInformation addFlight(FlightInformation flightInformation) throws AirlineException {
		return arsDao.addFlight(flightInformation);
	}

	@Override
	public void deleteAFlightById(int flightNo) throws AirlineException {
		arsDao.deleteAFlightById(flightNo);
		
	}

	@Override
	public void insertExecutive(Users user) throws AirlineException {
		arsDao.insertExecutive(user);
		
	}

	@Override
	public void updateFlight(FlightInformation flightInformation) throws AirlineException {
		arsDao.updateFlight(flightInformation);
		
	}

	@Override
	public FlightInformation getFlightInfo(int flightno) throws AirlineException {
		return arsDao.getFlightInfo(flightno);
	}

	@Override
	public List<FlightInformation>  bookFlight(String source, String destination) throws AirlineException {
		
		return arsDao.bookFlight(source,destination);
	}

	@Override
	public int insertBookingDetails(FlightInformation flightInformation, String email, String creditCard,
			String classType,int noOfPassengers) throws AirlineException {
		
		return arsDao.insertBookingDetails(flightInformation, email, creditCard, classType,noOfPassengers);
	}

	@Override
	public List<FlightInformation> getFlightInfoByDate(Date date) throws AirlineException {
		return arsDao.getFlightInfoByDate(date);
	}

	@Override
	public int[] getOccupancyById(int flightNo) throws AirlineException {
		return arsDao.getOccupancyById(flightNo);
	}

	@Override
	public BookingInformation viewBookingDetails(int bookingId) throws AirlineException {
		
		return arsDao.viewBookingDetails(bookingId);
	}

	@Override
	public void cancelBooking(int bookingId) throws AirlineException {
		arsDao.cancelBooking(bookingId);
		
	}

}
