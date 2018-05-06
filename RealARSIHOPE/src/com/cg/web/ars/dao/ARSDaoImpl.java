package com.cg.web.ars.dao;

import java.sql.PreparedStatement;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.aop.AopInvocationException;
import org.springframework.stereotype.Repository;

import com.cg.web.ars.beans.BookingInformation;
import com.cg.web.ars.beans.FlightInformation;
import com.cg.web.ars.beans.Users;
import com.cg.web.ars.exception.AirlineException;

import oracle.net.aso.f;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/* Project         : Airline Reservation System
 * Team            : Group 5
 * Submission Date : 05/12/2017
 * Members         : Akannsha Rai
 * 				     Deepeet Chauhan 
 * 				     Gurpreet 
 * 				     Rajath Raghu
 * 				     Shagufta Perween
 * 				     Varun KS
 */



@Repository
public class ARSDaoImpl implements IARSDao {

	@PersistenceContext
	private EntityManager entityManager;
	

	Logger logger = Logger.getRootLogger();
	public ARSDaoImpl() {

		PropertyConfigurator.configure("resources//log4j.properties");
	}

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	BookingInformation bookingInformation=new BookingInformation();
	
	
	@Override
	public String retriveRole(String username, String password) throws AirlineException {

		Users user = null;
		try {
			String query = "select users from Users users where username=:uname and password=:pword";
			TypedQuery<Users> tQuery = entityManager.createQuery(query,Users.class);
			tQuery.setParameter("uname", username);
			tQuery.setParameter("pword",password);
			user = tQuery.getSingleResult();
						
			if(user.getRole() == null || user.getRole().isEmpty()) {
				throw new AirlineException("Invalid UserName/Password");
			}
		} catch (Exception e) {
			logger.error("Invalid UserName/Password");
			throw new AirlineException(e.getMessage());
		}
		logger.info("valid credintials");
		return user.getRole();
	}
	
	@Override
	public List<FlightInformation> getAllFlightInfo() throws AirlineException{
		List<FlightInformation> flightInfo = null;
			try {
				String query = "select flightinformation from FlightInformation flightinformation";
				TypedQuery<FlightInformation> tQuery = entityManager.createQuery(query,FlightInformation.class);
				flightInfo = tQuery.getResultList();
				
				if(flightInfo == null || flightInfo.isEmpty()) {
					throw new AirlineException("No flights to display");
				}
			} catch (Exception e) {
				logger.error("no flights to display");
				throw new AirlineException(e.getMessage());
			}
			logger.info("found flights");
		return flightInfo;
	}
	
	@Override
	public FlightInformation addFlight(FlightInformation flightInformation) throws AirlineException {
		
		try {
			entityManager.persist(flightInformation);
			entityManager.flush();
		} catch (Exception e) {
			logger.error("not able to add flight");
			throw new AirlineException(e.getMessage());
		}
		logger.info("Flight added");
		return flightInformation;
	}

	@Override
	public void deleteAFlightById(int flightNo) throws AirlineException {
		FlightInformation flightInformation = null;
		
		try {
			flightInformation = entityManager.find(FlightInformation.class, flightNo);
			if(flightInformation == null) {
				throw new AirlineException("Flight with Number "+flightNo+" does not exists.");
			}
			entityManager.remove(flightInformation);
			entityManager.flush();
		} catch (Exception e) {
			logger.error("wrong flightnumber");
			throw new AirlineException(e.getMessage());
		}
		
	}

	@Override
	public void insertExecutive(Users user) throws AirlineException {
		try {
			entityManager.persist(user);
			entityManager.flush();
		}
		catch(Exception e) {
			logger.error("unable to insert executive");
			throw new AirlineException(e.getMessage());
		}
	}

