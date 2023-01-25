package com.project.myapp.movie.member;

import java.util.List;

public interface IMemberService {
	
	// 관리자
	// 1. 회원정보 리스트 출력
	List<MemberVO> getMemberList();
	
	
	// 2. 회원정보 상세 조회
	MemberVO getMemberInfo(int memberId); 
	
	// 로그인
	// 1. 로그인 시도
	MemberVO loginCheck(String email, String password);
	// 2. 아이디 찾기
	String emailSearch(String phoneNumber, String birthDate);
	// 3. 비밀번호 찾기
	String passwordSearch(String email, String birthDate, String phoneNumber);

	// 회원가입
	// 1. 회원가입 시도 
	void insertMember(MemberVO member); 

	// 마이페이지
	// 1. 회원정보 수정 
	void updateMember(MemberVO member);
}
