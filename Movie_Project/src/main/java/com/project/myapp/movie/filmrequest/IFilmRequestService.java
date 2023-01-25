package com.project.myapp.movie.filmrequest;

import java.util.List;

public interface IFilmRequestService {
	// 사용자
	// 영화 추가 요청
	void insertFilmRequest(FilmRequestVO filmRequest);
	
	// 관리자
	// 영화 추가 요청 리스트 출력
	List<FilmRequestVO> getFilmRequestList();
	// 영화 추가 요청 상세 정보 조회
	FilmRequestVO getFilmRequestInfo(int filmRequestId);
}
