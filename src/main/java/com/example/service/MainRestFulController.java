package com.example.service;

import java.io.Console;
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
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.Student;
import com.example.service.StudentService;

import com.example.config.AppConfig;

@RestController
@RequestMapping("/index")
public class MainRestFulController {

	@Autowired
	public StudentService studentService;

//	@RequestMapping(method = RequestMethod.GET)
//	public String grid(ModelMap model) {
//		return "index";
//	}

	@RequestMapping(value = "/getStudents", method = RequestMethod.GET, //
			produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Student> getStudents(Model model) throws IOException {

		List<Student> students = studentService.selectAllStudent();

		return students;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, //
			produces = MediaType.APPLICATION_JSON_VALUE)
	public void deleteStudent(@RequestParam String lastrowkey) throws IOException {
		studentService.deleteStudent(Integer.parseInt(lastrowkey));
	}

}
