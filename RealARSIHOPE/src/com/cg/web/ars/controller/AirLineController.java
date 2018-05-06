package com.cg.web.ars.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.InitBinder;

import com.cg.web.ars.beans.BookingInformation;
import com.cg.web.ars.beans.FlightInformation;
import com.cg.web.ars.beans.Users;
import com.cg.web.ars.exception.AirlineException;
import com.cg.web.ars.services.IARSService;

@Controller
public class AirLineController {
	
	@Autowired
	private IARSService arsService;
	
	public IARSService getArsService() {
		return arsService;
	}

	public void setArsService(IARSService arsService) {
		this.arsService = arsService;
	}

	
	
	@InitBinder("FlightInformation")
    public void customizeBinding (WebDataBinder binder) {
		
        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatter1 = new SimpleDateFormat("dd-MM-yyyy");
        dateFormatter.setLenient(false);
        binder.registerCustomEditor(Date.class, "depDate", new CustomDateEditor(dateFormatter, true));
        binder.registerCustomEditor(Date.class, "arrDate", new CustomDateEditor(dateFormatter1, true));
    }
	
	@RequestMapping(value="/fetchHomePage.html")
	public String fetchHomePage() {
		return "home";
	}
	
	@RequestMapping(value="/fetchLoginPage.html")
	public String redirectToLoginPage() {
		return "login";
	}
	
	@RequestMapping(value="/adminPage.html")
	public String toadminPage() {
		return "adminPage";
	}
	
	@RequestMapping(value="/loginaction.html", method=RequestMethod.POST)
	public String adminOrExecutiveOperations(@RequestParam("username") String uname, @RequestParam("password") String pword, Model model) throws AirlineException{
		
		
		try{
			String role = arsService.retriveRole(uname, pword);
			if(role.equalsIgnoreCase("admin")){
				return "adminPage";
			}
			else{
				return "executivePage";
			}			
		}
		catch(Exception e){
			model.addAttribute("errMsg",e.getMessage());
			return "ErrorPage";
		}
		
	}
		@RequestMapping(value="/DisplayFlightDetails.html")
		public String displayFlightDetails(Model model) {
			try {
				model.addAttribute("flightInfo", arsService.getAllFlightInfo());
				return "flightDetailsPage";
			} catch (Exception e) {
				model.addAttribute("errMsg",e.getMessage());
				return "ErrorPage";
			}
		}
		
		@RequestMapping(value="/AddFlight.html", method=RequestMethod.GET)
		public String addFlight(Model model) {
			model.addAttribute("FlightInformation", new FlightInformation());
			return "addFlightPage";
		}
		
		@RequestMapping(value="/addFlightDetails.html", method=RequestMethod.POST)
		public String addFlightDetails(@ModelAttribute("FlightInformation") @Valid FlightInformation flightInformation,BindingResult formValidationResult,Model model) {
			if(formValidationResult.hasErrors()){
				return "addFlightPage";
			}
			try {
				flightInformation = arsService.addFlight(flightInformation);
				model.addAttribute("info", "Flight "+flightInformation.getAirline() + " with flight number "+flightInformation.getFlightNo()+" added.");
				model.addAttribute("FlightInformation", new FlightInformation());
				return "addFlightPage";
			} catch (Exception e) {
				model.addAttribute("errMsg","Something went wrong while trying to add flight Details. Reason : "+e.getMessage());
				return "ErrorPage";
			}
			
		}
		
		@RequestMapping(value="/CancelFlight.html")
		public String getCancleFlightPage() {
			return "cancleflightpage";
		}
		
		@RequestMapping(value="/processCancleFlight.html",method=RequestMethod.POST)
		public String processCancleFlight(@RequestParam("flightNo") String flightNo,Model model) {
			try {
				int flightno = Integer.parseInt(flightNo);
				arsService.deleteAFlightById(flightno);
				model.addAttribute("info", "Flight with flight number "+flightno+" has been canceled");
				return "cancleflightpage";
			} catch (Exception e) {
				model.addAttribute("info",e.getMessage());
				return "cancleflightpage";
			}
		}
		
