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
  	  
  	  // ?�일????��???�치 ?�아?�기
  	  String realUploadPath = sc.getRealPath("/upload");
  	  
  	  // ?�일????��???�치 + ???�일�?
      File newPath = new File(realUploadPath + "/" + newFilename);
      
      // ?�시 ?�더???�는 ?�일?????�치?????�일명으�???��??
  	  photo.transferTo(newPath);

  	  model.addAttribute("filename", newFilename);
	  }
	  
	  // JSP�????�일 ?�름???????�도�?Model 객체???�는??
    model.addAttribute("name", name);
    
	  return "/upload/FileUploadResult.jsp";
	}
	
	
}









