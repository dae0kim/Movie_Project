package com.project.myapp.movie.film;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.movie.review.IReviewService;
import com.project.myapp.movie.review.ReviewVO;
import com.project.myapp.movie.reviewlike.IReviewLikeService;

@Controller
public class FilmController {

	@Autowired
	IFilmService filmService;
	
	@Autowired
	IReviewService reviewService;
	
	@Autowired
	IReviewLikeService reviewLikeService;
	
	private final Logger logger = LoggerFactory.getLogger(FilmController.class);
		
	// 영화 상세보기 페이지 출력
	// 작성자 : 손일형
	@RequestMapping(value = "/film/{filmId}/{memberId}")
	public String getFilmInfo(@PathVariable("filmId") String filmId, 
							  @PathVariable("memberId") String memberId,
							  Model model ) {	
		// if-else시작 : 로그인 상태가 아닐때(null)
		if(memberId == null) {
			FilmVO filmInfo = filmService.getFilmInfo(filmId);								// 영화정보 불러옴
			ReviewVO rev = reviewService.getMyReview("0", filmId);							// 로그인 상태 아니면 {memberId} = 0 임의의값 넣어줌
			List<ReviewVO> reviewlist = reviewService.getFilmReviewList(filmId);				// 리뷰리스트 출력
			List<FilmVO> filmInfo2 = filmService.getFilmListByGenreFilmInfo(filmId);		// 같은장르 다른 영화 추천
						
			
			reviewService.getFilmReviewList(filmId);											// 해당영화의 리뷰리스트 출력
			filmService.updateStarAvg(filmId);												// 별점평균 update							
			
			model.addAttribute("filmInfo", filmInfo);						
			model.addAttribute("reviewlist", reviewlist);
			model.addAttribute("rev", rev);
			model.addAttribute("filmInfo2", filmInfo2);
			
			
			
			
		// 로그인 상태일때	
		} else {
			FilmVO filmInfo = filmService.getFilmInfo(filmId);	
			ReviewVO rev = reviewService.getMyReview(memberId, filmId);						// 로그인중이면 {memberId}에 회원번호 들어감
			List<ReviewVO> reviewlist = reviewService.getFilmReviewList(filmId);
			List<FilmVO> filmInfo2 = filmService.getFilmListByGenreFilmInfo(filmId);				

			reviewService.getFilmReviewList(filmId);
			filmService.updateStarAvg(filmId);
			reviewLikeService.likeCheck(filmId, memberId);	

			model.addAttribute("filmInfo", filmInfo);						
			model.addAttribute("reviewlist", reviewlist);
			model.addAttribute("rev", rev);
			model.addAttribute("filmInfo2", filmInfo2);
		}//end if_else
		return "film/film_info";
		}			
	
	// 작성자 : 김미리 
	// 영화 검색 
	@RequestMapping( value="/film/search_view", method = RequestMethod.POST)   
	//@ResponseBody   // 프론트에서 전달 한 json데이터를 해당 파라미터에 매핑시켜야 하기 때문에 필수로 사용 
	public String filmSearch(@RequestParam("keyword") String keyword, FilmVO filmVO, Model model, Locale locale, RedirectAttributes redirectAttributes, HttpSession session, HttpServletRequest request) {
		
	if (keyword == null) {  // 파라미터 값이 없을 시
			String referer = request.getHeader("Referer");  //이전 페이지로 리다이렉트
			return "redirect:/"+  referer;
		}
	else {  //파라미터 값이 있다면 검색결과 출력
			logger.info("filmSearch() search_keyword", keyword, locale);
			
			List<FilmVO> searchFilmInfo = filmService.getFilmSearch(keyword);
			List<FilmVO> searchDirectorInfo = filmService.getDrectorSearch(keyword);
			List<FilmVO> searchActorInfo = filmService.getActorSearch(keyword);
			
			if ((searchFilmInfo == null || searchFilmInfo.size() == 0)  &&  (searchDirectorInfo == null || searchDirectorInfo.size() == 0) && (searchActorInfo == null || searchActorInfo.size() == 0)){
				session.setAttribute("search_keyword", keyword);
				return "film/no_result";
			}

			else {
			model.addAttribute("searchFilmInfo", searchFilmInfo);
			model.addAttribute("searchDirectorInfo", searchDirectorInfo);
			model.addAttribute("searchActorInfo", searchActorInfo);	
			session.setAttribute("search_keyword", keyword);
		
			return "film/search_view";
			}
		}
	}
	
	
		
}