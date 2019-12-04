package com.example.model;

public class Student {
	private int studentID;
	private String studentCode;

	public Student() {
		super();
	}

	private String studentName;
	private String address;
	private String dob;
	private Boolean gender;
	private int classID;
	private String className;

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public int getClassID() {
		return classID;
	}

	public void setClassID(int classID) {
		this.classID = classID;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Student(int studentID, String studentCode, String studentName, String address, String dob, Boolean gender,
			int classID, String className) {
		super();
		this.studentID = studentID;
		this.studentCode = studentCode;
		this.studentName = studentName;
		this.address = address;
		this.dob = dob;
		this.gender = gender;
		this.classID = classID;
		this.className = className;
	}

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
