package service;

import java.util.Date;
import java.util.UUID;

import util.DataBaseUtils;

public class RegisterService {

	public void setUser(Object...objects) {
		String sql = "insert into blog_user(id,username,password,email,"
	            + "is_delete,create_time,update_time)"
	            + " VALUES (?,?,?,?,?,?,?) ";	
		DataBaseUtils.update(sql, objects);
		return;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RegisterService registerService = new RegisterService();
		registerService.setUser(UUID.randomUUID().toString(),"sun","41512222","0",0,"2017-12-09 22:29:30","2017-12-09 22:29:30");
	}

}
