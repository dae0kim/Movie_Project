package com.project.myapp.movie.member;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.movie.film.FilmVO;
import com.project.myapp.movie.film.IFilmService;


@Controller
public class MemberController {
	
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IFilmService filmService;
	
	// <공용> 헤더의 로고 누를 때 메인으로 이동
	@RequestMapping(value="/index")
	public String logoAction(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		String action=null;
		List<FilmVO> filmListByStar = filmService.getFilmListByStar();
		List<FilmVO> filmListByReview = filmService.getFilmListByReview();
		
		model.addAttribute("filmListByStar", filmListByStar);
		model.addAttribute("filmListByReview", filmListByReview);

		if(memberVO != null) {
			List<FilmVO> filmListByGenre = filmService.getFilmListByGenre(memberVO.getMemberId());
			model.addAttribute("filmListByGenre", filmListByGenre);
			action = "index";			
		}else {
			action = "redirect:/";
		}
		return action;
	}
	
	// <공용> 메인페이지 첫 로딩 때 실행
	@RequestMapping(value="/")
	public String mainPage(Model model) {
		List<FilmVO> filmListByStar = filmService.getFilmListByStar();
		List<FilmVO> filmListByReview = filmService.getFilmListByReview();
		
		model.addAttribute("filmListByStar", filmListByStar);
		model.addAttribute("filmListByReview", filmListByReview);
		
		return "/index";
	}
	
	//작성자: 이기쁨
	//회원가입 폼으로 오기
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String join(Model model) {
		return "member/join";
	}//회원가입 폼으로 오기
	
