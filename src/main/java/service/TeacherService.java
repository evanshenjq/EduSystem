package service;

import org.springframework.stereotype.Service;

import bean.EduStudent;
import bean.EduTeacher;
@Service
public interface TeacherService {
	
	//ע��ҵ��
	public void addTeacher(EduTeacher eduTeacher);
	
	//����û�������
	public boolean hasTeacher(String username);
	
	//��½ҵ��
	public EduTeacher loginTeacher(String username,String password);
	
	//�õ��û���Ϣ
	public EduTeacher getTeacherById(Long tId);
		
	//�����û�����
	public void updateTeacher(EduTeacher eduTeacher);
	
}
