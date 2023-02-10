package com.project.myapp.movie.reviewlike;

import java.util.List;

public class ReviewLikeVO {
	private String reviewLikeId;	// 좋아요 식별번호
	private String reviewId;		// 리뷰 식별번호
	private String memberId;		// 사용자 식별번호
	
	// 작성자 : 손일형
	private String likeyn;			// 좋아요 여부 (디폴트 0, 좋아요 : 1)
	private List<ReviewLikeVO> reviewlikelistvo;
	
	public String getReviewLikeId() {
		return reviewLikeId;
	}
	public void setReviewLikeId(String reviewLikeId) {
		this.reviewLikeId = reviewLikeId;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getLikeyn() {
		return likeyn;
	}
	public void setLikeyn(String likeyn) {
		this.likeyn = likeyn;
	}

	public List<ReviewLikeVO> getReviewlikelistvo() {
		return reviewlikelistvo;
	}
	public void setReviewlikelistvo(List<ReviewLikeVO> reviewlikelistvo) {
		this.reviewlikelistvo = reviewlikelistvo;
	}
	
	ReviewLikeVO(){}
	
	@Override
	public String toString() {
		return "ReviewLikeVO [reviewLikeId=" + reviewLikeId + ", reviewId=" + reviewId + ", memberId=" + memberId
				+ ", likeyn=" + likeyn + "]";
	}

}
