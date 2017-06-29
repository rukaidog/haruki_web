/**
 * haruki
 */
package com.haruki.lab.model;

/**
 * @author mid1672
 *
 */
public class AllUser {
	private Integer id;
	private String userName;
	private String gender;
	private String age;
	private String registerDate;
	private String registerTime;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
}
