package com.project.myapp.movie.film;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IFilmService {
	
	// -----------------<사용자 + 관리자>-----------------
	// 영화 상세 정보 출력
	FilmVO getFilmInfo(String filmId);
	
	
	// -----------------<사용자>-----------------
	// 메인페이지
	// 1. 영화 검색
	FilmVO filmSearch(String keyword);
	//영화 검색결과
	List<FilmVO> getFilmSearch(String keyword);
	//감독 검색결과
	List<FilmVO> getDrectorSearch(String keyword);
	//배역 검색결과
	List<FilmVO> getActorSearch(String keyword);
	
	// 별점 업데이트(불러오기)
	// 작성자 : 손일형
	void updateStarAvg(String filmId);
	
	// 리뷰카운트 업데이트
	// 작성자 : 손일형
	void updateRivewCount(String filmId);
	
	// 2. 영화 목록 출력
	// 리뷰순으로 
	List<FilmVO> getFilmListByReview();
	// 별점순으로
	List<FilmVO> getFilmListByStar();
	// 사용자 맞춤 장르 - 2/1수정됨
	List<FilmVO> getFilmListByGenre(String memberId);
	// 상세페이지
	List<FilmVO> getFilmListByGenreFilmInfo(@Param("filmId") String filmId);
	
	
	
	// -----------------<관리자>-----------------
	// 1. 모든 영화 리스트 출력
	List<FilmVO> getFilmList();
	// 2. 영화 정보 수정
	void updateFilm(FilmVO film);
	// 3. 영화 삭제
	void deleteFilm(String filmId);
	// 4. 요청 영화 추가
	void insertFilm(FilmVO film);
}
