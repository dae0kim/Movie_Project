package com.project.myapp.movie.filmrequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class FilmRequestService implements IFilmRequestService {

	@Autowired
	@Qualifier("IFilmRequestRepository")
	IFilmRequestRepository filmRequestRepository;
	
	// -----------------<사용자>-----------------
	// 영화 추가 요청 정보를 테이블에 삽입
	// 작성자 : 김대영
	@Override
	public void insertFilmRequest(FilmRequestVO filmRequest) {
		filmRequestRepository.insertFilmRequest(filmRequest);
	}

	// -----------------<관리자>-----------------
	// 영화 추가 요청 리스트 출력
	// 작성자 : 김대영
	@Override
	public List<FilmRequestVO> getFilmRequestList() {
		return filmRequestRepository.getFilmRequestList();
	}

	// 영화 추가 요청 상세 정보 조회
	// 작성자 : 김대영
	@Override
	public FilmRequestVO getFilmRequestInfo(String filmRequestId) {
		return filmRequestRepository.getFilmRequestInfo(filmRequestId);
	}

	// 영화 추가요청 상태 변경
	@Override
	public void updateFilmRequestStatus(String filmRequestId) {
		filmRequestRepository.updateFilmRequestStatus(filmRequestId);
	}

}
