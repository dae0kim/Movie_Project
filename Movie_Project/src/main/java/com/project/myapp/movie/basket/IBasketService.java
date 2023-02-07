package com.project.myapp.movie.basket;

import java.util.List;

import com.project.myapp.movie.film.FilmVO;

public interface IBasketService {
	// 바구니에 담기
	void insertBasket(BasketVO basket);
	
	// 바구니에서 영화 삭제
	void deleteBasket(String memberId, String basketId );
	
	// 사용자의 바구니 리스트 출력

	List<FilmVO> getBasketList(String memberId);
	
	// 바구니 담을 때  이미 들어있는지 체크
	List<FilmVO> getBasketList_chk(String memberId, String filmId);
}
