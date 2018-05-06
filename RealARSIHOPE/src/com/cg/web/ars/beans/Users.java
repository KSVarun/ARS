package com.cg.web.ars.beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Users {
	@Id
	@SequenceGenerator(name="my_seq",sequenceName="user_no", allocationSize=1)
	@GeneratedValue(generator="my_seq")
	private int slNo;
	
	@NotEmpty(message="Required Field")
	private String username;
	
	@NotEmpty(message="Required Field")
	@Pattern(regexp="[A-Za-z0-9]{5,8}",message="Provide alpha numeric password with min of 5 character and max of 8 character")
	private String password;
	
	private String role;
	
	private long mobileNo;
	
	{
		role="Executive";
	}
	
	public Users() {
		super();
		
	}

	public Users(int slNo, String username, String password, String role, int mobileNo) {
		super();
		this.slNo = slNo;
		this.username = username;
		this.password = password;
		this.role = role;
		this.mobileNo = mobileNo;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public long getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}
	
}
