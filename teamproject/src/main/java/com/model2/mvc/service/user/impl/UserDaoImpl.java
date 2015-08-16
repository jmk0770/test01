package com.model2.mvc.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserDao;


//==> 
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
	  System.out.println("UserDaoImpl::addUser start");
		sqlSession.insert("UserMapper.addUser", user);
		System.out.println("UserDaoImpl::addUser finish");
	}

	public User getUser(String email) throws Exception {
	  System.out.println("UserDaoImpl::getUser start");
		return sqlSession.selectOne("UserMapper.getUser", email);
	
	}
	
	
	public User getUser1(String user_id) throws Exception {
	  System.out.println("UserDaoImpl::getUser1 start");
    return sqlSession.selectOne("UserMapper.getUser1", user_id);
  
	}
	
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

 
}