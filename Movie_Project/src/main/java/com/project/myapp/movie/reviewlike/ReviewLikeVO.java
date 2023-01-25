package com.project.myapp.movie.reviewlike;

public class ReviewLikeVO {
	private int reviewLikeId;
	private int reviewId;
	private int memberId;
	
	public int getReviewLikeId() {
		return reviewLikeId;
	}
	public void setReviewLikeId(int reviewLikeId) {
		this.reviewLikeId = reviewLikeId;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	ReviewLikeVO(){}
	
	@Override
	public String toString() {
		return "ReviewLikeVO [reviewLikeId=" + reviewLikeId + ", reviewId=" + reviewId + ", memberId=" + memberId + "]";
	}

}
