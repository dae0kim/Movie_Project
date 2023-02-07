package com.project.myapp.movie.uploadfile;

import java.util.List;

public interface IUploadFileRepository {

	// -----------------<사용자 + 관리자>-----------------
	// 포스터 이미지 파일 정보 가져오기
	UploadFileVO getFile(String fileId);
	
	// -----------------<관리자>-----------------
	// 포스터 이미지 파일 업로드
	void uploadFile(UploadFileVO file);
	
	// 포스터 이미지 파일 수정
	void updateFile(UploadFileVO file);
	
	// 포스터 이미지 파일 삭제
	void deleteFile(String fileId);	
	
	// upload_file 테이블의 모든 파일 정보 리스트로 출력
	List<UploadFileVO> getImageList(String directoryName);

}
