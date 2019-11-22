package com.example.service;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.example.config.AppConfig;
import com.example.model.Student;

public class main {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		 //AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
	       // StudentService studentService = (StudentService) context.getBean("studentService");
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
		StudentService studentService = (StudentService) context.getBean("studentService");
		List<Student> listStudent = studentService.selectAllStudent();	        System.out.println("select all : ");
	        for (Student student : listStudent) {
	            System.out.println(student.getStudentName());
	        }
	}

}
