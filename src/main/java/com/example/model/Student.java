package com.example.model;

public class Student {
	private int studentID;
	private String studentCode;
	public Student() {
		super();
	}
	private String studentName;
	
	private String dob;
	private String address;
	
	
	public Student(int studentID, String studentCode, String studentName, String address) {
		super();
		this.studentID = studentID;
		this.studentCode = studentCode;
		this.studentName = studentName;
		this.address = address;
	}
	public Student(String studentCode, String studentName, String address) {
		super();
		this.studentCode = studentCode;
		this.studentName = studentName;
		this.address = address;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
