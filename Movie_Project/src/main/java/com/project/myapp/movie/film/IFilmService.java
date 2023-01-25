package com.project.myapp.movie.film;

import java.util.List;

public interface IFilmService {
	// 사용자 + 관리자
	// 영화 상세 정보 출력
	FilmVO getFilmInfo(int filmId);
	
	
	// 사용자
	// 메인페이지
	// 1. 영화 검색 - 구체적인 기능 보류
	FilmVO filmSearch(String keyword);
	
	// 2. 영화 목록 출력
	// 리뷰순으로 
	List<FilmVO> getFilmListByReview();
	// 별점순으로
	List<FilmVO> getFilmListByStar();
	// 사용자 맞춤 장르 - 조금 더 생각해보기
	List<FilmVO> getFilmListByGenre(String genre);
	// 상세페이지
	List<FilmVO> getFilmListByGenre(int filmId);
	
	
	
	// 관리자
	// 1. 모든 영화 리스트 출력
	List<FilmVO> getFilmList();
	// 2. 영화 정보 수정
	void updateFilm(FilmVO film);
	// 3. 영화 비노출 처리
	void blindFilm(int filmId);
	// 4. 요청 영화 추가
	void insertFilm(FilmVO film);
}
