package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bean.EduMessage;
import dao.EduMessageMapper;
import service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	EduMessageMapper eduMessageMapper;

	@Override
	public List<EduMessage> getAll() {
		
		List<EduMessage> list=eduMessageMapper.selectAll(null);

		return list;
	}

	@Override
	public EduMessage getMessageById(Long mId) {
			
		return eduMessageMapper.selectByPrimaryKey(mId);
	}

	@Override
	public void addMessage(EduMessage message) {
		eduMessageMapper.insert(message);
	}

}
