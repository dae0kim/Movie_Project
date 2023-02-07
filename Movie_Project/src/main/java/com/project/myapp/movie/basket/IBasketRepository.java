package com.project.myapp.movie.basket;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.movie.film.FilmVO;

public interface IBasketRepository {
	/*
	 * 사용자 기능만 존재
	 * 
	 * 1. 바구니에 영화 추가
	 * - 사용자가 '보고싶어요' 누르면 해당테이블에 정보 INSERT
	 * 
	 * 2. 바구니 리스트 보기
	 * - 마이페이지에서 바구니 리스트 출력
	 * 
	 * 3. 바구니에서 영화 삭제
	 *  - 선택한 바구니의 영화에 대한 시퀀스 id값을 받아오고, 삭제버튼 누르면 DB에서 DELETE됨
	 * 
	 * */
	
	// 바구니에 담기
	void insertBasket(BasketVO basket);
		
	// 바구니에서 영화 삭제
	void deleteBasket(@Param("memberId") String memberId, @Param("basketId") String basketId );
	
	// 사용자의 바구니 리스트 전체 출력
	List<FilmVO> getBasketList(@Param("memberId") String memberId);
	
	// 바구니 담을 때  이미 들어있는지 체크
	List<FilmVO> getBasketList_chk(@Param("memberId") String memberId, @Param("filmId") String filmId);

	//작성자: 이기쁨
	//장바구니 삭제
	int deleteBasket2(String memberId);
}
