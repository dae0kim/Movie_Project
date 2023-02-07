package com.project.myapp.movie.uploadfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UploadFileService implements IUploadFileService {
	
	@Autowired
	IUploadFileRepository uploadFileRepository;
	
	// -----------------<사용자 + 관리자>-----------------
	@Override
	public UploadFileVO getFile(String fileId) {
		return uploadFileRepository.getFile(fileId);
	}
	
	// -----------------<관리자>-----------------
	@Override
	public void uploadFile(UploadFileVO file) {
		uploadFileRepository.uploadFile(file);
	}

	@Override
	public List<UploadFileVO> getImageList(String directoryName) {
		return uploadFileRepository.getImageList(directoryName);
	}

	@Override
	public void updateFile(UploadFileVO file) {
		uploadFileRepository.updateFile(file);
	}

	@Override
	public void deleteFile(String fileId) {
		uploadFileRepository.deleteFile(fileId);
	}


}
