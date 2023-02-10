package com.project.myapp.movie.reviewlike;

//작성자 : 김대영
public interface IReviewLikeService {

	// 좋아요 누름
	void insertReviewLike(ReviewLikeVO reviewLike);
	
	// 리뷰의 좋아요 수 COUNT
	String getReviewLikeCount(String reviewId);
	
	// 내가 좋아요를 했는지 체크
	// 작성자 : 손일형
	String likeCheck(String reviewId, String memberId);

}
