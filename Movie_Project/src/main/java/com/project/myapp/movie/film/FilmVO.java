package com.project.myapp.movie.film;

public class FilmVO {
	private int filmId;
	private String filmTitle;
	private String releaseDate;
	private String posterUrl;
	private int starAverage;
	private String runTime;
	private int reviewCount;
	private String genre;
	private String director;
	private String mainActor;
	private String subActor;
	private String summary;
	private String filmRate;
	private String country;
	private String filmStatus;
	
	public int getFilmId() {
		return filmId;
	}
	public void setFilmId(int filmId) {
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
	public String getPosterUrl() {
		return posterUrl;
	}
	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}
	public int getStarAverage() {
		return starAverage;
	}
	public void setStarAverage(int starAverage) {
		this.starAverage = starAverage;
	}
	public String getRunTime() {
		return runTime;
	}
	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
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
	public String getFilmStatus() {
		return filmStatus;
	}
	public void setFilmStatus(String filmStatus) {
		this.filmStatus = filmStatus;
	}
	
	FilmVO(){}
	@Override
	public String toString() {
		return "FilmVO [filmId=" + filmId + ", filmTitle=" + filmTitle + ", releaseDate=" + releaseDate + ", posterUrl="
				+ posterUrl + ", starAverage=" + starAverage + ", runTime=" + runTime + ", reviewCount=" + reviewCount
				+ ", genre=" + genre + ", director=" + director + ", mainActor=" + mainActor + ", subActor=" + subActor
				+ ", summary=" + summary + ", filmRate=" + filmRate + ", country=" + country + ", filmStatus="
				+ filmStatus + "]";
	}
	
}
