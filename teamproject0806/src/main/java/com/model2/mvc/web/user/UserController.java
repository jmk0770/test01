package com.model2.mvc.web.user;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;



@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

		
	public UserController(){
		System.out.println(this.getClass());
	}
	

	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping
	public String addUserView() throws Exception {

		System.out.println("/addUserView");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/addUser");
		//Business Logic
		System.out.println("joinForm���� ���� ��:: "+user);
		userService.addUser(user);
		
		return "redirect:/user/index.jsp";
	}
	
	/* �α����Ҷ� ���� getUser. �̸��Ϸ� ȸ�� ������ ������ �´�. */
	@RequestMapping
	public String getUser( @RequestParam("email") String email , Model model ) throws Exception {
		
		System.out.println("/getUser");
		
		//Business Logic
		User user = userService.getUser(email);
		model.addAttribute("user", user);
		
		System.out.println("getUser�� ������� ��:"+user);
		
		return "forward:/user/getUser.jsp";
	}
	
	/* ȸ������ �����Ҷ� ���� getUser1. userId ��ȣ�� ȸ�� ������ ������ �´�. */
	 @RequestMapping
	  public String getUser1( @RequestParam("user_id") String user_id , Model model ) throws Exception {
	    
	    System.out.println("/getUser1");
	    
	    //Business Logic
	    User user = userService.getUser1(user_id);
	    
	    model.addAttribute("user", user);
	    System.out.println("getUser1�� ������� ��:"+user);
	    
	    return "forward:/page/modifyPage.jsp";
	  }
	
  /*	
	@RequestMapping
	public String updateUserView( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/updateUserView");
		//Business Logic
		User user = userService.getUser(userId);

		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/updateUser");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/app/user/getUser?userId="+user.getUserId();
	}
	*/
	
	@RequestMapping
	public String loginView() throws Exception{
		
		System.out.println("/loginView");

		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/login");
		
		//Business Logic
		User dbUser=userService.getUser(user.getEmail());
		System.out.println(dbUser);
		
		if( user.getPassword().equals(dbUser.getPassword())){
		  System.out.println("login Method :: "+dbUser);
			session.setAttribute("user", dbUser);
			
			User loginUser = (User) session.getAttribute("user");
			System.out.println(loginUser.getNickname()+"�� �α��ο� �����Ͽ����ϴ�");
			
			return "redirect:../../index.jsp";
			
		}
		else{
		  System.out.println("����� Ʋ�Ƚ��ϴ�. �ٽ� �Է� ��Ź�帳�ϴ�.");
		  
		  return "redirect:../../index.jsp";
		}

		
	}
	
	/*
	@RequestMapping
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/logout");
		
		session.invalidate();
		
		return "redirect:../../index.jsp";
	}
	
	
	@RequestMapping
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
		
		System.out.println("/checkDuplication");
		//Business Logic
		boolean result=userService.checkDuplication(userId);

		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}
	
	@RequestMapping
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listUser");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		

		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	} */
}