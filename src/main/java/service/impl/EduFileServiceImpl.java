package service.impl;

import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import bean.EduFile;
import dao.EduFileMapper;
import service.EduFileService;
import utils.AddressUtil;
import utils.FtpUtil;
@Service
public class EduFileServiceImpl implements EduFileService {
	
	@Value("${FTP_ADDRESS}")
	private String FTP_ADDRESS;
	@Value("${FTP_PORT}")
	private Integer FTP_PORT;
	@Value("${FTP_USERNAME}")
	private String FTP_USERNAME;
	@Value("${FTP_PASSWORD}")
	private String FTP_PASSWORD;
	@Value("${FTP_BASE_PATH}")
	private String FTP_BASE_PATH;
	@Value("${IMAGE_BASE_URL}")
	private String IMAGE_BASE_URL;
	
	
	@Autowired
	EduFileMapper eduFileMapper;

	@Override
	public List<EduFile> getFiles() {
		
		List<EduFile> files=eduFileMapper.selectAll(null);
		
		return files;
	}

	@Override
	public boolean uploadFile(MultipartFile file,String fTName) {
		boolean b=false;
		try {
			//生成一个新的图片名字
			//取原始文件名
			String oldName=file.getOriginalFilename();
			
			//图片上传
			String imagePath=new DateTime().toString("/yyyy/MM/dd");
			boolean result=FtpUtil.uploadFile(FTP_ADDRESS, FTP_PORT, FTP_USERNAME,
					FTP_PASSWORD, FTP_BASE_PATH, 
					imagePath, oldName, file.getInputStream());
			
			EduFile f=new EduFile();
			f.setfName(oldName);
			f.setfUrl(IMAGE_BASE_URL+imagePath+"/"+oldName);
			f.setfCreated(new Date());
			f.setfTName(fTName);
			eduFileMapper.insert(f);
			//返回结果
			if(!result) {
				return b;
			}
			
			return !b;
			
		} catch (Exception e) {
			return b;
		}
	}

	@Override
	public boolean downloadFile(Long fId) {
		EduFile eduFile=eduFileMapper.selectByPrimaryKey(fId);
		String address=AddressUtil.replaceAddress(eduFile.getfUrl());
		System.out.println(address);
		boolean b=FtpUtil.downloadFile(FTP_ADDRESS, FTP_PORT, FTP_USERNAME, FTP_PASSWORD,
				address, eduFile.getfName(), "C:\\Users\\evan\\Desktop");
		return b;
	}
	
	
	

}