		@RequestMapping(value="/AddNewFlightExecutive.html",method=RequestMethod.GET)
		public String getInsertPage(Model model) {
			model.addAttribute("Users", new Users());
			return "addExecutive";
		}
		
		@RequestMapping(value="/processAddExecutive.html",method=RequestMethod.POST)
		public String processAddExecutive(@ModelAttribute("Users") @Valid Users user,BindingResult formValidationResult,Model model) {
			if(formValidationResult.hasErrors()){
				return "addExecutive";
			}
			try {
				arsService.insertExecutive(user);
				model.addAttribute("info", "Executive "+user.getUsername()+" added");
				model.addAttribute("Users", new Users());
				return "addExecutive";
			} catch (Exception e) {
				model.addAttribute("errMsg","Something went wrong while trying to add Executive. Reason : "+e.getMessage());
				return "ErrorPage";
			}
			
		}
		
		@RequestMapping(value="/ManageFlight.html")
		public String showUpdatePage() {
			return "updatePage";
		}
		
		@RequestMapping(value="/processFetchById.html", method=RequestMethod.GET)
		public String processFetchById(@RequestParam("flightNo") int flightNo, Model model) {
			
			if(flightNo <= 0) {
				
				model.addAttribute("errMsg","It should be a valid flight number");
				return "ErrorPage";
			}
			try {
				FlightInformation flightInformation = arsService.getFlightInfo(flightNo);
				
				model.addAttribute("FlightInformation", flightInformation);
				return "updateFlightPage2";
			} catch (Exception e) {
				model.addAttribute("errMsg",e.getMessage());
				return "updatePage";
			}
		}
		
		@RequestMapping(value="/processUpdateFlightInfo.html", method=RequestMethod.POST)
		public String processUpdateFlightInfo(@ModelAttribute("FlightInformation") @Valid FlightInformation flightInformation,BindingResult formValidationResult,Model model) {
			if(formValidationResult.hasErrors()){
				return "updateFlightPage2";
			}
			try {
				arsService.updateFlight(flightInformation);
				model.addAttribute("info", "Flight Updated");
				return "updateFlightPage2";
			} catch (Exception e) {
				model.addAttribute("errMsg",e.getMessage());
				return "ErrorPage";
			}
		}
		
		
		/**********************Start of Book ticket**************************/
		
		@RequestMapping(value="/fetchBookTicketPage.html")
		public String fetchBookTicketPage() {
			return "BookTicketPage";
		}
		
		@RequestMapping(value="/fetchHomePageFromBooking.html")
		public String fetchHomePageFromBooking() {
			return "home";
		}
		
		@RequestMapping(value="/BookTicket.html")
		public String getBookTicketPage()
		{
			return "BookTicketPage";
		}
		
		@RequestMapping(value="/processBookTicketPage.html",method=RequestMethod.POST)
		public String processBookTicket(@RequestParam("srcCity") String source, @RequestParam("destCity") String destination, Model model){
			try {
				
					model.addAttribute("flightList",arsService.bookFlight(source,destination));
					
				return "FlightListPage";
				
				
			} catch (Exception e) {
				model.addAttribute("info",e.getMessage());
				return "BookTicketPage";
			}
			
		}
		
