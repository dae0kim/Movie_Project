package com.project.myapp.movie.basket;

import java.util.List;

public interface IBasketService {
	// 바구니에 담기
	void insertBasket(BasketVO basket);
	
	// 바구니에서 영화 삭제
	void deleteBasket(String basketId);
	
	// 사용자의 바구니 리스트 출력
	List<BasketVO> getBasketList();
}
