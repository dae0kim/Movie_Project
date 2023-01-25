package com.project.myapp.movie.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemberRepository")
	IMemberRepository memberRepository;
	
	@Override
	public List<MemberVO> getMemberList() {
		return memberRepository.getMemberList();
	}

	@Override
	public MemberVO getMemberInfo(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO loginCheck(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String emailSearch(String phoneNumber, String birthDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String passwordSearch(String email, String birthDate, String phoneNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(MemberVO member) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(MemberVO member) {
		// TODO Auto-generated method stub

	}

}
