package com.project.myapp.movie.film;

import org.springframework.web.multipart.MultipartFile;

//작성자 : 김대영
public class FilmVO {
	private String filmId;
	private String filmTitle;
	private String releaseDate;
	private String runTime;
	private String starAverage;
	private String reviewCount;
	private String genre;
	private String director;
	private String mainActor;
	private String subActor;
	private String summary;
	private String filmRate;
	private String country;
	
	private MultipartFile file;
	private String fileId;
	private String fileName;
	private String fileSize;
	private String fileContentType;
	
	private String basketId; 		
	
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	public String getFilmTitle() {
		return filmTitle;
	}
	public void setFilmTitle(String filmTitle) {
		this.filmTitle = filmTitle;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getRunTime() {
		return runTime;
	}
	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}
	public String getStarAverage() {
		return starAverage;
	}
	public void setStarAverage(String starAverage) {
		this.starAverage = starAverage;
	}
	public String getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getMainActor() {
		return mainActor;
	}
	public void setMainActor(String mainActor) {
		this.mainActor = mainActor;
	}
	public String getSubActor() {
		return subActor;
	}
	public void setSubActor(String subActor) {
		this.subActor = subActor;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getFilmRate() {
		return filmRate;
	}
	public void setFilmRate(String filmRate) {
		this.filmRate = filmRate;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getBasketId() {
		return basketId;
	}
	public void setBasketId(String basketId) {
		this.basketId = basketId;
	}
	FilmVO(){}
	
	@Override
	public String toString() {
		return "FilmVO [filmId=" + filmId + ", filmTitle=" + filmTitle + ", releaseDate=" + releaseDate + ", runTime="
				+ runTime + ", starAverage=" + starAverage + ", reviewCount=" + reviewCount + ", genre=" + genre
				+ ", director=" + director + ", mainActor=" + mainActor + ", subActor=" + subActor + ", summary="
				+ summary + ", filmRate=" + filmRate + ", country=" + country + ", file=" + file + ", fileId=" + fileId
				+ ", fileName=" + fileName + ", fileSize=" + fileSize + ", fileContentType=" + fileContentType
				+ ", basketId=" + basketId + "]";
	}
	
}
