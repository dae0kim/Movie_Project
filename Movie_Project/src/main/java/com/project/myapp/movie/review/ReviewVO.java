package com.project.myapp.movie.review;

//작성자 : 김대영
public class ReviewVO {
	private String reviewId;
	private String reviewContent;
	private String starScore;
	private String reviewDate;
	private String reviewStatus;
	private String likeCount;
	private String memberId;
	private String filmId;
	
	// 추가 : 리뷰카운트 실시간 업데이트 위함
	// 작성자 : 손일형
	private String reviewLikeId;			// 리뷰 좋아요 id
	
	// 추가 : 리뷰리스트 JOIN문에서 닉네임 출력위해 추가
	// 작성자 : 손일형
	private String nickname;				// 닉네임
	
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
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
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	public String getReviewLikeId() {
		return reviewLikeId;
	}
	public void setReviewLikeId(String reviewLikeId) {
		this.reviewLikeId = reviewLikeId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	ReviewVO(){}

	@Override
	public String toString() {
		return "ReviewVO [reviewId=" + reviewId + ", reviewContent=" + reviewContent + ", starScore=" + starScore
				+ ", reviewDate=" + reviewDate + ", reviewStatus=" + reviewStatus + ", likeCount=" + likeCount
				+ ", memberId=" + memberId + ", filmId=" + filmId + ", reviewLikeId=" + reviewLikeId + ", nickname="
				+ nickname + "]";
	}
}