		@RequestMapping(value="/bookFlightByFlightNo.html",method=RequestMethod.GET)
		public String processBookFlightByFlightNo(@RequestParam("flightId") int flightno,@RequestParam("src") String source,
				@RequestParam("dest") String destination,  Model model)	{
						
			if(flightno<0)
			{
				model.addAttribute("errMsg","Invalid flight No");
				return "ErrorPage";
				
			}
			
			try {
				model.addAttribute("flight", flightno);
				model.addAttribute("src", source);
				model.addAttribute("dest", destination);
				return "BookingTicketFormPage";
				
				
			} catch (Exception e) {
				model.addAttribute("errMsg",e.getMessage());
				return "ErrorPage";
			}
			
		}
		
		
	@RequestMapping(value="/confirmBookingAction.html",method=RequestMethod.POST)
		public String processConfirmBookingAction(@RequestParam("noOfPassengers") int passengers, @RequestParam("classType") String classType,
				
				@RequestParam("email") String email, @RequestParam("creditCard") String creditCard,
				@RequestParam("flightId") int flightno,@RequestParam("src") String source,
				@RequestParam("dest") String destination,Model model){
			
		FlightInformation flightinformation=new FlightInformation(flightno,source,destination);
		
		
		try {
						
			int bookingId=arsService.insertBookingDetails(flightinformation, email, creditCard, classType, passengers);
			
			model.addAttribute("bookingid", bookingId);
			return "BookingConfirmation";
			
			
		} catch (AirlineException e) {
			model.addAttribute("errMsg",e.getMessage());
			return "ErrorPage";
		}
			
		}
	
	
	
	
		/*******************View Booking*******************/
	
	
	@RequestMapping(value="/ViewBooking.html")
	public String getViewBookingPage()
	{
		return "viewBookingByIdPage";
	}
	
	
	@RequestMapping(value="/processviewBookingById.html", method=RequestMethod.GET)
	public String processViewBookingById(@RequestParam("bookingId") int id, Model model)
	{
		try {
			BookingInformation bookingInformation=arsService.viewBookingDetails(id);
			model.addAttribute("bookingDetails", bookingInformation);
			return "viewBookingByIdPage";
		} catch (AirlineException e) {
			model.addAttribute("info",e.getMessage());
			return "viewBookingByIdPage";
		}		
		
	}
	
	/***********************Cancel Booking***********************/
	@RequestMapping(value="/CancelBooking.html")
	public String getCancelBookingPage()
	{
		return "cancelBookingPage";
	}
	@RequestMapping(value="/processCancelBookingById.html", method=RequestMethod.GET)
	public String processCancelBookingById(@RequestParam("bookingId") int id, Model model)
	{
		try {
			arsService.cancelBooking(id);
			model.addAttribute("bookingId","Booking with "+ id+" ID canceled!");
			return "cancelBookingPage";
			
		} catch (AirlineException e) {
			model.addAttribute("bookingId","Wrong Booking ID!");
			return "cancelBookingPage";
		}		
		
	}
	
	
	
	/********************Executive Functionalities********************/
	
		@RequestMapping(value="/showExecutivePage.html")
		public String directToExecutivePage() {
			return "executivePage";
		}
	
		@RequestMapping(value="/flightsByDate.html",method=RequestMethod.GET)
		public String showFlightsByDatePage(Model model) {
			model.addAttribute("FlightInformation", new FlightInformation());
			return "flightsByDatePage";
		}
		
		@RequestMapping(value="/showFlightsByDate.html")
		public String displayFlightByDate(@ModelAttribute("FlightInformation") @Valid FlightInformation flightInformation,BindingResult formValidationResult, Model model) {
			try {
				model.addAttribute("flightListByDate", arsService.getFlightInfoByDate(flightInformation.getDepDate()));
				return "flightsByDatePage";
			} catch (Exception e) {
				model.addAttribute("errMsg",e.getMessage());
				return "ErrorPage";
			}	
		}
		
		@RequestMapping(value="/flightOccupancy.html")
		public String displayFlightOccupancyPage() {
			return "flightOccupancyPage";
		}
		
		@RequestMapping(value="/fetchFlightOccupancy.html", method=RequestMethod.POST)
		public String fetchFlightOccupancy(@RequestParam("flightNo") int flightNo, Model model) {
			try {
				
				int[] finfo = new int[2];
				finfo = arsService.getOccupancyById(flightNo);
				model.addAttribute("flightInfo", finfo);
				return "flightOccupancyPage";
			}
			catch(Exception e) {
				model.addAttribute("errMsg",e.getMessage());
				return "ErrorPage";
			}
		}
		
		
								
}
