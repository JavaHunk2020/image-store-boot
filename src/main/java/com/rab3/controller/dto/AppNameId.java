package com.rab3.controller.dto;

public class AppNameId {
	
	private int aid;
	private String appname;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAppname() {
		return appname;
	}
	public void setAppname(String appname) {
		this.appname = appname;
	}
	@Override
	public String toString() {
		return "AppNameId [aid=" + aid + ", appname=" + appname + "]";
	}
	
	

}
