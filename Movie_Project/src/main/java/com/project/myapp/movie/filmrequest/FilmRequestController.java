package com.project.myapp.movie.filmrequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FilmRequestController {
	
	@Autowired
	IFilmRequestService filmRequestService; 
	
	// -----------------<사용자>-----------------
	// <사용자> 영화 추가 요청 페이지로 이동
	// 작성자 : 김대영
	@RequestMapping(value="/filmrequest/request", method=RequestMethod.GET)
	public String insertFilmRequest(Model model) {
		return "/filmrequest/requestform";
	}
	
	// <사용자> 영화 추가 요청 
	// 작성자 : 김대영
	@RequestMapping(value="/filmrequest/request", method=RequestMethod.POST)
	public String insertFilmRequest(FilmRequestVO filmrequest, RedirectAttributes redirectAttributes) {
		try {
			filmRequestService.insertFilmRequest(filmrequest);
			redirectAttributes.addFlashAttribute("message", 
					filmrequest.getRequestTitle()+" 요청정보가 입력되었습니다.");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/index";
	}
}
