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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.Student;
import com.example.service.StudentService;

import com.example.config.AppConfig;

@Controller
public class MainContronller {

	@Autowired
	public StudentService studentService;

	// AbstractApplicationContext context = new
	// AnnotationConfigApplicationContext(AppConfig.class);
	// StudentService studentService = (StudentService)
	// context.getBean("studentService1");
	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String index(Model model) throws IOException {
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

		List<Student> listStudent = studentService.selectAllStudent();
		model.addAttribute("students", listStudent);
		return "welcome";
	}

	@RequestMapping(value = { "/addStudent" }, method = RequestMethod.GET)
	public String addStudent(Model model) throws IOException {
		Student studentForm = new Student();
		model.addAttribute("studentForm", studentForm);
		return "addStudent";
	}

	@RequestMapping(value = { "/addStudent" }, method = RequestMethod.POST)
	public String savePerson(Model model, //
			@ModelAttribute("studentForm") Student studentForm) {
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

		String code = studentForm.getStudentCode();
		String name = studentForm.getStudentName();
		String address = studentForm.getAddress();

		if (code != null && name != null && address != null && code.length() > 0 && name.length() > 0
				&& address.length() > 0) {
			Student newStudent = new Student(code, name, address);
			studentService.insertStudent(newStudent);
			return "redirect:/";
		}
		model.addAttribute("errorMessage", "Student's information is requied");
		return "addStudent";
	}

	@RequestMapping(value = { "/deleteStudent/{id}" }, method = RequestMethod.GET)
	public String deleteStudent(Model model, @PathVariable String id) throws IOException {

		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

		studentService.deleteStudent(Integer.parseInt(id));
		return "redirect:/";
	}

	@RequestMapping(value = { "/updateStudent/{id}" }, method = RequestMethod.GET)
	public String redirectToStudentUpdate(Model model, @PathVariable String id) throws IOException {

		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

		Student studentForm = studentService.selectStudentByID(Integer.parseInt(id));
		System.out.println("Id get: " + studentForm.getStudentID());
		model.addAttribute("studentForm", studentForm);
		return "updateStudent";
	}

	@RequestMapping(value = { "/updateStudent" }, method = RequestMethod.POST)
	public String updatePerson(Model model, //
			@ModelAttribute Student studentForm) {
		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

		if (studentForm.getStudentCode() != null && studentForm.getStudentName() != null
				&& studentForm.getAddress() != null && studentForm.getStudentCode().length() > 0
				&& studentForm.getStudentName().length() > 0 && studentForm.getAddress().length() > 0) {
			studentService.updateStudent(studentForm);
			return "redirect:/";
		}
		model.addAttribute("errorMessage", "Student's information is requied");
		return "redirect:/updateStudent/"+studentForm.getStudentID();
	}

}
