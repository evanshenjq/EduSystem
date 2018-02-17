package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import bean.EduFile;
import bean.EduMessage;
import bean.Msg;
import service.EduFileService;

@Controller
public class FileController {

	@Autowired
	EduFileService eduFileService;
	
	@RequestMapping("/files")
	@ResponseBody
	public Msg getFiles(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		
		//����pagehelper�Ĳ��
		//����ҳ�룬ÿҳ��С
		PageHelper.startPage(pn,5);
		//startPage��Ĳ�ѯ���Ƿ�ҳ��ѯ
		List<EduFile> list=eduFileService.getFiles();
		
		//��������������ʾҳ��
		PageInfo<EduFile> page=new PageInfo<EduFile>(list,5);
		
		
		return Msg.success().add("page", page);
	}
	
	@RequestMapping("/uploadFile")
	@ResponseBody
	public Msg fileUpload(@RequestParam("uploadfile")MultipartFile uploadFile,@RequestParam("name")String fTName) {
		
		boolean b=eduFileService.uploadFile(uploadFile,fTName);
		
		if(b) {
			return Msg.success();
		}else {
			return Msg.failed();
		}
		
	}
	
	@RequestMapping(value="/downloadFile/{fId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg fileDownload(@PathVariable("fId")Long fId) {
		
		boolean b=eduFileService.downloadFile(fId);
		if(b) {
			return Msg.success();
		}
		
		return Msg.failed();
	}
}
