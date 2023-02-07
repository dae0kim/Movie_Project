package com.project.myapp.movie.reviewlike;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.movie.member.IMemberService;
import com.project.myapp.movie.review.IReviewService;

@Controller
public class ReviewLikeController {
	
	@Autowired
	IReviewLikeService reviewLikeService;
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IReviewService reviewService;
	
	// 1. 좋아요 INSERT 및 UPDATE
	// 작성자 : 손일형
	@RequestMapping(value="/insertlike", method = RequestMethod.POST)
	@ResponseBody
	public String insertlike(@RequestParam("memberId") String memberId, 
						     @RequestParam("reviewId") String reviewId, 
						     Locale locale) {		
		ReviewLikeVO vo = new ReviewLikeVO();
		vo.setMemberId(memberId);
		vo.setReviewId(reviewId);			
		
		String likecheck = reviewLikeService.likeCheck(reviewId, memberId);
		String countlike = reviewLikeService.getReviewLikeCount(reviewId);
		
		if(likecheck.equals(likecheck = "0")){
			reviewLikeService.insertReviewLike(vo);
			reviewService.updateLikeCount(reviewId);
		}else{
			reviewService.updateLikeCount(reviewId);
		}				
		return countlike;
	 }	
}

 