	@Override
	public void updateFlight(FlightInformation flightInformation) throws AirlineException {
		
		try {
			String query = "update FlightInformation flightInformation set flightInformation.airline=:airline,"
					+ "flightInformation.depCity=:depCity,flightInformation.arrCity=:arrCity,"
					+ "flightInformation.depDate=:depDate,flightInformation.depTime=:depTime,flightInformation.arrDate=:arrDate,"
					+ "flightInformation.arrTime=:arrTime,flightInformation.firstSeats=:firstSeats,"
					+ "flightInformation.firstSeatsFare=:firstSeatsFare,flightInformation.businessSeats=:businessSeats,"
					+ "flightInformation.businessSeatsFare=:businessSeatsFare where flightInformation.flightNo=:flightNo";
			
			Query tQuery = entityManager.createQuery(query);
			tQuery.setParameter("airline", flightInformation.getAirline());
			tQuery.setParameter("depCity", flightInformation.getDepCity());
			tQuery.setParameter("arrCity", flightInformation.getArrCity());
			tQuery.setParameter("depDate", flightInformation.getDepDate());
			tQuery.setParameter("depTime", flightInformation.getDepTime());
			tQuery.setParameter("arrDate", flightInformation.getArrDate());
			tQuery.setParameter("arrTime", flightInformation.getArrTime());
			tQuery.setParameter("firstSeats", flightInformation.getFirstSeats());
			tQuery.setParameter("firstSeatsFare", flightInformation.getFirstSeatsFare());
			tQuery.setParameter("businessSeats", flightInformation.getBusinessSeats());
			tQuery.setParameter("businessSeatsFare", flightInformation.getBusinessSeatsFare());
			tQuery.setParameter("flightNo", flightInformation.getFlightNo());
			
			tQuery.executeUpdate();
			
			entityManager.flush();
		
		} catch (Exception e) {
			logger.error("unable to update");
			throw new AirlineException(e.getMessage());
		}
		
		
	}

	@Override
	public FlightInformation getFlightInfo(int flightNo) throws AirlineException {
		FlightInformation flightInformation = null;
		
		try {
			
			flightInformation = entityManager.find(FlightInformation.class, flightNo);
			entityManager.flush();
			
			if(flightInformation==null) {
				throw new AirlineException("Flight With That Flight Number Does Not Exist");
			}
			
			return flightInformation;
		} catch (Exception e) {
			logger.error("unable to fetch");
			throw new AirlineException(e.getMessage());
		}
	}
	
	
	@Override
	public List<FlightInformation> bookFlight(String source, String destination) throws AirlineException
	{
				List<FlightInformation> flightList=null;
		
		try
		{
			String query="Select flightinformation from FlightInformation flightinformation where depCity=:source and arrCity=:destination";
			TypedQuery<FlightInformation> tQuery=entityManager.createQuery(query,FlightInformation.class);
			tQuery.setParameter("source", source);
			tQuery.setParameter("destination", destination);
			flightList=tQuery.getResultList();
			
			if(flightList == null || flightList.isEmpty()) {
				throw new AirlineException("No flights to display in the selected route");
			}
		
		}
		catch(Exception e)
		{
			logger.error("unable to book");
			throw new AirlineException(e.getMessage());
		}
		
		
		return flightList;
	}
	
	
	/*******************Book Ticket*********************/

