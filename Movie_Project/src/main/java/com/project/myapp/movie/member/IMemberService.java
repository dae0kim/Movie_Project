package com.project.myapp.movie.member;

import java.util.List;

//작성자 : 김대영
public interface IMemberService {
	
	// <로그인>
	// 로그인 시도
	MemberVO loginCheck(String email, String password);
	// 아이디 찾기
	String emailSearch(String birthDate, String phoneNumber);

	// 회원가입
	// 회원가입 시도 
	void insertMember(MemberVO member); 
	
	// 작성자 : 이기쁨
	// 회원가입 시 중복확인
	// 이메일 중복 체크
	// 닉네임 중복 체크
	// 핸드폰 번호 중복 체크
	int overlapChk(MemberVO memberVO);

	// 마이페이지
	// 회원정보 수정 
	// 작성자 : 이기쁨
	int updateMember(MemberVO membervO);
	MemberVO getMemberInfo(MemberVO membervO);
	
	// 작성자: 이기쁨
	// 회원 탈퇴
	int deleteMember(String memberId);

	// <관리자>
	// 회원정보 리스트 출력
	List<MemberVO> getMemberList();
	
}
