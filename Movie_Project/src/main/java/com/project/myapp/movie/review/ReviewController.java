package com.project.myapp.movie.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.movie.basket.IBasketService;
import com.project.myapp.movie.film.FilmVO;
import com.project.myapp.movie.film.IFilmService;

@Controller
public class ReviewController {

	@Autowired
	IReviewService reviewService;
	
	@Autowired
	IFilmService filmService;
	
	@Autowired
	IBasketService basketService;
	
	// -----------------<사용자>-----------------
	// 마이페이지
	// 총 영화 감상시간 출력 + 리뷰작성날짜 기준 리스트 출력 + 평점높은순 리스트 출력 + 해당 영화에 사용자가 준 별점 출력
	// 작성자 : 김대영
	@RequestMapping(value="/member/mypage/{memberId}")
	public String getMyTime(@PathVariable String memberId,Model model) {
		String myTime = reviewService.getMyTime(memberId);
		List<ReviewFilmVO> myReviewByTime = reviewService.getMyReviewListByTime(memberId);
		List<ReviewFilmVO> myReviewByStar = reviewService.getMyReviewListByStar(memberId);
		
		// 위시리스트 출력
		// 작성자 : 김미리 
		List<FilmVO> BasketList = basketService.getBasketList(memberId);

		model.addAttribute("myTime", myTime);
		model.addAttribute("myReviewByTime", myReviewByTime);
		model.addAttribute("myReviewByStar", myReviewByStar);
		// 위시리스트 출력
		// 작성자 : 김미리 
		model.addAttribute("BasketList", BasketList);

		return "member/mypage";
	}

	//------------------------------------------------------------------------------
	// 1. [리뷰입력하기] 누를시 리뷰폼으로 이동
	// 작성자 : 손일형
	@RequestMapping(value = "/insertreview", method = RequestMethod.POST)
	public String reviewForm(HttpServletRequest request) {
		
		return "review/insertreview";
	}

	// 2. 리뷰입력창에서 영화정보 불러옴
	// 작성자 : 손일형
	@RequestMapping(value = "/insertreview/{filmId}")
	public String getFilmInfo(@PathVariable String filmId, Model model) {
		FilmVO filmInfo = filmService.getFilmInfo(filmId);
		model.addAttribute("filmInfo", filmInfo);
		
		return "review/insertreview";
	}

	// 3. 입력된 리뷰 DB에 저장
	// 작성자 : 손일형
	@RequestMapping(value = "/insertreview/{filmId}", method = RequestMethod.POST)
	public String insertReview(ReviewVO rev, String filmId, RedirectAttributes redirectAttributes) {
		reviewService.insertReview(rev);
		filmService.updateRivewCount(filmId);
		
		// 리뷰 작성 완료되면 이전페이지로 이동함
		return "redirect:/film/" + rev.getFilmId() + "/" + rev.getMemberId(); 
	}
	
	
	// 4. 해당 영화에 작성된 리뷰 출력
	// 작성자 : 손일형
	@RequestMapping(value = "/review/review_list/{filmId}")
	public String getFilmReviewList(String filmId, Model model) {
		List<ReviewVO> reviewlist = reviewService.getFilmReviewList(filmId);				
		model.addAttribute("reviewlist", reviewlist);
						
		return "review/review_list";
	}
	
}
