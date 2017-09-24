package com.log.service.log.as.a.services;

import java.io.FileNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LogAsServiceRestController {
	
	@Autowired
	LogAsServiceRepository logAsServiceRepository;

	@RequestMapping( path ="api/log/read/{fileName}/{date}",method = RequestMethod.POST, produces={MediaType.APPLICATION_JSON_VALUE, 
            MediaType.APPLICATION_XML_VALUE} )
	public Response readLog(@PathVariable("fileName") String fileName, 
			@PathVariable("date") String date, @RequestParam("base") String base){	
		
		Response response = new Response();
		
		try {
			response.setErrorCode(200);
			response.setData(logAsServiceRepository.readFile(logAsServiceRepository.getFilePath(base, fileName, date)));
			
		} catch (FileNotFoundException e) {
			response.setErrorCode(500);
			response.setErrorMessage( e.getMessage());		
		}
		System.out.println( response);
		return response;	
		
	}
	
	

	@RequestMapping( path ="api/log/read/{fileName}/{date}",method = RequestMethod.GET)
	public Response readLogGet(@PathVariable("fileName") String fileName, 
			@PathVariable("date") String date, @RequestParam("base") String base){		
		Response response = new Response();
		
		try {
			response.setErrorCode(200);
			response.setData(logAsServiceRepository.readFile(logAsServiceRepository.getFilePath(base, fileName, date)));
			
		} catch (FileNotFoundException e) {
			response.setErrorCode(500);
			response.setErrorMessage( e.getMessage());		
		}
		System.out.println( response);
		return response;	
				
	}
	

	
}
