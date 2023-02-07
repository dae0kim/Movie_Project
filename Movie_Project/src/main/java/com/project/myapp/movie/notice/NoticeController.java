package com.project.myapp.movie.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@Autowired
	INoticeService noticeService;
	
	// -----------------<사용자>-----------------
	// <사용자> 공지사항 전체 조회
	// 작성자 : 박주영
	@RequestMapping(value="/notice/mainnoticelist")
	public String getAllNoticeByUser(Model model) {
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "notice/mainnoticelist";
	}
	
	// <사용자> 공지사항 상세 정보를 조회하는 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value="/mainnotice/{noticeId}") 
	public String getNoticeInfoByUser(@PathVariable String noticeId, Model model) {
		NoticeVO notice = noticeService.getNoticeInfo(noticeId);
		model.addAttribute("notice", notice);
		return "notice/mainnoticeinfo";
	}

}// end class
