package com.example.domain;

public class userTableVO extends pickTableVO{
	
	private int num;
	private String gender;
	private int age;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "userTableVO [num=" + num + ", gender=" + gender + ", age=" + age + "]";
	}
	
	
}
