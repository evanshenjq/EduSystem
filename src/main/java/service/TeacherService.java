package service;

import org.springframework.stereotype.Service;

import bean.EduStudent;
import bean.EduTeacher;
@Service
public interface TeacherService {
	
	//注册业务
	public void addTeacher(EduTeacher eduTeacher);
	
	//检测用户名存在
	public boolean hasTeacher(String username);
	
	//登陆业务
	public EduTeacher loginTeacher(String username,String password);
	
	//得到用户信息
	public EduTeacher getTeacherById(Long tId);
		
	//更改用户密码
	public void updateTeacher(EduTeacher eduTeacher);
	
}
