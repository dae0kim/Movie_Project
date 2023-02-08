<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="changepw" class="modal">  
    <div>
    		<form>
			<div class="title1">
				<p class="title1_content">비밀번호 변경</p>
			</div>
			<div id="changepwcheck_form" >
				<div class="phonenum_div">
					<label class="input_memeber_title">이메일</label>
					<input type="email" id="email_changepw" size="30" placeholder="이메일" maxlength="30" required>			
				</div>
				<div class="phonenum_div">
					<label class="input_memeber_title">생년월일</label>
					<input type="date" id="birthDate_changepw" size="20" placeholder="생년월일" required>			
				</div>
				<div class="phonenum_div">
					<label class="input_memeber_title">연락처</label>
					<input type="tel" id="phoneNumber_changepw" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="012-3456-7890" required/>			
				</div>
				<div >					
					<input type="button" id="changepwcheck" value="확인" />			
				</div>
				<div>
				<a class="close_btn" id="close_btn" href="#close" rel="modal:close">취소</a>	
				</div>
			</div>
			
			<!-- 회원확인 완료 ->비밀번호 변경 페이지 -->
			<div id="changepwcheck_result" hidden="true">
				<input id="password_change" title="비밀번호 입력란" placeholder="비밀번호" type="password" value="">							
				<input id="password_change_chk" title="비밀번호 재입력 확인란" placeholder="비밀번호 재입력" type="password" value="">					
				<input type="hidden" id="matchEmail2" value="">
				<div>
				<a id="changepw_btn" class="close_btn_pw">비밀번호 변경</a>   
				</div> 
				<div>
				<a class="close_btn" id="close_btn" href="#close" rel="modal:close">취소</a>  
				</div> 
			</div>
			
			<div id="changepwcheck_fail" hidden="true">
				<label>일치하는 회원 정보가 없습니다.</label>	
				<a class="close_btn" id="close_btn" href="#close" rel="modal:close">돌아가기</a>		
			</div>
			
			<!-- 비밀번호 변경 결과 출력 -->
			<div id="changepw_result" hidden="true">
				<label id="changepw_Msg"></label>
				<a class="close_btn" id="close_btn" href="#close" rel="modal:close">확인</a>			
			</div>
		</form>
    </div>
</div>

<script>
	//회원정보찾기(비밀번호 변경시)
	$('#changepwcheck').click(function(){
		var email_changepw = $('#email_changepw').val();
		var birthDate_changepw = $('#birthDate_changepw').val();
		var phoneNumber_changepw = $('#phoneNumber_changepw').val();
		console.log(email_changepw);
		
		$.ajax({
			url: "member/changepwcheck",
			type: "post",
			data: {email_changepw: email_changepw, birthDate_changepw: birthDate_changepw, phoneNumber_changepw: phoneNumber_changepw},
			success: function(data){
				var matchEmail2 = data;
				console.log(matchEmail2);
				
				if(matchEmail2 == "fail"){										
					$('#changepwcheck_form').attr('hidden', true);
					$('#changepwcheck_fail').attr('hidden', false);	
				} else {
					$('#changepwcheck_form').attr('hidden', true);
					$('#changepwcheck_result').attr('hidden', false);								
					$('#matchEmail2').val(matchEmail2);			
				}//end if			
			},//end success
			error:function(){
				alert("해당하는 고객 정보 없음");
			}	
		})//end ajax	
	})//end changepw_btn
	
	//취소버튼
	$(".close_btn").click(function(){
		$('#email_changepw').val("");
		$('#birthDate_changepw').val("");
		$('#phoneNumber_changepw').val("");
		$('#changepw_Msg').val("");
		
		$('#changepwcheck_form').attr('hidden', false);
		$('#changepwcheck_result').attr('hidden', true);	
		$('#changepwcheck_fail').attr('hidden', true);
		$('#changepw_result').attr('hidden', true);
	
		$('#matchEmail2').val("");
	})//end close_btn
	
	//비밀번호 변경 update
	$("#changepw_btn").click(function(){
		var matchEmail2 = $('#matchEmail2').val();
		var password_change = $('#password_change').val();
		console.log(matchEmail2);
		
		$.ajax({
			url: "member/changepw",
			type: "post",
			data: {matchEmail2: matchEmail2, password_change: password_change},
			success: function(data){
				if(data == 'ok'){
					$('#changepwcheck_result').attr('hidden', true);					
					$('#changepw_result').attr('hidden', false);			
					$('#changepw_Msg').text("비밀번호가 변경되었습니다.").css({"color": "green", "font-size": "13px","font-weight": "400","letter-spacing":" -0.2px", "line-height": "18px;", "margin": "6px 12px 4px"});	
					//$('#matchEmail2').val("");
				} else {
					$('#changepwcheck_result').attr('hidden', true);
					$('#changepw_result').attr('hidden', false);
					$('#changepw_Msg').text("비밀번호를 변경할 수 없습니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400","letter-spacing":" -0.2px", "line-height": "18px;", "margin": "6px 12px 4px"});				
				}//end if
			},//end success
			error:function(){
				alert("비밀번호 변경 불가");
			}, 
			complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
				$('#matchEmail2').val("");
			}		
		})//end ajax	
	})//end changepw_btn

</script>