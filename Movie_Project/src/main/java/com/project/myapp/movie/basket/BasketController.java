package com.project.myapp.movie.basket;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.movie.film.FilmVO;
import com.project.myapp.movie.film.IFilmService;

// 작성자 : 김미리 
// 위시리스트 추가, 조회, 삭제

@Controller
public class BasketController {
	
	@Autowired
	IBasketService basketService;
	
	@Autowired
	IFilmService filmService;
		
	// 위시리스트 담기 후 db 전송
	@RequestMapping(value = "/film/{filmId}/{memberId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> insertBasket(@RequestParam("filmId") String filmId, 
										   @RequestParam("memberId") String memberId, 
										   BasketVO basket, Model model, Locale locale, HttpSession session, HttpServletRequest request) {
		
		List<FilmVO> BasketList = basketService.getBasketList_chk(memberId, filmId);
		Map<String,String> resultMap = new HashMap<>();	
		if (BasketList.isEmpty()) {
			//위시리스트 db에 추가
			basketService.insertBasket(basket);
			resultMap.put("message","보관함에 담겼습니다.");
			}
		else {
			resultMap.put("message","이미 추가한 리스트입니다.");
			}
		return resultMap;
	}
	
		
	// 위시리스트 삭제
	@RequestMapping(value = "/member/mypage/{memberId}/{basketId}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> deleteBasket(@RequestParam("memberId") String memberId, @RequestParam("basketId") String basketId, Locale locale, HttpSession session, Model model ) {
		
		basketService.deleteBasket(memberId, basketId);
		
		Map<String,String> resultMap = new HashMap<>();
		resultMap.put("message","보관함에서 삭제되었습니다.");
		
		return resultMap; 
	}

}
