package com.log.service.log.as.a.services;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path  ="/log")
public class HomeController {
	
	@RequestMapping( path="/home",method = RequestMethod.GET )
	public String welcome(){
		return "index";		
	}
	
	
}
