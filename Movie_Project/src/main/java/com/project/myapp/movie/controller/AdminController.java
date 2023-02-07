package com.project.myapp.movie.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.movie.film.FilmVO;
import com.project.myapp.movie.film.IFilmService;
import com.project.myapp.movie.filmrequest.FilmRequestVO;
import com.project.myapp.movie.filmrequest.IFilmRequestService;
import com.project.myapp.movie.member.IMemberService;
import com.project.myapp.movie.member.MemberVO;
import com.project.myapp.movie.notice.INoticeService;
import com.project.myapp.movie.notice.NoticeVO;
import com.project.myapp.movie.review.IReviewService;
import com.project.myapp.movie.review.ReviewVO;
import com.project.myapp.movie.uploadfile.IUploadFileService;
import com.project.myapp.movie.uploadfile.UploadFileVO;


// 관리자 기능에 동작하는 모든 메서드
@Controller
public class AdminController {

	@Autowired
	IMemberService memberService;

	@Autowired
	INoticeService noticeService;

	@Autowired
	IReviewService reviewService;

	@Autowired
	IFilmService filmService;

	@Autowired
	IFilmRequestService filmRequestService;
	
	@Autowired
	IUploadFileService uploadFileService;

	// -----------------회원정보-----------------	
	// 작성자 : 박주영
	@RequestMapping(value = "/member/list")
	public String getAllMembers(Model model) {
		List<MemberVO> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "member/list";
	}

	// -----------------공지사항-----------------	
	// <관리자> 공지사항 전체 조회 - 공지사항 정보를 목록으로 조회하는 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/noticelist")
	public String getAllNotice(Model model) {
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "notice/noticelist";
	}

	// <관리자> 공지사항 상세 정보를 조회하는 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/{noticeId}")
	public String getNoticeInfo(@PathVariable String noticeId, Model model) {
		NoticeVO notice = noticeService.getNoticeInfo(noticeId);
		model.addAttribute("notice", notice);
		return "notice/noticeinfo";
	}

	// <관리자> 공지사항 입력을 처리하는 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/insert", method = RequestMethod.GET)
	public String insertNotice(Model model) {
		return "notice/noticeinsert";
	}
	
