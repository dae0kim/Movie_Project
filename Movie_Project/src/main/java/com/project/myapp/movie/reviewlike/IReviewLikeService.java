package com.project.myapp.movie.reviewlike;

public interface IReviewLikeService {
	// 좋아요 누르기
	void insertReviewLike(ReviewLikeVO reviewLike);
	
	// 좋아요 수 반환
	int getReviewLikeCount(int reviewId);
}