	//작성자: 이기쁨
	//회원가입 email 중복 체크
	@RequestMapping(value="/member/emailchk")
	@ResponseBody
	public String emailChk(String email, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);			
		return (memberService.overlapChk(memberVO) == 0)? "ok":"fail";
	}
	
	//작성자: 이기쁨
	//회원가입 닉네임 중복 체크
	@RequestMapping(value="/member/nicknamechk")
	@ResponseBody
	public String nicknameChk(String nickname, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		MemberVO memberVO = new MemberVO();
		memberVO.setNickname(nickname);				
		return (memberService.overlapChk(memberVO) == 0)? "ok":"fail";
	}
	
	//작성자: 이기쁨
	//회원가입 휴대폰번호 중복 체크
	@RequestMapping(value="/member/phonechk")
	@ResponseBody
	public String phoneNumberChk(String phoneNumber, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가		
		MemberVO memberVO = new MemberVO();
		memberVO.setPhoneNumber(phoneNumber);		
		return (memberService.overlapChk(memberVO) == 0)? "ok":"fail";
	}
	
	//작성자: 이기쁨
	//회원가입 insertMember 메서드 실행
	@RequestMapping(value="/member/join")
	public String join(Model model, MemberVO memberVO, Locale locale) {

			memberService.insertMember(memberVO);
					
			return "redirect:/";		
	}//회원가입
	
	//작성자: 이기쁨
	//로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();		
		return "redirect:/";
	}//로그아웃
	
	//작성자: 이기쁨
	//로그인 실험
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(String member_email, String member_pw, HttpSession session, Model model, Locale locale) {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(member_email);
		memberVO.setPassword(member_pw);
		
		MemberVO memberVOResult = new MemberVO();
		memberVOResult = memberService.getMemberInfo(memberVO);		
		
		if(memberVOResult != null) {
			session.setAttribute("loginUser", memberVOResult);		
			String memberId = memberVOResult.getMemberId();
			session.setAttribute("memberId", memberId);
			
			if(memberVOResult.getMemberType().equals("user")) {
				List<FilmVO> filmListByGenre = filmService.getFilmListByGenre(memberVOResult.getMemberId());
				model.addAttribute("filmListByGenre", filmListByGenre);
				return "ok";								
			}
		} else {
			return "fail";
		}	
		return "fail";
	}//end login
	
	//작성자: 이기쁨
	//제이쿼리 모달창
	@RequestMapping(value="/member/login")
	public String login(Model model) {
		return "member/login";
	}
	
	//작성자: 이기쁨
	//이메일 찾기
	@RequestMapping(value="/member/findemail")
	@ResponseBody
	public String findemail(String birthDate, String phoneNumber, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가
		String matchEmail = memberService.emailSearch(birthDate, phoneNumber);
		return (matchEmail == null)? "fail" : matchEmail;
	}
	
	//작성자: 이기쁨
	//회원정보찾기(비밀번호 변경시)
	@RequestMapping(value="/member/changepwcheck")
	@ResponseBody
	public String changepwcheck(String email_changepw, String birthDate_changepw, String phoneNumber_changepw, Locale locale) {
		//0이면 사용 가능, 1이면 사용 불가
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email_changepw);
		memberVO.setBirthDate(birthDate_changepw);
		memberVO.setPhoneNumber(phoneNumber_changepw);
		
		MemberVO memberVOResult = new MemberVO();
		memberVOResult = memberService.getMemberInfo(memberVO);
		
		if(memberVOResult != null) {
			String matchEmail = memberVOResult.getEmail();
			return matchEmail;
		} else {			
			return "fail";
		}	
	}
	
	//작성자: 이기쁨
	//비밀번호 변경
	@RequestMapping(value="/member/changepw")
	@ResponseBody
	public String changepw(String matchEmail2, String password_change, Locale locale) {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(matchEmail2);
		memberVO.setPassword(password_change);
		
		int updateResult = memberService.updateMember(memberVO);
		
		return (updateResult != 0)? "ok": "fail";
	}
	
	//작성자: 이기쁨
	//회원정보 수정 페이지로 이동
	@RequestMapping(value="/member/updateMember", method=RequestMethod.GET)
	public String update(Model model) {
		return "./member/updateMember";
	}//회원가입 폼으로 오기
	
	//작성자: 이기쁨
	//회원정보 수정
	@RequestMapping(value="/member/update")
	@ResponseBody
	public String updateMember(String password_update, String phoneNumber_update, String favoriteGenre1_update, String favoriteGenre2_update, String favoriteGenre3_update, HttpSession session, Locale locale) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		memberVO.setPassword(password_update);
		memberVO.setPhoneNumber(phoneNumber_update);
		memberVO.setFavoriteGenre1(favoriteGenre1_update);
		memberVO.setFavoriteGenre2(favoriteGenre2_update);
		memberVO.setFavoriteGenre3(favoriteGenre3_update);
				
		int updateResult = memberService.updateMember(memberVO);
		
		return (updateResult != 0)? "ok": "fail";
	}
	
	//회원 탈퇴
	//작성자: 이기쁨
	@RequestMapping(value="/member/deleteMember")
	@ResponseBody
	public String deleteMember(HttpSession session, Locale locale) {
		
		String memberId = (String)session.getAttribute("memberId");
		
		int deleteResult = memberService.deleteMember(memberId);
		
		session.invalidate();
		
		return (deleteResult != 0)? "ok": "fail";
	}	
	
	
	
	//작성자: 이기쁨
	//관리자
	//관리자 로그인화면으로 이동
	@RequestMapping(value="/member/adminlogin", method=RequestMethod.GET)
	public String adminlogin(Model model, HttpSession session) {
		session.invalidate();
		return "member/adminlogin";
	}//관리자 로그인화면으로 이동
	
	//작성자: 이기쁨
	//관리자 로그인 실행
	@RequestMapping(value="/member/adminlogin", method=RequestMethod.POST)
	public String adminlogin(String email, String password, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = memberService.loginCheck(email, password);
		if(memberVO != null) {
			String dbPassword = memberVO.getPassword();
			if(dbPassword == null) {
				//아이디 없음
				System.out.println("등록되지 않은 이메일 입니다.");
				model.addAttribute("message", "등록되지 않은 이메일 입니다.");
			} else {
				//아이디 있음
				if(dbPassword.equals(password)) {
					//비밀번호 일치
					session.setAttribute("loginUser", memberVO);					
					session.setAttribute("memberType", memberVO.getMemberType());

					if(memberVO.getMemberType().equals("admin")) {
						return "redirect:/adminhome";						
					} else {
						return "redirect:/member/adminlogin";
					}					
				} else {
					//비밀번호 불일치
					model.addAttribute("message", "비밀번호를 확인해주세요.");
				}
			}
		} else {
			//비밀번호 불일치
			model.addAttribute("message", "USER_NOT_FOUND.");
		}
		session.invalidate();
		return "redirect:/member/adminlogin";
		}// 관리자 로그인 실행
	
	//작성자: 이기쁨
	//관리자 페이지로 이동
	@RequestMapping(value="/adminhome", method=RequestMethod.GET)
	public String toAdminhome(Model model) {
		return "adminhome";
	}//관리자 페이지로 이동
	
}
