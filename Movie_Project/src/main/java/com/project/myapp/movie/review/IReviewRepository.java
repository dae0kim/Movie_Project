package com.project.myapp.movie.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IReviewRepository {
	/*
	 * <사용자>
	 * 1. 특정 영화의 모든 리뷰 보기
	 *  - 영화 상세보기 페이지에서 리뷰 보기 누르면 list형태로 리뷰들을 불러옴
	 *  
	 * 2. 리뷰 작성
	 *  - 내용 / 별점 입력후 리뷰 작성버튼 누르면 해당 리뷰를 DB에 저장
	 *  
	 * 3. 리뷰 수정하기
	 *  - 내가 작성한 리뷰를 수정하면 정보 update
	 *  
	 * // 마이페이지 리뷰 관련 메서드
	 * 4. 자신의 총 영화 감상시간 출력
	 * 5. 리뷰 작성한 영화 목록 출력(리뷰 작성순)
	 * 6. 리뷰 작성한 영화 목록 출력(본인 별점순)
	 *  
	 *  
	 * <관리자>
	 * 1. 리뷰리스트 불러오기
	 *  - 유저들이 작성한 전체 리뷰리스트 출력 
	 *  
	 * 2. 리뷰 상세보기
	 *  - 출력된 리뷰 클릭시 상세보기 페이지로 이동, 관리자가 선택한 리뷰 상세정보 출력
	 * 
	 * 3. 특정 리뷰 숨기기
	 * - 특정 리뷰의 상세정보 페이지에서 관리자가 숨기기 버튼을 누르면 해당 리뷰의 status 변경하는 sql문 실행
	 * */
	
	// -----------------<사용자>-----------------
	// 1. 특정 영화의 모든 리뷰 보기
	List<ReviewVO> getFilmReviewList(@Param("filmId") String filmId);
	
	// 2. 리뷰 작성
	void insertReview(ReviewVO review);
	
	// 3. 내 리뷰 보기
	// 작성자 : 손일형
	ReviewVO getMyReview(@Param("memberId") String memberId, @Param("filmId") String filmId);
	
	// 4. 내 리뷰 좋아요 카운트 업데이트
	// 작성자 : 손일형
	void updateLikeCount(@Param("reviewId") String reviewId);
	
	// 회의 필요
	// 3. 리뷰 수정
	//void updateReview(ReviewVO review);
	
	// 4. 자신의 총 영화 감상시간 출력
	String getMyTime(String memberId);

	// 5. 리뷰 작성한 영화 목록 출력 + 별점(리뷰 작성순)
	List<ReviewFilmVO> getMyReviewListByTime(String memberId);
	
	// 6. 리뷰 작성한 영화 목록 출력 + 별점(본인 별점순)
	List<ReviewFilmVO> getMyReviewListByStar(String memberId);
		
	//리뷰 삭제
	//작성자: 이기쁨
	int deleteReview(String memberId);
		
	// -----------------<관리자>-----------------
	// 1. 리뷰리스트 불러오기
	List<ReviewVO> getReviewList();

	// 2. 리뷰 상세보기
	ReviewVO getReviewInfo(String reviewId);
	
	// 3. 특정 리뷰 숨기기
	void blindReview(String reivewId);
	
	
	
	
}
