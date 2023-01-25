package com.project.myapp.movie.review;

import java.util.List;

public interface IReviewService {
	// 사용자
	// 1. 특정 영화의 모든 리뷰 보기
	List<ReviewVO> getReviewList(int filmId);
	
	// 2. 리뷰 작성
	void insertReview(ReviewVO review);
	
	// 회의 필요
	// 3. 리뷰 수정
	//void updateReview(ReviewVO review);
	// 4. 리뷰 삭제
	//void deleteReview(int memberId, int reviewId);
	
	// 관리자
	// 1. 리뷰리스트 불러오기
	List<ReviewVO> getReviewList();

	// 2. 리뷰 상세보기
	ReviewVO getReviewInfo(int reviewId);
	
	// 3. 특정 리뷰 숨기기
	void blindReview(int reivewId);
}
