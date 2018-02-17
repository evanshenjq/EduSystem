package service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import bean.EduFile;
@Service
public interface EduFileService {
	
	public List<EduFile> getFiles();
	
	public boolean uploadFile(MultipartFile file,String fTName);
	
	public boolean downloadFile(Long fId);
	
}
