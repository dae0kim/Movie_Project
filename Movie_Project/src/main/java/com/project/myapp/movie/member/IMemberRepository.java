package com.project.myapp.movie.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/* 
 * repository = dao -> DB와 접근하는 모든 코드(메서드)
 * member테이블에 대한 repository이므로 
 * member테이블에 접근하여 동작하는 메서드를 정의해야한다
*/
public interface IMemberRepository {
	/* 
	 * 사용자 기능
	 * 1.로그인
	 * - 로그인 시도 : email,pw를 DB정보와 비교하여 확인, 해당 사용자가 존재한다면 그 사용자의 객체 반환
	 * - 아이디 찾기 : 폰번호, 생년월일 입력받아서 일치하는거 있으면 email반환
	 * - 비밀번호 찾기 : email,생년월일,폰번호 입력받아서 일치하는 유저가 있다면 비밀번호 변경 화면으로 이동  
	 * 
	 * 2. 회원가입
	 * - 회원가입 시도 : 올바른 정보 입력 후 '가입'버튼을 누를 때 동작하는 메서드, 입력받은 회원정보 객체를 DB로 insert
	 * 
	 * 3. 마이페이지
	 * - 회원정보 수정 : 수정한 폰번호,이메일 정보를 현재 접속중인 사용자의 정보로 update
	 * 
	 * 관리자 기능
	 * 1. 회원정보 확인
	 * - 회원정보 리스트 출력 : member의 시퀀스 번호를 받아서 해당 사용자의 정보객체를 반환하는 메서드
	 * 
	 * 2. 회원정보 상세 조회
	 * - 회원정보 리스트 화면에서 특정 사용자를 클릭하면 해당 사용자의 상세 정보 페이지로 이동
	 * - 특정 회원정보 출력 : member시퀀스 번호와 일치하는 사용자 정보 객체를 반환
	 * 
	 */
	
	// 관리자
	// 1. 회원정보 리스트 출력
	List<MemberVO> getMemberList();
	
	
	// 2. 회원정보 상세 조회
	MemberVO getMemberInfo(int memberId); 
	
	// 사용자
	// 로그인
	// 1. 로그인 시도
	MemberVO loginCheck(@Param("email") String email, @Param("password") String password);
	// 2. 아이디 찾기
	String emailSearch(@Param("phoneNumber") String phoneNumber, @Param("birthDate") String birthDate);
	// 3. 비밀번호 찾기
	String passwordSearch(@Param("email") String email, @Param("birthDate") String birthDate, @Param("phoneNumber") String phoneNumber);
	
	// 회원가입
	// 1. 회원가입 시도 
	void insertMember(MemberVO member); 
	
	// 마이페이지
	// 1. 회원정보 수정 
	void updateMember(MemberVO member);
	
	
}

