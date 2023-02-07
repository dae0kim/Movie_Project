package com.project.myapp.movie.reviewlike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeService implements IReviewLikeService {
	
	@Autowired
	@Qualifier("IReviewLikeRepository")
	IReviewLikeRepository reviewLikeRepository;

	
	@Override
	public void insertReviewLike(ReviewLikeVO reviewLike) {
		reviewLikeRepository.insertReviewLike(reviewLike);
	}

	@Override
	public String getReviewLikeCount(String reviewId) {
		return reviewLikeRepository.getReviewLikeCount(reviewId);
	}

	@Override
	public String likeCheck(String reviewId, String memberId) {
		return reviewLikeRepository.likeCheck(reviewId, memberId);
	}

}
