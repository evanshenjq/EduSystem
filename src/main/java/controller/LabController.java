package controller;

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

import bean.EduLab;
import bean.EduMessage;
import bean.Msg;
import service.LabService;

@Controller
public class LabController {
	
	@Autowired
	LabService labService;
	
	@RequestMapping(value="/getLabs",method=RequestMethod.GET)
	@ResponseBody
	public Msg getLabs(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		
		//引入pagehelper的插件
		//传入页码，每页大小
		PageHelper.startPage(pn,5);
		//startPage后的查询就是分页查询
		List<EduLab> list=labService.getLabs();
		//构造器，连续显示页数
		PageInfo<EduLab> page=new PageInfo<EduLab>(list,5);
				
				
		return Msg.success().add("page", page);
		
	}
	
	@RequestMapping(value="/addLab",method=RequestMethod.POST)
	@ResponseBody
	public Msg addLab(EduLab eduLab) {
		
		labService.addLab(eduLab);
		
		return Msg.success();
		
	}
	
	
	@RequestMapping(value="/lab/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getLab(@PathVariable("id")Long lId) {
		EduLab eduLab=labService.getEduLabById(lId);
		return Msg.success().add("eduLab", eduLab);
	}
	
	@RequestMapping(value="/editLab",method=RequestMethod.POST)
	@ResponseBody
	public Msg editLab(EduLab eduLab) {
		
		labService.editLab(eduLab);
		return Msg.success();
	}
	
	@RequestMapping(value="/delLab/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg delLab(@PathVariable("id")Long lId) {
		
		labService.delLab(lId);
		return Msg.success();
	}
	

}
