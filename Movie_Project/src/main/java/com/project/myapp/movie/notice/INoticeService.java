package com.project.myapp.movie.notice;

import java.util.List;

public interface INoticeService {
	
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
