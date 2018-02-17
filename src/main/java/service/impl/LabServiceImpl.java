package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bean.EduLab;
import dao.EduLabMapper;
import service.LabService;

@Service
public class LabServiceImpl implements LabService {
	
	@Autowired
	EduLabMapper eduLabMapper;

	@Override
	public List<EduLab> getLabs() {
		List<EduLab> list=eduLabMapper.selectByExample(null);
		return list;
	}

	@Override
	public void delLab(Long lId) {
		eduLabMapper.deleteByPrimaryKey(lId);
	}

	@Override
	public void editLab(EduLab eduLab) {
		eduLabMapper.updateByPrimaryKeySelective(eduLab);

	}

	@Override
	public void addLab(EduLab eduLab) {
		eduLabMapper.insertSelective(eduLab);
	}

	@Override
	public EduLab getEduLabById(Long lId) {
		EduLab eduLab=eduLabMapper.selectByPrimaryKey(lId);
		return eduLab;
	}

}
