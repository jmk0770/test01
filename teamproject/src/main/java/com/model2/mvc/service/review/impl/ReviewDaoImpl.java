package com.model2.mvc.service.review.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.review.ReviewDao;


//==> 
@Repository("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ReviewDaoImpl() {
		System.out.println(this.getClass());
	}


  @Override
  public void addReview(Review review) throws Exception {
    System.out.println("ReviewDaoImpl::addReview start");
    sqlSession.insert("ReviewMapper.addReview", review);
    System.out.println("ReviewDaoImpl::addReview finish");  // TODO Auto-generated method stub
    
  }
}