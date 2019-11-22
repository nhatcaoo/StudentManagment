package com.example.mapper;

import java.util.List;

import com.example.model.Student;

public interface StudentMapper {
	  public List<Student> selectAllStudent();
	  public List<Student> searchStudent(String text);
	  public void insertStudent(Student student);
	  public void deleteStudent(int studentID);
	  public Student selectStudentByID(int studentID);
	  public void updateStudent(Student student);
}
