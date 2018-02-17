package service;

import org.springframework.stereotype.Service;

import bean.EduStudent;

@Service
public interface StudentService {
	
	//注册业务
	public void addStudent(EduStudent eduStudent);
	
	//检测用户名存在
	public boolean hasStudent(String username);
	
	//登陆业务
	public EduStudent loginStudent(String username,String password);
	
	//得到用户信息
	public EduStudent getStudentById(Long sId);
	
	//更改用户密码
	public void updateStudent(EduStudent eduStudent);
	
}
