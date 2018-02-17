package service;

import org.springframework.stereotype.Service;

import bean.EduStudent;

@Service
public interface StudentService {
	
	//ע��ҵ��
	public void addStudent(EduStudent eduStudent);
	
	//����û�������
	public boolean hasStudent(String username);
	
	//��½ҵ��
	public EduStudent loginStudent(String username,String password);
	
	//�õ��û���Ϣ
	public EduStudent getStudentById(Long sId);
	
	//�����û�����
	public void updateStudent(EduStudent eduStudent);
	
}
