package com.project.myapp.movie.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ReviewService implements IReviewService {

	@Autowired
	@Qualifier("IReviewRepository")
	IReviewRepository reviewRepository;
	
	
	// -----------------<사용자>-----------------
	@Override
	public List<ReviewVO> getFilmReviewList(String filmId) {
		return reviewRepository.getFilmReviewList(filmId);
	}

	@Override
	public void insertReview(ReviewVO review) {
		reviewRepository.insertReview(review);	
	}

	// <사용자> 본인의 총 영화 감상시간 출력
	@Override
	public String getMyTime(String memberId) {
		return reviewRepository.getMyTime(memberId);
	}
	
	// <사용자> 자신이 리뷰를 작성한 영화 목록을 최신순으로 출력
	@Override
	public List<ReviewFilmVO> getMyReviewListByTime(String memberId) {
		return reviewRepository.getMyReviewListByTime(memberId);
	}
	
	// <사용자> 자신이 리뷰를 작성한 영화 목록을 자신이 부여한 별점순으로 출력
	@Override
	public List<ReviewFilmVO> getMyReviewListByStar(String memberId) {
		return reviewRepository.getMyReviewListByStar(memberId);
	}
	
	// -----------------<관리자>-----------------
	// <관리자> 모든 사용자의 리뷰 리스트 출력
	@Override
	public List<ReviewVO> getReviewList() {
		return reviewRepository.getReviewList();
	}
	
	// <관리자> 상세 리뷰 정보 출력
	@Override
	public ReviewVO getReviewInfo(String reviewId) {
		return reviewRepository.getReviewInfo(reviewId);
	}

	// <관리자> 리뷰 숨김 기능
	@Override
	public void blindReview(String reviewId) {
		reviewRepository.blindReview(reviewId);
	}

	@Override
	public ReviewVO getMyReview(String memberId, String filmId) {
		return reviewRepository.getMyReview(memberId, filmId);
	}

	@Override
	public void updateLikeCount(String reviewId) {
		reviewRepository.updateLikeCount(reviewId);
	}

}
