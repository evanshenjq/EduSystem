package service;

import java.util.List;

import org.springframework.stereotype.Service;

import bean.EduMessage;

@Service
public interface MessageService {

	public List<EduMessage> getAll();
	
	public EduMessage getMessageById(Long mId);
	
	public void addMessage(EduMessage message);
	
}
