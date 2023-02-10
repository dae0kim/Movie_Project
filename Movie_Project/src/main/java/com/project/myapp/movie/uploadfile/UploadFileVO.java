package com.project.myapp.movie.uploadfile;

import java.util.Arrays;

//작성자 : 김대영
public class UploadFileVO {
	private String fileId;
	private String directoryName;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private byte[] fileData;
	private String filmId;
	
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	public String getDirectoryName() {
		return directoryName;
	}
	public void setDirectoryName(String directoryName) {
		this.directoryName = directoryName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	
	@Override
	public String toString() {
		return "UploadFileVO [fileId=" + fileId + ", filmId=" + filmId + ", directoryName=" + directoryName
				+ ", fileName=" + fileName + ", fileSize=" + fileSize + ", fileContentType=" + fileContentType
				+ ", fileData=" + Arrays.toString(fileData) + "]";
	}
	
}
