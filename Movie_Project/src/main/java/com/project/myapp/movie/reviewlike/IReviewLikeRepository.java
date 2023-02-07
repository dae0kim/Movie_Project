package com.project.myapp.movie.reviewlike;

import org.apache.ibatis.annotations.Param;

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
	
	
	// 1. 좋아요 누름
	void insertReviewLike(ReviewLikeVO reviewLike);
	
	// 2. 리뷰의 좋아요 수 COUNT
	String getReviewLikeCount(String reviewId);
	
	// 3. 내가 좋아요를 했는지 체크 
	// 작성자 : 손일형
	String likeCheck(@Param("reviewId") String reviewId, @Param("memberId") String memberId);

	//작성자: 이기쁨
	//리뷰좋아요 삭제(본인이 작성한 리뷰좋아요) 
	int deleteMyReviewLike(String memberId);
	//리뷰좋아요 삭제(탈퇴할 회원이 쓴 리뷰에 달린 리뷰좋아요) 
	int deleteReviewLike(String memberId);

}