	@Override
	public int insertBookingDetails(FlightInformation flightInformation, String email, String creditCard,
			String classType,int noOfPassengers) throws AirlineException {
		
		int bookingId=0;
		double firstFare=0;
		double businessFare=0;
		int totalFare=0;
		int firstseats=0;
		int businessSeats=0;
		
			
		String query2;
		String queryUpdate;
		
		try {
			String query="Select firstSeatsFare from FlightInformation flight where flightNo=:flightno";
			TypedQuery<Double> tQuery=entityManager.createQuery(query,Double.class);
			tQuery.setParameter("flightno", flightInformation.getFlightNo());
			firstFare=tQuery.getSingleResult();
			
						
			String query1="Select businessSeatsFare from FlightInformation flight where flightNo=:flightno";
			TypedQuery<Double> tQuery1=entityManager.createQuery(query1,Double.class);
			tQuery1.setParameter("flightno", flightInformation.getFlightNo());
			businessFare=tQuery1.getSingleResult();
			
									
			if(classType.equalsIgnoreCase("FirstClass"))
			{
				query2="Select firstSeats from FlightInformation flight where flight.flightNo=:flightno";
				TypedQuery<Integer> tQuery2=entityManager.createQuery(query2,Integer.class);
				tQuery2.setParameter("flightno", flightInformation.getFlightNo());
				firstseats=tQuery2.getSingleResult();
				
								
				if(noOfPassengers>0 && noOfPassengers<firstseats)
				{
				
				
					totalFare= (int) (firstFare* noOfPassengers);
					
									
					queryUpdate="Update FlightInformation flightinformation set flightinformation.firstSeats =:newFirstSeats where flightinformation.flightNo=:flightno";
					Query tQuery3=entityManager.createQuery(queryUpdate);
					
					int resultingFirstSeat=firstseats-noOfPassengers;
					tQuery3.setParameter("newFirstSeats", resultingFirstSeat);
					tQuery3.setParameter("flightno", flightInformation.getFlightNo());
					tQuery3.executeUpdate();
					entityManager.flush();
				
				}
				
				else
				{
					throw new AirlineException("No available seats. Try Again");
				}
				
			}
			else if(classType.equalsIgnoreCase("business"))
			{
				query2="Select businessSeats from FlightInformation flight where flight.flightNo=:flightno";
				TypedQuery<Integer> tQuery2=entityManager.createQuery(query2,Integer.class);
				tQuery2.setParameter("flightno", flightInformation.getFlightNo());
				businessSeats=tQuery2.getSingleResult();
				
							
				if(noOfPassengers>0 && noOfPassengers<businessSeats)
				{
		
					totalFare= (int) (businessFare* noOfPassengers);
				
					queryUpdate="Update FlightInformation flightinformation set flightinformation.businessSeats =:newBusinessSeats where flightinformation.flightNo=:flightno";
					Query tQuery3=entityManager.createQuery(queryUpdate);
					
					int resultingBusinessSeat=businessSeats-noOfPassengers;
					tQuery3.setParameter("newBusinessSeats", resultingBusinessSeat);
					tQuery3.setParameter("flightno", flightInformation.getFlightNo());
					tQuery3.executeUpdate();
					entityManager.flush();
				}
				
				else
				{
					throw new AirlineException("No available seats. Try Again");
				}
			}
			String seatNo="";
				
				bookingId=(int) (Math.random()*10000);
				for(int i = 0;i< noOfPassengers;i++) {
					int[] IseatNo= new int[noOfPassengers];
					IseatNo[i]=(int) (Math.random()*100);
					seatNo = seatNo + "-" + IseatNo[i] + "";
				}
			
			
			
			bookingInformation.setFlightNo(flightInformation.getFlightNo());
			
			
			bookingInformation.setBookingId(bookingId);
			bookingInformation.setCustEmail(email);
			bookingInformation.setNoOfPassengers(noOfPassengers);
			bookingInformation.setClassType(classType);
			bookingInformation.setTotalFare(totalFare);
			bookingInformation.setSrcCity(flightInformation.getDepCity());
			bookingInformation.setDestCity(flightInformation.getArrCity());
			bookingInformation.setSeatNumber(seatNo);
			bookingInformation.setCreditCardInfo(creditCard);
			
			/**********************MAIL*******************/
			
			final String username = ""; // enter your mail id
			final String password = "";

			Properties props = new Properties();
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");

			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });

