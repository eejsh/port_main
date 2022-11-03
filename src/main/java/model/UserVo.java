package model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
@Getter
@Setter
public class UserVo {

	private String userid;
	private String userpw;
	private String usernm;
	private String useremail;
	private String useremail2;
	private String usertel;
	private String zipcode;
	private String address1;
	private String address2;
	
	private Date indate;
	
	
}
