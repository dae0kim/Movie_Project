/**
 * 
 */

function loginCheck() {
				/* 아이디 입력상자 : 이름이 loginfrm인 폼 태그 내부에 존재 */
				if (loginfrm.email.value.length == 0) {
					alert("아이디를 입력하세요!")
		 			loginfrm.email.focus();
		 			return false;
		 		}
				
		 		if (loginfrm.password.value == "") {
		 			alert("비밀번호를 입력하세요!")
		 			loginfrm.password.focus();
		 			return false;
		 		}
		 		var pattern = /\s/g; // 공백체크 (탭, 스페이스)
		 		if (loginfrm.password.value.match(pattern)) {
		 			alert("비밀번호는 공백 없이 입력해주세요.");
		 			frm.password.focus();
		 			return false;
		 		}
		 		return true;
			}


 function loginCheck(){
	 if(document.frm.userid.value.length == 0){
		 alert("이메일을 입력하세요.");
		 frm.userid.focus();
		 return false;
	 }
	 if(document.frm.pwd.value == "") {
		 alert("비밀번호를 입력하세요.");
		 frm.pwd.focus();
		 return false;
	 }
	 return true;
 }