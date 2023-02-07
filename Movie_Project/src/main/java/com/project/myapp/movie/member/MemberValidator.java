package com.project.myapp.movie.member;


//작성자 : 이기쁨
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVO = (MemberVO)target;
					
		String emailPattern = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";
		String email = memberVO.getEmail();
		if(!Pattern.matches(emailPattern, email)) {
			errors.rejectValue("email", "Pattern.memberVO.email", "올바른 이메일 형식이 아닙니다.");
		}

	}//end validate()

}//end class
