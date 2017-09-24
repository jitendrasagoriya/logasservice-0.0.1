package com.log.service.log.as.a.services;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.stereotype.Repository;

@Repository
public class LogAsServiceRepository {
	
	public StringBuffer readFile(String filename) throws FileNotFoundException{
		StringBuffer stringBuffer = new StringBuffer();
		try {
			File file = new File(filename);
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);			
			String line;
			int i = 1;
			while ((line = bufferedReader.readLine()) != null) {
				stringBuffer.append(i++);
				stringBuffer.append(line);
				stringBuffer.append("\n");
			}
			fileReader.close();
			System.out.println("Contents of file:");
			System.out.println(stringBuffer.toString());
			
		} catch (IOException e) {
			 throw new FileNotFoundException(filename + "not found");
		}
		return stringBuffer;
	}
	
	
	public String getFilePath(String base,String fileName,String date){		
		return new StringBuffer(base).append(fileName).append(".").append(date).append(".log").toString();
		
	}

}
