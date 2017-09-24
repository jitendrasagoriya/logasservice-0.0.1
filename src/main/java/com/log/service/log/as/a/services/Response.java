package com.log.service.log.as.a.services;

public class Response {
	
	private int errorCode;
	private String errorMessage;
	private StringBuffer data;
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public StringBuffer getData() {
		return data;
	}
	public void setData(StringBuffer data) {
		this.data = data;
	}
	
	

}
