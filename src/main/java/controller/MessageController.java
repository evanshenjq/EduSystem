package controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import bean.EduMessage;
import bean.Msg;
import service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message")
	@ResponseBody
	public Msg getMessages(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		
		//����pagehelper�Ĳ��
		//����ҳ�룬ÿҳ��С
		PageHelper.startPage(pn,5);
		//startPage��Ĳ�ѯ���Ƿ�ҳ��ѯ
		List<EduMessage> list=messageService.getAll();
		
		//��������������ʾҳ��
		PageInfo<EduMessage> page=new PageInfo<EduMessage>(list,5);
		
		
		return Msg.success().add("page", page);
	}
	
	
	@RequestMapping(value="/message/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getMessage(@PathVariable("id")Long mId) {
		
		EduMessage message=messageService.getMessageById(mId);
		
		return Msg.success().add("message", message);
	}
	
	@RequestMapping(value="/messageAdd",method=RequestMethod.POST)
	@ResponseBody
	public Msg addMessage(EduMessage message) {
		message.setmCreated(new Date());
		messageService.addMessage(message);
		
		return Msg.success();
	}
	

}
