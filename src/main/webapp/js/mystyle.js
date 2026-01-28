$(function() { //jquery 시작

		//top move
	$("#backtotop").click(function(){
		$("html,body").animate({scrollTop0000000000000000: 0},600);//600ms
	})	


//quantity count
	var total = function(n) {
	var price=9900;
	var amount = $(".quantity").attr("value");
	var amount = parseInt(amount);
	var amount = amount + n;
	if(amount < 1) {
		amount = 1;
		alert("최소수량은 1개 입니다");
	}
	$(".quantity").attr("value", amount);
	var tot = price *amount;
	
	var regexp = /\B(?=(\d{3})+(?!\d))/g; //정규표현식
	tot = tot.toString().replace(regexp, ',');
	$(".total").html("("+amount+")개"+tot+"원");
}

	total(0);
	
	$(".plus").on("click",function() {
		total(1);	
	})
	
	$(".minus").on("click",function() {
		total(-1);
	})

	//ajax 통신 시작 : userid 중복 체크
	$.ajax({
		type:"POST", //전송방식
		url:"/mem/useridCheck.do", //요청경로
		data:{userid:$("#userid").val()}, //요청파라미터
		success:function(result){ //응답데이터 받는 곳
			//alert("result : " + result);
			if(result ==1){
				$(".userid-msg").html("<span style='color:#f00'>이미 사용중인 아이디입니다.</span>");
			}else{
				$(".userid-msg").html("<span style='color:#f00'>사용 가능한 아이디입니다.</span>");
			}
		},error:function(){ //통신실패
			alert("에러발생");
		}
	});

	//로그인 유효성 검사
				$("#btn-login").click(function() {
					let userid = $("#loginuserid").val();
					let password = $("#password").val();
					
					if(!userid) {
						$("#errmsg").html("<span style='color:#f00'>아이디를 입력하세요</span>");
						return;
					}
					if(!password) {
						$("#errmsg").html("<span style='color:#f00'>비밀번호를 입력하세요</span>");
						return;
					}
					$.ajax({
						type:"post",
						url:"/mem/loginpro.do",
						data:{userid:userid, password:password},
						success:function(result) {
							if(result == "success") { //로그인 성공
								//user id 쿠키 저장
								if($("#saveid").is(":checked")) {
								//만약에 아이디 저장(체크박스)가 체크되어 있으면 아래를 실행
								$.cookie("saveid", userid,{expires:7, path:"/"});
								//쿠키이름, 쿠키값, 옵션(7일간유지 , 웹사이트 전체경로)
								}else{
									$.removeCookie("saveid", {path:"/"});
								}
								//메인페이지 이동
							location.href="/";
							}else{
								$("#errmsg").html("<span style='color:f00'> 아이디 또는 비밀번호를 확인하세요</span>");
							}
						},error:function(){
							$("#errmsg").html("<span style='color:#f00'>서버에러 발생</span>");	
						}
					})
				})
	
	
	$("#btn-submit").click(function() {
		var isvalid = true;
		$("#writer, #userid, #password, #pwcheck, #email, #phone").each(function() {
			// 아이디가 writer,userid,password,pw2,email,phone인 태그를 각각(each) 돌면서 아래를 실행하라
			if(!$(this).val()) {
				//만약에 각각의 태그($(this))의 값(val)이 없으면 (!) 아래를 실행
				isvalid = false;
				//커서를 각각의 태그로 이동(focus) 시킨다.
				$(this).focus();
				return false; // each 탈출
			}
		});
		if(isvalid){
			//만약에 isvalid가 true이면 아래를 실행
			$("#myform").attr("method","post");
			//아이디가 myform인 태그의 속성(attr) method를 post로 설정
			$("#myform").attr("action", "/shop/mem/shopsave.do");
			//아이디가 myform인 태그의 속성(attr) action을 /mem/member.save.do로 설정				
			$("#myform").submit();
			//아이디가 myform인 태그를 전송(submit)한다.		
		}		
	});

})

if($.cookie("saveid")) {
	//만약에 saveid라는 이름의 쿠키가 있으면 아래를 실행
	$("#loginuserid").val($.cookie("saveid"));
	//아이디 입력칸에 쿠키의 값을 넣음
	$("#saveid").prop("checked", true);
	//체크박스를 체크된 상태로 만들어준다				
}





/*
//위 내용을 순수한 자바스크립트로 만들어 보자
document.addEventListener('DOMContentLoaded', function() {
const backtotop = document.getElementById('backtotop');

backtotop.addEventListener("click",function() {
	window.scrollTo({
		top:0,
		behavior: 'smooth'
		})
	})	
})
*/