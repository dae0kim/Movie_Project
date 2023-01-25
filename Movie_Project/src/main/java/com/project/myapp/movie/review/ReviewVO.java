package com.project.myapp.movie.review;

import java.sql.Date;

public class ReviewVO {
	private int reviewId;
	private String reviewContent;
	private String starScore;
	private Date reviewDate;
	private String reviewStatus;
	private int likeCount;
	private int memberId;
	private int filmId;
	
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getStarScore() {
		return starScore;
	}
	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getFilmId() {
		return filmId;
	}
	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}

	ReviewVO(){}
	
	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", reviewContent=" + reviewContent + ", starScore=" + starScore
				+ ", reviewDate=" + reviewDate + ", reviewStatus=" + reviewStatus + ", likeCount=" + likeCount
				+ ", memberId=" + memberId + ", filmId=" + filmId + "]";
	}
	
	
}
