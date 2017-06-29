/**
 * haruki
 */
package com.haruki.lab.model;

/**
 * @author mid1672
 *
 */
public class UserLoginSession {
 
	private String userName;
	private String loginTime;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(String logoutTime) {
		this.logoutTime = logoutTime;
	}
	private String logoutTime;
}
