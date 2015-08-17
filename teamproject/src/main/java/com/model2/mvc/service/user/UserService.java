package com.model2.mvc.service.user;

import java.util.Map;

import com.model2.mvc.service.domain.User;


//==>  Service  Interface Definition  
public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String email) throws Exception;
	
	public User getUser1(String user_id) throws Exception;
  
	public void updateUser(User user) throws Exception;
}