package com.project.myapp.movie.review;

import java.util.List;

public interface IReviewRepository {
	/*
	 * 사용자 기능
	 * 1. 특정 영화의 모든 리뷰 보기
	 *  - 영화 상세보기 페이지에서 리뷰 보기 누르면 list형태로 리뷰들을 불러옴
	 *  
	 * 2. 리뷰 작성
	 *  - 내용 / 별점 입력후 리뷰 작성버튼 누르면 해당 리뷰를 DB에 저장
	 *  
	 * 3. 리뷰 수정하기
	 *  - 내가 작성한 리뷰를 수정하면 정보 update
	 *  
	 *  
	 * 관리자 기능
	 * 1. 리뷰리스트 불러오기
	 *  - 유저들이 작성한 전체 리뷰리스트 출력 
	 *  
	 * 2. 리뷰 상세보기
	 *  - 출력된 리뷰 클릭시 상세보기 페이지로 이동, 관리자가 선택한 리뷰 상세정보 출력
	 * 
	 * 3. 특정 리뷰 숨기기
	 * - 특정 리뷰의 상세정보 페이지에서 관리자가 숨기기 버튼을 누르면 해당 리뷰의 status 변경하는 sql문 실행
	 * */
	
	// 사용자
	// 1. 특정 영화의 모든 리뷰 보기
	List<ReviewVO> getReviewList(int filmId);
	
	// 2. 리뷰 작성
	void insertReview(ReviewVO review);
	
	// 회의 필요
	// 3. 리뷰 수정
	//void updateReview(ReviewVO review);
	// 4. 리뷰 삭제
	//void deleteReview(@Param("memberId") int memberId, @Param("reviewId") int reviewId);
	
	// 관리자
	// 1. 리뷰리스트 불러오기
	List<ReviewVO> getReviewList();

	// 2. 리뷰 상세보기
	ReviewVO getReviewInfo(int reviewId);
	
	// 3. 특정 리뷰 숨기기
	void blindReview(int reivewId);
	
	
}
