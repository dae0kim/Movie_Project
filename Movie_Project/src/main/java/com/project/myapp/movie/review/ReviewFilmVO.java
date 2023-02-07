package com.project.myapp.movie.review;
 
// 영화 제목, 자신의 별점, 포스터 정보 출력을 위한 추가적인 VO
public class ReviewFilmVO {
	private String filmTitle;
	private String starScore;
	private String fileName;
	private String fileId;
	private String filmId;
	
	public String getFilmTitle() {
		return filmTitle;
	}
	public void setFilmTitle(String filmTitle) {
		this.filmTitle = filmTitle;
	}
	public String getStarScore() {
		return starScore;
	}
	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
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
	ReviewFilmVO(){}
	
	@Override
	public String toString() {
		return "ReviewFilmVO [filmTitle=" + filmTitle + ", starScore=" + starScore + ", fileName=" + fileName
				+ ", fileId=" + fileId + "]";
	}
}
