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
import bean.EduTeacher;
import bean.Msg;
import service.TeacherService;
import utils.IDUtils;

@Controller
public class TeacherController {
	
	@Autowired
	TeacherService teacherService;
	
	@RequestMapping("/fileTeacher")
	public String fileStudent() {
		return "fileTeacher";
	}
	
	@RequestMapping("/listTeacher")
	public String listStudent() {
		return "infoTeacher";
	}
	
	@RequestMapping("/userTeacher")
	public String userTeacher() {
		return "userTeacher";
	}
	
	@RequestMapping("/labTeacher")
	public String labTeacher() {
		return "labTeacher";
	}
	
	@RequestMapping(value="/registerTeacher",method=RequestMethod.POST)
	@ResponseBody
	public Msg registerTeacher(@Valid EduTeacher teacher,BindingResult result) {
		
		if(result.hasErrors()) {
			Map<String,Object> map=new HashMap();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError:errors) {
				map.put(fieldError.getField(),fieldError.getDefaultMessage());
			}
			return Msg.failed().add("errorFiledMap", map);
		}else {
			teacher.settId(IDUtils.genRandomId());
			teacherService.addTeacher(teacher);
			return Msg.success();
		}
		
	}
	
	
	@RequestMapping(value="/checkTName",method=RequestMethod.POST)
	@ResponseBody
	public Msg checkTeacherName(String tUsername) {
		
		String regx="[a-zA-Z][a-zA-Z0-9]{3,11}";
		if(!tUsername.matches(regx)) {
			return Msg.failed().add("va_msg", "用户名必须是4-12位英文和数字组合，且首字母为英文");
		}
		boolean b=teacherService.hasTeacher(tUsername);
		if(b) {
			return Msg.success();
		}else {
			return Msg.failed().add("va_msg", "该用户已经存在");
		}
	}
	
	
	@RequestMapping(value="/loginTeacher",method=RequestMethod.POST)
	@ResponseBody
	public Msg loginStudent(String tUsername,String tPassword) {
		
		EduTeacher teacher=teacherService.loginTeacher(tUsername, tPassword);
		if(teacher!=null) {
			return Msg.success().add("teacher", teacher);
		}else {
			return Msg.failed().add("va_msg", "请输入正确的用户名和密码");
		}
		
	}
	
	@RequestMapping(value="/getTeacher/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getTeacher(@PathVariable("id")Long tId) {
		
		EduTeacher teacher=teacherService.getTeacherById(tId);
		return Msg.success().add("teacherInfo", teacher);
	}
	
	
	@RequestMapping(value="/updateTeacher",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateTeacher(EduTeacher eduTeacher) {
		
		teacherService.updateTeacher(eduTeacher);
		
		return Msg.success();
	}
	
	
	
	
}
