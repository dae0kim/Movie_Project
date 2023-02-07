package com.project.myapp.movie.reviewlike;

public interface IReviewLikeService {

	// 1. 좋아요 누름
	void insertReviewLike(ReviewLikeVO reviewLike);
	
	// 2. 리뷰의 좋아요 수 COUNT
	String getReviewLikeCount(String reviewId);
	
	// 3. 내가 좋아요를 했는지 체크
	String likeCheck(String reviewId, String memberId);

}
