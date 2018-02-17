package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.EduStudent;
import bean.Msg;
import service.StudentService;
import utils.IDUtils;

@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	
	@RequestMapping("/fileStudent")
	public String fileStudent() {
		return "fileStudent";
	}
	
	@RequestMapping("/listStudent")
	public String listStudent() {
		return "infoStudent";
	}
	
	@RequestMapping("/userStudent")
	public String userStudent() {
		return "userStudent";
	}
	
	@RequestMapping("/labStudent")
	public String labStudent() {
		return "labStudent";
	}
	
	@RequestMapping(value="/registerStudent",method=RequestMethod.POST)
	@ResponseBody
	public Msg registerStudent(@Valid EduStudent student,BindingResult result) {
		
		if(result.hasErrors()) {
			Map<String,Object> map=new HashMap();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError:errors) {
				map.put(fieldError.getField(),fieldError.getDefaultMessage());
			}
			return Msg.failed().add("errorFiledMap", map);
		}else {
			student.setsId(IDUtils.genRandomId());
			studentService.addStudent(student);
			return Msg.success();
		}
		
	}
	
	
	@RequestMapping(value="/checkSName",method=RequestMethod.POST)
	@ResponseBody
	public Msg checkStudentName(String sUsername) {
		
		String regx="[a-zA-Z][a-zA-Z0-9]{3,11}";
		if(!sUsername.matches(regx)) {
			return Msg.failed().add("va_msg", "用户名必须是4-12位英文和数字组合，且首字母为英文");
		}
		boolean b=studentService.hasStudent(sUsername);
		if(b) {
			return Msg.success();
		}else {
			return Msg.failed().add("va_msg", "该用户已经存在");
		}
	}
	
	@RequestMapping(value="/loginStudent",method=RequestMethod.POST)
	@ResponseBody
	public Msg loginStudent(String sUsername,String sPassword) {
		
		EduStudent student=studentService.loginStudent(sUsername, sPassword);
		if(student!=null) {
			return Msg.success().add("student", student);
		}else {
			return Msg.failed().add("va_msg", "请输入正确的用户名和密码");
		}
		
	}
	
	@RequestMapping(value="/getStudent/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getStudent(@PathVariable("id")Long sId) {
		
		EduStudent student=studentService.getStudentById(sId);
		return Msg.success().add("studentInfo", student);
	}
	
	
	@RequestMapping(value="/updateStudent",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateStudent(EduStudent eduStudent) {
		
		studentService.updateStudent(eduStudent);
		
		return Msg.success();
	}
	
	
}
