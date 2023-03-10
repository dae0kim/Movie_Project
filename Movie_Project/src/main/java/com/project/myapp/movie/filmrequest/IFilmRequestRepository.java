package com.project.myapp.movie.filmrequest;

import java.util.List;

//작성자 : 김대영
public interface IFilmRequestRepository {
	/*
	 * <사용자>
	 * 영화 추가 요청 페이지
	 * - 영화 추가 요청 : 영화 제목을 입력하여 관리자에게 영화 추가 요청 정보를 전송 -> filmrequest 테이블에 데이터가 들어가는 것
	 * 
	 * <관리자>
	 * 영화 추가 요청 리스트 페이지
	 * - 영화 추가 요청 리스트 출력 : 모든 사용자들이 보낸 영화 추가 요청을 리스트로 화면에 출력
	 * 
	 * 영화 추가 요청 상세 페이지
	 * - 추가요청 상세정보 조회 : 리스트에서 특정 요청을 클릭하면 해당 요청의 시퀀스값을 받아오고, 상세 정보를 화면에 출력
	 * 
	 * 영화 추가 페이지
	 * - 영화 등록 : IFilmRepository에서 구현완료
	 * 
	 * 
	 * */
	
	// -----------------<사용자>-----------------
	// 영화 추가 요청
	void insertFilmRequest(FilmRequestVO filmRequest);
	
	// -----------------<관리자>-----------------
	// 영화 추가 요청 리스트 출력
	List<FilmRequestVO> getFilmRequestList();
	// 영화 추가 요청 상세 정보 조회
	FilmRequestVO getFilmRequestInfo(String filmRequestId);
	// 요청 상태 변경
	void updateFilmRequestStatus(String filmRequestId);
	
	//작성자: 이기쁨
	//영화요청 삭제
	int deleteRequest(String memberId);
}
