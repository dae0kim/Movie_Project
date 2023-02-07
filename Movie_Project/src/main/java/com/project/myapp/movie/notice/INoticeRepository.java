package com.project.myapp.movie.notice;

import java.util.List;

public interface INoticeRepository {
	/*
	 * <사용자 + 관리자>
	 * - 공지사항 리스트 출력
	 * - 공지사항 상세정보 출력
	 * 
	 * <사용자>
	 * 1. 공지사항 페이지로 이동
	 *  - 메인에서 공지사항 버튼 누르면 작성된 공지글 리스트 출력
	 *  
	 * 2. 공지사항 읽기
	 *  - 게시글 클릭하면 해당 공지사항의 세부정보 확인가능
	 *  
	 * <관리자>
	 * 1. 공지사항 리스트 출력
	 *  - 공지사항 리스트형식으로 출력
	 *  
	 * 2. 공지사항 상세 정보
	 *  
	 * 3. 공지사항 입력
	 *  - 입력폼에서 제목, 내용 입력후 공지사항 등록 버튼 누를경우 DB의 Notice테이블에 INSERT
	 *
	 * 4. 공지사항 수정
	 * - 공지사항 상세 페이지에서 글 수정하면 해당 데이터 update
	 * 
	 * 5. 공지사항 삭제
	 * - 공지사항 상세 페이지에서 글 삭제버튼 동작하면 해당 글의 등록상태를 n으로 변경
	 * 
	 * */
	
	// -----------------<사용자 + 관리자>-----------------
	// 공지사항 리스트 출력
	List<NoticeVO> getNoticeList();
	// 공지사항 상세 정보 출력
	NoticeVO getNoticeInfo(String noticeId);
	
	
	// -----------------<관리자>-----------------
	// 공지사항 작성
	void insertNotice(NoticeVO notice);
	// 공지사항 수정
	void updateNotice(NoticeVO notice);
	// 공지사항 삭제
	void deleteNotice(String noticeId);
	
}
