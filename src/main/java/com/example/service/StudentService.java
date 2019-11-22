package com.example.service;

import java.util.List;
import com.example.model.Student;

public interface StudentService {

	  
	    public List<Student> selectAllStudent() ;
	    public void insertStudent(Student student);
	    public void deleteStudent(int StudentID);
	    public Student selectStudentByID(int studentID);
		  public void updateStudent(Student student);
	   
}