			try {

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress("ksvarun001@gmail.com")); // same email id
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));// whome u have to send mails that person id
				message.setSubject("Booking Confirmed");
				message.setText("Dear "+email+","
					+ "Booking Confirmed. You Booking ID is "+bookingId);

				Transport.send(message);


			} catch (MessagingException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
			entityManager.persist(bookingInformation);
			
			entityManager.flush();
			
						
		} catch (Exception e) {
			logger.error("unable to insert to bookinginformation");
			e.printStackTrace();
			throw new AirlineException(e.getMessage());
		}
		
		
		return bookingId;
	}
	
	/*********************View Booking**********************/

	@Override
	public BookingInformation viewBookingDetails(int bookingId) throws AirlineException
	{
		try {
			BookingInformation bookingInformation=null;
			
			bookingInformation = entityManager.find(BookingInformation.class, bookingId);
			entityManager.flush();
			
			if(bookingInformation == null) {
				throw new AirlineException("Wrong Booking ID!");
			}
			return bookingInformation;
		} catch (Exception e) {
			logger.error("unable to view booking");
			throw new AirlineException(e.getMessage());
		}
	
		
	}

	/*******************Cancel Reservation***********************/
	
	@Override
	public void cancelBooking(int bookingId) throws AirlineException 
	{
		int noOfPassengers=0;
		String classType=null;
		int flightno=0;
		int currentBusinessSeats=0;
		int currentFirstSeats=0;
		
		String query2=null;
		String querySelect=null;
		
		FlightInformation flight=null;
		
		
		
		try {

			BookingInformation bookinginformation = entityManager.find(BookingInformation.class, bookingId);
			if(bookinginformation == null) {
				throw new AirlineException(bookingId+" is a wrong booking ID!");
			}
			
					
			noOfPassengers=bookinginformation.getNoOfPassengers();
			classType=bookinginformation.getClassType();
			flightno=bookinginformation.getFlightNo();
			
			
			if(classType.equalsIgnoreCase("business"))
			{
			
				
				querySelect="select businessSeats from FlightInformation flight where flight.flightNo=:id";
				TypedQuery<Integer> tQuery2=entityManager.createQuery(querySelect,Integer.class);
				
				tQuery2.setParameter("id", flightno);
				
				currentBusinessSeats=tQuery2.getSingleResult();
				
				
				query2="Update FlightInformation flightinformation set flightinformation.businessSeats =:newBusinessSeats where flightinformation.flightNo=:flightId";
			
				Query tQuery3=entityManager.createQuery(query2);
				
				int resultingBusinessSeat=currentBusinessSeats+noOfPassengers;
				tQuery3.setParameter("newBusinessSeats", resultingBusinessSeat);
				tQuery3.setParameter("flightId", flightno);
				int res=tQuery3.executeUpdate();
				
				
				
			}
			
			else if(classType.equalsIgnoreCase("FirstClass"))
			{
				querySelect="select firstSeats from FlightInformation flight where flight.flightNo=:id";
				TypedQuery<Integer> tQuery2=entityManager.createQuery(querySelect,Integer.class);
				
				tQuery2.setParameter("id", flightno);
				
				currentFirstSeats=tQuery2.getSingleResult();
				
				
				
				query2="Update FlightInformation flightinformation set flightinformation.firstSeats =:newFirstSeats where flightinformation.flightNo=:flightId";
			
				Query tQuery3=entityManager.createQuery(query2);
				
				int resultingFirstSeat=currentFirstSeats+noOfPassengers;
				tQuery3.setParameter("newFirstSeats", resultingFirstSeat);
				tQuery3.setParameter("flightId", flightno);
				tQuery3.executeUpdate();
				
				
			}
			
			
			
		entityManager.remove(bookinginformation);
		entityManager.flush();
		}
		 catch (Exception e) {
			 logger.error("unable to cancle booking");
				throw new AirlineException(e.getMessage());
			}
	}
	
	

	@Override
	public List<FlightInformation> getFlightInfoByDate(Date date) throws AirlineException {
	
		List<FlightInformation> flightList=null;
		
		try
		{
			String query="Select flightinformation from FlightInformation flightinformation where depDate=:date";
			TypedQuery<FlightInformation> tQuery=entityManager.createQuery(query,FlightInformation.class);
			tQuery.setParameter("date", date);
			flightList=tQuery.getResultList();
			entityManager.flush();
			
			if(flightList == null || flightList.isEmpty()) {
				throw new AirlineException("No airlines in the date given");
			}
			
		}
		catch(Exception e)
		{
			logger.error("unable to get flights by date");
			throw new AirlineException(e.getMessage());
		}
		
		
		return flightList;
	}

	
	

	@Override
	public int[] getOccupancyById(int flightNo) throws AirlineException {
		FlightInformation flightInfo = null;
		int[] occupancy = new int[2];
		int cufs=0,cubs=0;
		try {
			String query = "select flightInformation from FlightInformation flightInformation where flightNo=:flightno";
			TypedQuery<FlightInformation> tQuery=entityManager.createQuery(query,FlightInformation.class);
			tQuery.setParameter("flightno", flightNo);
			flightInfo = tQuery.getSingleResult();
			cufs=78-flightInfo.getFirstSeats();
			cubs=67-flightInfo.getBusinessSeats();
			
			occupancy[0] = cufs;
			occupancy[1] = cubs;
			
		} catch (Exception e) {
			logger.error("unable to get occupancy");
			throw new AirlineException(e.getMessage());
		}
		return occupancy;
	
	}
}
