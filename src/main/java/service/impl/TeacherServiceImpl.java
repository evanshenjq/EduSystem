package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.EduStudent;
import bean.EduTeacher;
import bean.EduTeacherExample;
import bean.EduTeacherExample.Criteria;
import dao.EduTeacherMapper;
import service.TeacherService;
@Service
public class TeacherServiceImpl implements TeacherService {
	
	@Autowired
	EduTeacherMapper eduTeacherMapper;

	public void addTeacher(EduTeacher eduTeacher) {
		
		eduTeacherMapper.insert(eduTeacher);
		
	}

	public boolean hasTeacher(String username) {
		
		EduTeacherExample example=new EduTeacherExample();
		Criteria criteria=example.createCriteria();
		criteria.andTUsernameEqualTo(username);
		long count=eduTeacherMapper.countByExample(example);
		//count==0时，证明此用户可用
		return count==0;
	}

	public EduTeacher loginTeacher(String username, String password) {
		
		EduTeacherExample example=new EduTeacherExample();
		Criteria criteria=example.createCriteria();
		criteria.andTUsernameEqualTo(username);
		criteria.andTPasswordEqualTo(password);
		List<EduTeacher> list=eduTeacherMapper.selectByExample(example);
		if(list.size()!=0) {
			EduTeacher teacher=list.get(0);
			return teacher;
		}else {
			return null;
		}
	}
	
	@Override
	public EduTeacher getTeacherById(Long tId) {
		
		EduTeacher eduTeacher=eduTeacherMapper.selectByPrimaryKey(tId);
		return eduTeacher;
	}

	@Override
	public void updateTeacher(EduTeacher teacher) {
		eduTeacherMapper.updateByPrimaryKeySelective(teacher);
		
	}

}
