package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.model.Student;
import com.example.mapper.StudentMapper;

@Service(value = "studentService")
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentMapper studentMapper;

	public List<Student> selectAllStudent() {
		return studentMapper.selectAllStudent();
	}

	public void insertStudent(Student student) {
		studentMapper.insertStudent(student);

	}

	public void deleteStudent(int studentID) {
		studentMapper.deleteStudent(studentID);
	}

	public Student selectStudentByID(int studentID) {
		return studentMapper.selectStudentByID(studentID);

	}

	public void updateStudent(Student student) {
		studentMapper.updateStudent(student);

	}

	@Override
	public List<Student> searchStudent(String text) {
		
		return studentMapper.searchStudent(text);
	}

}
