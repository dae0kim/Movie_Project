package com.project.myapp.movie.reviewlike;

public interface IReviewLikeRepository {
	/*
	 * 좋아요 기능은 영화 상세페이지 -> 특정 리뷰에 대해 동작하는 것
	 * 
	 * 1. 좋아요 누르기
	 *  - 어떤 리뷰에 좋아요가 눌렸는지 반영하는 동작,DB테이블에 그 정보와 관련된 행을 insert
	 *  
	 * 2. 좋아요 수 반환
	 *  - 좋아요 테이블의 review_id가 같은것의 갯수를 카운트 (ex. SELECT COUNT(review_id) FROM movie.review_like)
	 * */
	
	
	// 좋아요 누르기
	void insertReviewLike(ReviewLikeVO reviewLike);
	
	// 좋아요 수 반환
	int getReviewLikeCount(int reviewId);
}
