package com.project.myapp.movie.film;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//작성자 : 김대영
public interface IFilmRepository {
	/*
	 * 사용자 + 관리자 공통 기능
	 * - 영화 기본 정보 출력 : 선택한 영화의 시퀀스값을 받고, 해당 영화의 상세 정보를 출력
	 * 
	 * 
	 * 사용자 기능
	 * 메인 페이지
	 * - 영화 검색 : 제목으로 특정 영화 정보 객체를 반환해야함 - 기능 보류
	 * - 영화 목록 출력 : 평점 높은 순, 리뷰 많은 순 영화 목록 반환
	 * - 사용자 맞춤 영화 목록 출력 : 로그인시 맞춤영화 목록 반환
	 * 
	 * 영화 상세 페이지
	 * - 영화 기본 정보 출력 : 사용자 + 관리자 공통기능
	 * - 동일 영화 장르 추천 : 현재 선택된 영화의 시퀀스를 받고, 그 영화의 장르를 얻어와서 동일 장르 영화 목록을 출력
	 * 
	 * 
	 * 관리자 기능
	 * - 모든 영화 리스트 출력 : 영화 관리 페이지에서 모든 영화 리스트 확인해야함
	 * - 영화 정보 수정 : 관리자가 리스트에서 선택한 영화의 시퀀스값을 받고,특정 영화 상세정보 수정하는 역할
	 * - 영화 삭제 : 관리자가 리스트에서 선택한 영화의 시퀀스값을 받고,해당 영화 삭제
	 * - 영화 추가 : 요청받은 영화 DB에 insert
	 * 
	 */
	
	
	// -----------------<사용자 + 관리자>-----------------
	// 영화 상세 정보 출력
	FilmVO getFilmInfo(String filmId);
	
	// 별점 업데이트(불러오기)
	// 작성자 : 손일형
	void updateStarAvg(String filmId);
	
	// 리뷰카운트 업데이트
	// 작성자 : 손일형
	void updateRivewCount(String filmId);
	
	
	// -----------------<사용자>-----------------
	// 메인페이지
	// 영화 검색
	FilmVO filmSearch(String keyword);
	//영화 검색결과
	List<FilmVO> getFilmSearch(@Param("keyword") String keyword);
	//감독 검색결과
	List<FilmVO> getDrectorSearch(@Param("keyword") String keyword);
	//배역 검색결과
	List<FilmVO> getActorSearch(@Param("keyword") String keyword);
	
	// 영화 목록 출력
	// 리뷰순으로 
	List<FilmVO> getFilmListByReview();
	// 별점순으로
	List<FilmVO> getFilmListByStar();
	// 사용자 맞춤 장르
	List<FilmVO> getFilmListByGenre(String memberId);
	// 상세페이지 - 동일장르 출력
	List<FilmVO> getFilmListByGenreFilmInfo(@Param("filmId") String filmId);
	
	
	
	// -----------------<관리자>-----------------
	// 모든 영화 리스트 출력
	List<FilmVO> getFilmList();
	// 영화 정보 수정
	void updateFilm(FilmVO film);
	// 영화 삭제
	void deleteFilm(String filmId);
	// 영화 추가
	void insertFilm(FilmVO film);
	
}
