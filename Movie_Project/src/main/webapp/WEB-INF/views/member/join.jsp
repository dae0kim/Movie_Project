<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="join_modal" class="modal">
		    <!-- <div class="modal_close"><a href="#">close</a></div> -->
		    <div>	        
       			<div class="title1">
					<p class="title1_content">회원가입</p>
				</div>

				<form action="<c:url value='/member/join'/>" method="post" id="join_form" name="joinfrm"> 					
					<div>
						<div>
							<label> 이메일</label>
							<input type="email" name="email" id="email" size="30" maxlength="30" placeholder="이메일을 입력하세요" required >
							<label class="ChkLabel" id="emailMsg"></label>						
							<input id="email_reg_check" type="hidden" value="false">
							<input id="email_overlap_check" type="hidden" value="false">
						</div>										
						<div>
							<label >비밀번호</label>
							<input name="password" id="password"  type="password" size="15" oninput="passwordChk()" required>
						</div>						
						<div>
							<label >비밀번호 확인</label>
							<input name="pwchk" id="pwchk"  type="password" size="15" oninput="passwordChk()" required>
							<label class="ChkLabel" id="pwchkMsg"></label>							
							<input id="pwchk2" type="hidden" value="false">
						</div>									
						<div>
							<label>닉네임</label>
							<input type="text" id="nickname" name="nickname" size="20" placeholder="닉네임" required>						
							<label class="ChkLabel" id="nicknameMsg"></label>							
							<input id="nickname_overlap_check" type="hidden" value="false">
						</div>						
						<div>
							<label>생년월일</label>
							<input type="date" name="birthDate" size="20" placeholder="생년월일" required>
						</div>
						<div>
							<label>연락처</label>
							<input id="phoneNumber_join" name="phoneNumber" type="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="012-3456-7890" required/>
							<label class="ChkLabel" id="phoneNumber_msg"></label>	
							<input id="phoneNumber_overlap_check" type="hidden" value="false">	
							
							<span class="validity"></span>
						</div>
						<div>
							<label>성별</label>
							<label><input type="radio" name="gender" value="M" required> 남성</label>
							<label><input type="radio" name="gender" value="F"> 여성</label>
						</div>						
						<div>
							<label>선호 장르</label>
							<select name="favoriteGenre1" required>
								<option value="">선호 장르1</option>
								<option value="액션">액션</option>
								<option value="코메디">코메디</option>
								<option value="로맨스">로맨스</option>
								<option value="드라마">드라마</option>
								<option value="호러/스릴러">호러/스릴러</option>
								<option value="SF/판타지">SF/판타지</option>
								<option value="애니메이션">애니메이션</option>
								<option value="다큐멘터리">다큐멘터리</option>
							</select>
							<select name="favoriteGenre2" required>
								<option value="">선호 장르2</option>
								<option value="액션">액션</option>
								<option value="코메디">코메디</option>
								<option value="로맨스">로맨스</option>
								<option value="드라마">드라마</option>
								<option value="호러/스릴러">호러/스릴러</option>
								<option value="SF/판타지">SF/판타지</option>
								<option value="애니메이션">애니메이션</option>
								<option value="다큐멘터리">다큐멘터리</option>
							</select>
							<select name="favoriteGenre3" required>
								<option value="">선호 장르3</option>
								<option value="액션">액션</option>
								<option value="코메디">코메디</option>
								<option value="로맨스">로맨스</option>
								<option value="드라마">드라마</option>
								<option value="호러/스릴러">호러/스릴러</option>
								<option value="SF/판타지">SF/판타지</option>
								<option value="애니메이션">애니메이션</option>
								<option value="다큐멘터리">다큐멘터리</option>
							</select>
						</div>

						<div>			
						
							
							<input type="submit" value="가입하기"  onclick="join_btn_action()" >
							
							
							<a href="#close" rel="modal:close"><input type="reset" value="취소"></a>
													
						</div>						
					</div>							
				</form>	        
		    </div>
		</div>
		
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			
			function passwordChk(){
				if($('#pwchk').val() != '' ){
					if($('#password').val() == $('#pwchk').val()){
						$('#pwchkMsg').text("비밀번호가 일치합니다.").css("color", "green");
						$('#pwchk2').val("true");
					} else {
						//$('#pwchkMsg').focus();
						$('#pwchkMsg').text("비밀번호가 일치하지 않습니다.").css("color", "red");
						$('#pwchk2').val("false");
					}
				}
			}//end passwordChk
			
			//생년월일: 오늘 이전 날짜만 선택 가능
			var today = new Date().toISOString().split('T')[0];
			document.getElementsByName("birthDate")[0].setAttribute('max', today);
			
			//이메일 유효성 확인 ->중복검사 ajax
			$('#email').focusout(function(){			
				var reg_email = new RegExp('^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$');
				var email = $('#email').val();
 
 				if ($('#email').val() == ''){
 					$('#emailMsg').text("이메일을 입력해 주세요.").css("color", "red");
					//$('#email').focus();
 				} else if (!reg_email.test(email)){
 					$('#emailMsg').text("잘못된 이메일 형식입니다.").css("color", "red");
					//$('#email').focus();
 				} else if(reg_email.test(email)) {	//이메일 올바른 형식일 경우
 					$('#email_reg_check').val("true");
 					$('#emailMsg').text("굳 이메일 형식입니다.").css("color", "green");

					if ($('#email_reg_check').val() == 'true'){	
	 					var email = $('#email').val();
						console.log(email);
						$.ajax({
							url: "member/emailchk",		
							type: "post",
							data: {email: email},
							dataType: 'text',
							success: function(data){
								console.log(data);
								if(data == 'ok'){
									$('#emailMsg').text("사용 가능한 Email입니다.").css("color", "green");
									$('#email_overlap_check').val("true");
								} else {
									$('#emailMsg').text("이미 가입된 Email입니다.").css("color", "red");
									$('#email_overlap_check').val("false");
									//$('#email').focus();
								}
							}, //end success
							error:function(){
								alert("에러 발생");
							}//end error
						})//end ajax				
	 				}//end if											
 				}//end 이메일 중복검사				
			})//end function			
			</script>
			
			<script>				
 				//닉네임 중복체크
				$('#nickname').focusout(function(){
					var nickname = $('#nickname').val();
					console.log(nickname);
					$.ajax({
						url: "member/nicknamechk",		
						type: "post",
						data: {nickname: nickname},
						dataType: 'text',
						success: function(data){
							console.log(data);
							if(data == 'ok'){
								$('#nicknameMsg').text("사용 가능한 닉네임입니다.").css("color", "green");	// 사용 가능 알림메세지
								$('#nickname_overlap_check').val("true");
							} else {
								$('#nicknameMsg').text("중복된 닉네임입니다.").css("color", "red");	// 사용 가능 알림메세지
								$('#nickname_overlap_check').val("false");
								//$('#nickname').focus();
							}
						}, //end success
						error:function(){
							alert("에러 발생");
						}
					})//end ajax				
				})//end function				 
			</script>
			
			<script>				
 				//휴대폰번호 중복체크
				$('#phoneNumber_join').focusout(function(){
					var phoneNumber = $('#phoneNumber_join').val();
					console.log(phoneNumber);
					$.ajax({
						url: "member/phonechk",		
						type: "post",
						data: {phoneNumber: phoneNumber},
						dataType: 'text',
						success: function(data){
							console.log(data);
							if(data == 'ok'){
								$('#phoneNumber_msg').text("사용 가능한 번호입니다.").css("color", "green");	// 사용 가능 알림메세지
								$('#phoneNumber_overlap_check').val("true");
							} else {
								$('#phoneNumber_msg').text("이미 가입된 회원입니다.").css("color", "red");	
								$('#phoneNumber_overlap_check').val("false");
								//$('#phoneNumber_join').focus();
							}
						}, //end success
						error:function(){
							alert("이미 가입된 회원");
						}
					})//end ajax				
				})//end function				 
			</script>
			
			
			<%-- <form id ="insertForm" action = "<c:url value='/insert'/>" method="post"   onsubmit="return insertMember()" enctype="multipart/form-data" class="form-floating"> --%>
			
			
			<script>
			function join_btn_action(){
				  $('#join_form').off("submit").on("submit", function(){	// 현재의 submit 이벤트 핸들러를 제거하고 새로 생성하여 function 등록
				    var email_overlap_check = $('#email_overlap_check').val();  
				    var pwchk2 = $('#pwchk2').val();  
				 	var nickname_overlap_check = $('#nickname_overlap_check').val();         
				    var phoneNumber_overlap_check = $('#phoneNumber_overlap_check').val();
				    				    
				    if(email_overlap_check == 'false'){   
				    	alert("중복되지 않은 이메일을 입력해주세요.");
					    $('#email').focus(); 
				    	
				    	return false;	
					                				     				    
				    }else if(pwchk2 == 'false'){     
				    	alert("입력한 비밀번호를 다시 확인해주세요.");
				      	$('#pwchk').focus();  
				    	
				    	return false;	
				      	             		      	
				    }else if(nickname_overlap_check == 'false'){
				    	alert("중복되지 않은 닉네임을 선택해주세요.");
					    $('#nickname').focus();
				    	
				    	return false;
				    	
				    }else if(phoneNumber_overlap_check == 'false'){
				    	alert("이미 가입된 휴대폰 번호입니다.");
					    $('#phoneNumber_join').focus();	
				    	
				    	return false;	
				    		
				    }
				  });
				}			
			</script>
			
			
			
			
			
			
			