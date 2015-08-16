package com.model2.mvc.web.upload;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
  @Autowired ServletContext sc;

	@RequestMapping("/FileUpload.do")
	public String upload(
	    
	    String name,
	    @RequestParam(required=false) MultipartFile photo,
	    Model model) throws Exception {
		
	  System.out.println("dddd");
	  System.out.println(photo);
	  
	  if (photo.getSize() != 0) {
  	
	    String originFilename = photo.getOriginalFilename();
  	  
  	  int lastDotPosition = originFilename.lastIndexOf(".");
  	  String extname = originFilename.substring(lastDotPosition);
  	  
  	  String newFilename = System.currentTimeMillis() + extname;
  	  
  	  // ?Œì¼????¥???„ì¹˜ ?Œì•„?´ê¸°
  	  String realUploadPath = sc.getRealPath("/upload");
  	  
  	  // ?Œì¼????¥???„ì¹˜ + ???Œì¼ëª?
      File newPath = new File(realUploadPath + "/" + newFilename);
      
      // ?„ì‹œ ?´ë”???ˆëŠ” ?Œì¼?????„ì¹˜?????Œì¼ëª…ìœ¼ë¡???¸´??
  	  photo.transferTo(newPath);

  	  model.addAttribute("filename", newFilename);
	  }
	  
	  // JSPê°????Œì¼ ?´ë¦„???????ˆë„ë¡?Model ê°ì²´???´ëŠ”??
    model.addAttribute("name", name);
    
	  return "/upload/FileUploadResult.jsp";
	}
	
	
}









