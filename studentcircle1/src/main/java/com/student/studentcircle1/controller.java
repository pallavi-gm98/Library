package com.student.studentcircle1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class controller {
	
	  @RequestMapping("/index")
	    public String index() {
	        return "home";  // Returns the home view
	    }
	    
	    @RequestMapping("/")
	    public String root() {
	        return "index";  // Will load index.jsp
	    }
	    @RequestMapping("/dashboard") 
	    public String dashboard() {
	    	return "dashboard";
		}
	    
	    @RequestMapping("/admission")
	    public String admission() {
	    	return "admission";
		}
	    
	    
	    @RequestMapping("/demo")
	    public String demo() {
	    	return "demo";
		}
}
