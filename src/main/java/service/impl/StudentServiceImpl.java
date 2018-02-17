package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.EduStudent;
import bean.EduStudentExample;
import bean.EduStudentExample.Criteria;
import dao.EduStudentMapper;
import service.StudentService;
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	EduStudentMapper eduStudentMapper;
	
	public void addStudent(EduStudent eduStudent) {

		eduStudentMapper.insert(eduStudent);
		
	}

	public boolean hasStudent(String username) {
		
		EduStudentExample example=new EduStudentExample();
		Criteria criteria=example.createCriteria();
		criteria.andSUsernameEqualTo(username);
		long count=eduStudentMapper.countByExample(example);
		//count==0时，证明此用户可用
		return count==0;
	}

	public EduStudent loginStudent(String username, String password) {

		EduStudentExample example=new EduStudentExample();
		Criteria criteria=example.createCriteria();
		criteria.andSUsernameEqualTo(username);
		criteria.andSPasswordEqualTo(password);
		List<EduStudent> list=eduStudentMapper.selectByExample(example);
		if(list.size()!=0) {
			EduStudent teacher=list.get(0);
			return teacher;
		}else {
			return null;
		}
	}

	@Override
	public EduStudent getStudentById(Long sId) {
		
		EduStudent eduStudent=eduStudentMapper.selectByPrimaryKey(sId);
		return eduStudent;
	}

	@Override
	public void updateStudent(EduStudent student) {
		eduStudentMapper.updateByPrimaryKeySelective(student);
		
	}
	

}
