<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;600;700&display=swap">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/svg+xml" href="/blog/favicon.svg">

<title>Diary</title>


<style>
body {
	margin: 0;
	background: #f7f7f7;
	font-family: "Noto Sans JP", "Hiragino Kaku Gothic ProN", "Yu Gothic",
		"Meiryo", "Segoe UI", Arial, sans-serif;
}

.signup-btn:hover, .signup-btn:focus {
	background: #222 !important;
	color: #fff !important;
	border-color: #222 !important;
}
</style>
</head>


<body>

	<!-- 중앙 회원가입 박스 -->
	<div class="d-flex justify-content-center align-items-center"
		style="min-height: calc(100vh - 64px - 120px); position: relative;">
		<!-- 박스 밖 좌측상단에 텍스트 -->
		<div
			style="position: absolute; left: calc(50% - 185px); top: calc(50% - 170px); transform: translateY(-50%);">
			<span style="font-size: 1.25em; font-weight: 700; color: #222;">アカウントを作成</span>
		</div>
		<div class="card shadow"
			style="width: 370px; border-radius: 18px; padding: 36px 32px 28px 32px;">
			<form name="my" id="joinForm" action="/blog/mem/memberinsert.do"
				method="post" enctype="multipart/form-data" onsubmit="return check();">
				<div class="form-group mb-3">
					<label for="username" style="font-weight: 500; color: #222;">ID</label>
					<input type="text" class="form-control" id="userid" name="userid"
						placeholder="IDを入力してください">
				</div>
				<div class="form-group mb-3">
					<label for="nickname" style="font-weight: 500; color: #222;">ニックネーム</label>
					<input type="text" class="form-control" id="username"
						name="username" placeholder="ニックネームを入力してください">
				</div>
				<div class="form-group mb-3">
					<label for="password" style="font-weight: 500; color: #222;">パスワード</label>
					<input type="password" class="form-control" name="password"
						id="password" placeholder="パスワードを入力してください。">
				</div>
				<div class="form-group mb-3">
					<label for="passwordConfirm" style="font-weight: 500; color: #222;">パスワード確認</label>
					<input type="password" class="form-control" id="passwordck"
						name="passwordck" placeholder="パスワードをもう一度入力してください。">
				</div>
				<div class="form-group mb-4">
					<label for="email" style="font-weight: 500; color: #222;">メールアドレス</label>
					<input type="email" class="form-control" id="email" name="email"
						placeholder="メールアドレスを入力してください">
				</div>
				<!-- 프로필 사진 업로드 -->
				<div class="form-group mb-4">
	<label for="profileImg" style="font-weight: 500; color: #222;">プロフィール画像</label>
	<input type="file" class="form-control" id="profileImg" name="profileImg" accept="image/*">
	<small class="form-text text-muted">画像ファイルを選択してください（任意）</small>
</div>
				<button type="submit" id="btn-submit"
					class="btn btn-dark btn-block mb-3"
					style="font-weight: 600; font-size: 1.08em; border-radius: 8px; color: #fff; background: #987de8; border-color: #987de8;">登録</button>
			</form>
		</div>
	</div>

</body>
<script>
const menuBtn = document.getElementById('menuToggleBtn');
const sideMenu = document.getElementById('sideMenu');
const mainContent = document.getElementById('mainContent');
let menuOpen = false;
menuBtn.addEventListener('click', function() {
  menuOpen = !menuOpen;
  if(menuOpen) {
    sideMenu.style.transform = 'translateX(0)';
    mainContent.style.marginLeft = '260px';
  } else {
    sideMenu.style.transform = 'translateX(-100%)';
    mainContent.style.marginLeft = '0';
  }
});

function check() {
  if (!my.userid.value) {
    alert("IDを入力してください");
    my.userid.focus();
    return false;
  }
  if (!my.username.value) {
    alert("ニックネームを入力してください");
    my.username.focus();
    return false;
  }
  if (!my.password.value) {
    alert("パスワードを入力してください");
    my.password.focus();
    return false;
  }
  if (!my.passwordck.value) {
    alert("パスワードを確認してください");
    my.passwordck.focus();
    return false;
  }
  if (my.password.value !== my.passwordck.value) {
    alert("パスワードが違います");
    my.passwordck.focus();
    return false;
  }
  if (!my.email.value) {
    alert("emailを入力してください");
    my.email.focus();
    return false;
  }
  return true;
}

</script>
</html>