package service;

import java.util.List;

import org.springframework.stereotype.Service;

import bean.EduLab;

@Service
public interface LabService {
	
	public List<EduLab> getLabs();
	
	public void delLab(Long lId);
	
	public void editLab(EduLab eduLab);
	
	public void addLab(EduLab eduLab);
	
	public EduLab getEduLabById(Long lId);

}
