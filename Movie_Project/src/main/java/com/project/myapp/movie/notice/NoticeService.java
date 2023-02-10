package com.project.myapp.movie.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements INoticeService {
	
	@Autowired
	@Qualifier("INoticeRepository")
	INoticeRepository noticeRepository;
	
	// -----------------<사용자 + 관리자>-----------------
	@Override
	public List<NoticeVO> getNoticeList() {
		return noticeRepository.getNoticeList();
	}

	@Override
	public NoticeVO getNoticeInfo(String noticeId) {
		return noticeRepository.getNoticeInfo(noticeId);
	}

	// -----------------<관리자>-----------------
	@Override
	public void insertNotice(NoticeVO notice) {
		noticeRepository.insertNotice(notice);
	}

	@Override
	public void updateNotice(NoticeVO notice) {
		noticeRepository.updateNotice(notice);
	}

	@Override
	public void deleteNotice(String noticeId) {
		noticeRepository.deleteNotice(noticeId);
	}

}// end class
