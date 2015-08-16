package com.model2.mvc.web.review;


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
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.review.ReviewService;
import com.model2.mvc.service.user.UserService;



@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	///Field
	@Autowired ServletContext sc;
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

		
	public ReviewController(){
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

		System.out.println("/addReviewView");
		
		return "redirect:/review/addReView.jsp";
	}
	
	@RequestMapping
	public String addReview( @ModelAttribute("review") Review review ) throws Exception {

		System.out.println("/addReview");
		//Business Logic
		System.out.println("review 모달에서 받아온 값::"+review);
		reviewService.addReview(review);
		
		return "redirect:../../index.jsp";
	}
	
	@RequestMapping
  public String addImage( @RequestParam("file_name") MultipartFile imageFile, Model model ) throws Exception {
	  
    System.out.println("/addImage");
    //Business Logic
    String fileName = imageFile.getOriginalFilename() ;
    File filePath = new File(sc.getRealPath("/upload") + "/" + fileName);
    
    System.out.println("FileName : "+fileName);
 
    imageFile.transferTo(filePath);
    
    
    String link = "/upload/"+fileName;    
    model.addAttribute("link", link  );
    return "pageJsonReport";
  }
	
	/* 
	@RequestMapping
	public String getUser( @RequestParam("email") String email , Model model ) throws Exception {
		
		System.out.println("/getUser");
		//Business Logic
		User user = userService.getUser(email);

		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
  
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
			System.out.println(loginUser.getNickname()+"님 로그인에 성공하였습니다");
			
			return "redirect:../../index.jsp";
			
		}
		else{
		  System.out.println("비번이 틀렸습니다. 다시 입력 부탁드립니다.");
		  
		  return "redirect:../../index.jsp";
		}

		
	}
	 */
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