	// <관리자> 공지사항 등록
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST)
	public String insertNotice(NoticeVO notice, RedirectAttributes redirectAttributes) {
		try {
			noticeService.insertNotice(notice);
			redirectAttributes.addFlashAttribute("message", notice.getNoticeId() + "번 공지사항이 입력되었습니다.");
		} catch (RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/notice/noticelist"; // 정보 저장 후 공지사항 목록으로 이동
	}

	// <관리자> 공지사항을 수정하기 위한 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)
	public String updateNotice(String noticeId, Model model) {
		model.addAttribute("notice", noticeService.getNoticeInfo(noticeId));
		return "notice/noticeupdate";
	}
	
	// <관리자> 공지사항 수정
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String updateNotice(NoticeVO notice, RedirectAttributes redirectAttributes) {
		try {
			noticeService.updateNotice(notice);
			redirectAttributes.addFlashAttribute("message", notice.getNoticeId() + "번 공지사항이 수정되었습니다.");
		} catch (RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/notice/" + notice.getNoticeId(); // 정보를 저장한 후 공지글 상세 정보 화면으로 이동
	}

	// <관리자> 공지사항을 삭제하기 위한 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public String deleteNotice(String noticeId, Model model) {
		model.addAttribute("notice", noticeService.getNoticeInfo(noticeId));
		System.out.println(noticeId + "-------------------------");
		return "notice/noticedelete";
	}
	
	// <관리자> 공지사항 삭제
	// 작성자 : 박주영
	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String deleteNotice(String noticeId, RedirectAttributes redirectAttributes) {
		try {
			noticeService.deleteNotice(noticeId);
			redirectAttributes.addFlashAttribute("message", noticeId + "번 공지사항이 삭제되었습니다.");
		} catch (RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/notice/noticelist";
	}

	// -----------------리뷰-----------------	
	// <관리자> 리뷰 전체 조회 - 리뷰 정보를 목록으로 조회하는 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/adminreview/reviewlist")
	public String getReviewList(Model model) {
		List<ReviewVO> reviewList = reviewService.getReviewList();
		model.addAttribute("reviewList", reviewList);
		return "adminreview/reviewlist";
	}

	// <관리자> 리뷰 상세 정보를 조회하는 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/adminreview/{reviewId}")
	public String getReviewInfo(@PathVariable String reviewId, Model model) {
		ReviewVO review = reviewService.getReviewInfo(reviewId);
		model.addAttribute("review", review);
		return "adminreview/reviewinfo";
	}
	
	// <관리자> 특정 리뷰를 숨김 상태로 변경하기 위한 컨트롤러 메서드
	// 작성자 : 박주영
	@RequestMapping(value = "/adminreview/blind", method = RequestMethod.GET)
	public String blindReview(String reviewId, Model model) {
		model.addAttribute("review", reviewService.getReviewInfo(reviewId));
		return "adminreview/reviewblind";
	}
	
	// <관리자> 특정 리뷰 숨김 
	// 작성자 : 박주영
	@RequestMapping(value = "/adminreview/blind", method = RequestMethod.POST)
	public String blindReview(String reviewId, RedirectAttributes redirectAttributes) {
		try {
			reviewService.blindReview(reviewId);
			redirectAttributes.addFlashAttribute("message", reviewId + "번 공지사항이 숨김 처리되었습니다.");
		} catch (RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/adminreview/reviewlist";
	}

	// -----------------영화-----------------
	// <관리자> 영화목록을 리스트 출력
	// 작성자 : 김대영
	@RequestMapping(value = "/adminfilm/filmlist")
	public String getFilmList(Model model) {
		List<FilmVO> filmList = filmService.getFilmList();
		model.addAttribute("filmList", filmList);
		return "adminfilm/adminfilmlist";
	}

	// <관리자> 영화 상세정보 출력
	// 작성자 : 김대영
	@RequestMapping(value="/adminfilm/{filmId}") 
	public String getFilmInfo(@PathVariable String filmId, Model model) { 
		FilmVO film = filmService.getFilmInfo(filmId); 
		model.addAttribute("film",film); 
		return "adminfilm/adminfilminfo"; 
	}
	
	// <관리자> 영화 상세정보 수정 페이지 이동
	// 작성자 : 김대영
	@RequestMapping(value = "/adminfilm/update", method = RequestMethod.GET)
	public String updateFilm(String filmId, Model model) {
		model.addAttribute("film", filmService.getFilmInfo(filmId));
		return "adminfilm/filmupdate";
	}
	
	// <관리자> 영화 상세정보 수정
	// 작성자 : 김대영
	@RequestMapping(value="/adminfilm/update", method = RequestMethod.POST)
	public String updateFilm(@RequestParam(value="dir", required=false, defaultValue="/") String dir, 
	@RequestParam MultipartFile file,FilmVO film, RedirectAttributes redirectAttributes) throws IOException {
		try {
			filmService.updateFilm(film);
			if(file!=null && !file.isEmpty()) {
				UploadFileVO newFile = new UploadFileVO();
				newFile.setDirectoryName(dir);
				newFile.setFileName(file.getOriginalFilename());
				newFile.setFileSize(file.getSize());
				newFile.setFileContentType(file.getContentType());
				newFile.setFileData(file.getBytes());
				newFile.setFilmId(film.getFilmId());
				uploadFileService.updateFile(newFile);
			}
			redirectAttributes.addFlashAttribute("message", 
					"[" + film.getFilmTitle()+"] 영화정보가 수정되었습니다.");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/adminfilm/filmlist";
	}

	// <관리자> 영화 삭제 페이지 이동
	// 작성자 : 김대영
	@RequestMapping(value = "/adminfilm/delete", method = RequestMethod.GET)
	public String deleteFilm(String filmId, Model model) {
		model.addAttribute("film", filmService.getFilmInfo(filmId));
		return "adminfilm/filmdelete";
	}
	
	// <관리자> 영화 삭제
	// 작성자 : 김대영
	@RequestMapping(value = "/adminfilm/delete", method = RequestMethod.POST)
	public String deleteFilm(String filmId, RedirectAttributes redirectAttributes) {
		try {
			FilmVO film = filmService.getFilmInfo(filmId);
			uploadFileService.deleteFile(filmId);
			filmService.deleteFilm(filmId);
			redirectAttributes.addFlashAttribute("message", "[" + film.getFilmTitle() + "]영화가 삭제되었습니다.");
		} catch (RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/adminfilm/filmlist";
	}

	// -----------------요청 영화-----------------
	// <관리자> 요청 영화목록을 리스트 출력
	// 작성자 : 김대영
	@RequestMapping(value = "/filmrequest/filmrequestlist")
	public String getFilmRequestList(Model model) {
		List<FilmRequestVO> filmRequestList = filmRequestService.getFilmRequestList();
		model.addAttribute("filmRequestList", filmRequestList);
		return "filmrequest/filmrequestlist";
	}

	
	// <관리자> 요청 영화 상세정보 출력
	// 작성자 : 김대영
	@RequestMapping(value="/filmrequest/{filmRequestId}") 
	public String getFilmRequestInfo(@PathVariable String filmRequestId, Model model) { 
		FilmRequestVO filmRequest = filmRequestService.getFilmRequestInfo(filmRequestId); 
		model.addAttribute("filmRequest",filmRequest); 
		return "filmrequest/filmrequestinfo"; 
	}

	// <관리자> 요청 상태 변경
	// 작성자 : 김대영
	@RequestMapping(value="/filmrequest/requestcheck/{filmRequestId}") 
	public String updateFilmRequestStatus(@PathVariable String filmRequestId, Model model) { 
		filmRequestService.updateFilmRequestStatus(filmRequestId); 
		List<FilmRequestVO> filmRequestList = filmRequestService.getFilmRequestList();
		model.addAttribute("filmRequestList", filmRequestList);
		return "filmrequest/filmrequestlist"; 
	}
	
	// -----------------영화 추가-----------------
	// <관리자> - 영화 추가 페이지로 이동
	// 작성자 : 김대영
	@RequestMapping(value="/filmrequest/filminsertform", method=RequestMethod.GET)
	public String insertFilm(Model model) {
		return "/filmrequest/filminsertform";
	}
	
	// <관리자> - 영화 추가 기능 동작 (영화 기본정보 + 포스터 파일 동시에)
	// 작성자 : 김대영
	@RequestMapping(value="/filmrequest/filminsertform", method=RequestMethod.POST)
	public String insertFilm(@RequestParam(value="dir", required=false, defaultValue="/") String dir, 
	@RequestParam MultipartFile file,FilmVO film, RedirectAttributes redirectAttributes) throws IOException {
		try {
			filmService.insertFilm(film);
			if(file!=null && !file.isEmpty()) {
				UploadFileVO newFile = new UploadFileVO();
				newFile.setDirectoryName(dir);
				newFile.setFileName(file.getOriginalFilename());
				newFile.setFileSize(file.getSize());
				newFile.setFileContentType(file.getContentType());
				newFile.setFileData(file.getBytes());
				uploadFileService.uploadFile(newFile);
			}
			redirectAttributes.addFlashAttribute("message", 
					"[" + film.getFilmTitle()+"] 영화가 등록되었습니다.");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/adminfilm/filmlist";
	}
	
	// 포스터 이미지 모든 정보(=upload_file table)
	// 작성자 : 김대영
	@RequestMapping("/filmrequest/posterlist")
	public String getImageList(@RequestParam(value="dir", required=false, defaultValue="/images")String dir, Model model) {
		model.addAttribute("fileList", uploadFileService.getImageList(dir));
		return "/filmrequest/posterlist";
	}
	
	// <공용> DB에 넣은 실제 이미지 파일 로딩 
	// 작성자 : 김대영
	@RequestMapping("/file/{fileId}")
	public ResponseEntity<byte[]> getBinaryFile(@PathVariable String fileId) {
		UploadFileVO file = uploadFileService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders();
		if(file != null) {
			String[] mtypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentLength(file.getFileSize());
			headers.setContentDispositionFormData("attachment", file.getFileName(), Charset.forName("UTF-8"));
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		}else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}
	 
}
