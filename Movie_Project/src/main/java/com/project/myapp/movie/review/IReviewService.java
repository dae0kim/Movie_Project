package com.project.myapp.movie.review;

import java.util.List;

public interface IReviewService {
	
	// -----------------<사용자>-----------------
	// 1. 특정 영화의 모든 리뷰 보기
	List<ReviewVO> getFilmReviewList(String filmId);
	
	// 2. 리뷰 작성
	void insertReview(ReviewVO review);
	
	// 3. 내 리뷰 보기
	ReviewVO getMyReview(String memberId, String filmId);
	
	// 4. 내 리뷰 좋아요 카운트 업데이트
	void updateLikeCount(String reviewId);
	
	// 회의 필요
	// 3. 리뷰 수정
	//void updateReview(ReviewVO review);
	
	// 4. 자신의 총 영화 감상시간 출력
	String getMyTime(String memberId);

	// 5. 리뷰 작성한 영화 목록 출력 + 별점(리뷰 작성순)
	List<ReviewFilmVO> getMyReviewListByTime(String memberId);
	
	// 6. 리뷰 작성한 영화 목록 출력 + 별점(본인 별점순)
	List<ReviewFilmVO> getMyReviewListByStar(String memberId);
	
	// -----------------<관리자>-----------------
	// 1. 리뷰리스트 불러오기
	List<ReviewVO> getReviewList();

	// 2. 리뷰 상세보기
	ReviewVO getReviewInfo(String reviewId);
	
	// 3. 특정 리뷰 숨기기
	void blindReview(String reivewId);
}
