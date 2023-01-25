package com.project.myapp.movie.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {
	
	@Autowired
	IMemberService memberService;
	
	@RequestMapping(value="/member/list")
	public String getAllMembers(Model model) {
		List<MemberVO> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "member/list";
	}
}
