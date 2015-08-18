package com.model2.mvc.web.user;


import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import org.springframework.web.multipart.MultipartFile;

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

	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")

	int pageSize;
	
	
	@RequestMapping
	public String addUserView() throws Exception {

		System.out.println("/addUserView");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/addUser");

		System.out.println("JoinForm Forward Data:: "+user);
		userService.addUser(user);
		
		return "redirect:/user/index.jsp";
	}
	

	@RequestMapping
	public String getUser( @RequestParam("email") String email , Model model ) throws Exception {
		
		System.out.println("/getUser");
		
		User user = userService.getUser(email);
		model.addAttribute("user", user);
		
		System.out.println("getUser Data:"+user);
		
		return "forward:/user/getUser.jsp";
	}
	
	
	 @RequestMapping
	  public String getUser1( @RequestParam("userNo") String userNo , Model model ) throws Exception {
	    
	    System.out.println("/getUser1");
	    
	    User user = userService.getUser1(userNo);
	    
	    model.addAttribute("user", user);
	    System.out.println("getUser1 Data:"+user);
	    
	    return "forward:/page/modifyPage.jsp";
	  }
	
  
	@RequestMapping
	public String updateUserView( @RequestParam("userNo") String userNo , Model model ) throws Exception{

		System.out.println("/updateUserView");

		User user = userService.getUser(userNo);

		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@Autowired ServletContext sc;
	@RequestMapping
	public String updateUser(@ModelAttribute("user") User user , @RequestParam(required=false) MultipartFile photo, Model model , HttpSession session) throws Exception{

		System.out.println("/updateUser");
		System.out.println("ModifyForm Forward Data:: "+ user);
    System.out.println("ModifyForm Forward Photo:: "+ photo);
    
    User user1 = (User)session.getAttribute("user");
    
    /* Profile Logic */
    if (photo.getSize() != 0) {
    
     String originFilename = photo.getOriginalFilename();
     int lastDotPosition = originFilename.lastIndexOf(".");
     String extname = originFilename.substring(lastDotPosition);
     String newFilename = System.currentTimeMillis() + extname;
     String realUploadPath = sc.getRealPath("/upload");
    
     File newPath = new File(realUploadPath + "/" + newFilename);
   
     photo.transferTo(newPath);
     user.setProfile(newFilename);
   }
   else {   
     user.setProfile(user1.getProfile());  
   }
   
   /* Password Logic */
   if(user.getPassword().equals("")){
      user.setPassword(user1.getPassword());
   }
  
   userService.updateUser(user);
		
   int sessionId=((User)session.getAttribute("user")).getUserNo();
   if(sessionId == user.getUserNo()){
			session.setAttribute("user", user);
	 }
		
		return "redirect:/app/user/getUser1?userNo="+user.getUserNo();
 }
	
	
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
			System.out.println(loginUser.getNickname()+" Welcome !!");
			
			return "redirect:../../index.jsp";
			
		}
		else{
		  System.out.println("wrong passwd. try again !");
		  
		  return "redirect:../../index.jsp";
		}

		
	}
	
	@RequestMapping
	public String logout(HttpSession session) throws Exception{
		
		System.out.println("/logout");
		
		session.invalidate();
		
		return "redirect:../../index.jsp";
	}
	
	/*
	
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