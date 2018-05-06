package com.cg.web.ars.util;

import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDateEditor extends PropertyEditorSupport 
{
	
	
	//read the the bean property as String
	@Override
	public String getAsText() 
	{
		return getValue().toString();
	}
	
	//called by spring to set value for conversion
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
	
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		Date date = null;
		
		try 
		{
			date = df.parse(text);
			
		} catch (ParseException e) {
			throw new IllegalArgumentException(e);
		}
		
		setValue(date);
	}
}
