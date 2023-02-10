package com.project.myapp.movie.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.myapp.movie.basket.IBasketRepository;
import com.project.myapp.movie.filmrequest.IFilmRequestRepository;
import com.project.myapp.movie.review.IReviewRepository;
import com.project.myapp.movie.reviewlike.IReviewLikeRepository;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemberRepository")
	IMemberRepository memberRepository;

	@Autowired
	@Qualifier("IReviewLikeRepository")
	IReviewLikeRepository reviewLikeRepository;
	
	@Autowired
	@Qualifier("IReviewRepository")
	IReviewRepository reviewRepository;
	
	@Autowired
	@Qualifier("IFilmRequestRepository")
	IFilmRequestRepository filmRequestRepository;
	
	@Autowired
	@Qualifier("IBasketRepository")
	IBasketRepository basketRepository;
	
	@Override
	public List<MemberVO> getMemberList() {
		return memberRepository.getMemberList();
	}
	
	// 작성자: 이기쁨
	@Override
	public MemberVO loginCheck(String email, String password) {		
		// 로그인
		// 로그인 시도		
		return memberRepository.loginCheck(email, password);
	}

	// 작성자: 이기쁨
	@Override
	public String emailSearch(String phoneNumber, String birthDate) {
		//이메일 찾기
		return memberRepository.emailSearch(phoneNumber, birthDate);
	}
	
	// 작성자: 이기쁨
	//회원가입 시 중복확인
	@Override
	public int overlapChk(MemberVO memberVO) {	
		return memberRepository.overlapChk(memberVO);
	}
	
	// 작성자: 이기쁨
	//회원가입
	@Override
	public void insertMember(MemberVO member) {
		memberRepository.insertMember(member);
	}

	// 작성자: 이기쁨	
	@Override
	public int updateMember(MemberVO memberVO) {
		//로그인 시 비밀번호 변경		
		//회원정보 수정 시 비밀번호/휴대폰번호 변경
		return memberRepository.updateMember(memberVO);
	}
	
	// 작성자: 이기쁨
	//회원 정보 확인하기
	@Override
	public MemberVO getMemberInfo(MemberVO membervO) {
		return memberRepository.getMemberInfo(membervO);
	}
	
	// 작성자: 이기쁨
	//회원 탈퇴
	@Override
	@Transactional
	public int deleteMember(String memberId) {
		reviewLikeRepository.deleteMyReviewLike(memberId);
		reviewLikeRepository.deleteReviewLike(memberId);
		reviewRepository.deleteReview(memberId);
		filmRequestRepository.deleteRequest(memberId);
		basketRepository.deleteBasket2(memberId);
		
		return memberRepository.deleteMember(memberId);	
	}
	
}
