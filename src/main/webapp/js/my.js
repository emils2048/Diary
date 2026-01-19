function check() {

  if (!my.userid.value) {
    alert("아이디를 입력하세요");
    my.userid.focus();
    return false;
  }

  if (!my.username.value) {
    alert("닉네임을 입력하세요");
    my.username.focus();
    return false;
  }

  if (!my.password.value) {
    alert("비밀번호를 입력하세요");
    my.password.focus();
    return false;
  }

  if (!my.passwordck.value) {
    alert("비밀번호 확인을 입력하세요");
    my.passwordck.focus();
    return false;
  }

  if (my.password.value !== my.passwordck.value) {
    alert("비밀번호가 일치하지 않습니다");
    my.passwordck.focus();
    return false;
  }

  if (!my.email.value) {
    alert("이메일을 입력하세요");
    my.email.focus();
    return false;
  }

  return true; // ← 이게 있어야 submit 됨
}

$(function(){
    $("#btn-login").on("click", function(e) {
        e.preventDefault();
        let userid = $("#userid").val();
        let password = $("#password").val();

        if(!userid) {
            alert("아이디를 입력하세요");
            return;
        }
        if(!password) {
            alert("비밀번호를 입력하세요");
            return;
        }

        $.ajax({
            type: "post",
            url: "/blog/mem/loginpro.do", // 실제 서블릿 매핑
            data: { userid: userid, password: password },
            success: function(result) {
                if(result === "success") {
                    location.href = "/blog/index.jsp"; // 로그인 성공 후 이동
                } else {
                    alert("아이디 또는 비밀번호를 확인하세요");
                }
            },
            error: function() {
                alert("서버 오류 발생");
            }
        });
    });
});

