package com.model2.mvc.service.user;

import java.util.List;

import com.model2.mvc.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String email) throws Exception ;

	//SELECT ONE
	public User getUser1(String userNo) throws Exception ;

	public void updateUser(User user) throws Exception; 
	
}