<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;600;700&display=swap">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/svg+xml" href="/blog/favicon.svg">
<script src="${pageContext.request.contextPath}/js/my.js "></script>

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

	<!-- 중앙 로그인 박스 -->
	<div class="d-flex justify-content-center align-items-center"
		style="min-height: calc(100vh - 64px - 120px);">
		<div class="card shadow"
			style="width: 370px; border-radius: 18px; padding: 36px 32px 28px 32px;">
			<h2 class="text-center mb-4" style="font-weight: 700; color: #222;">ログイン</h2>
			<%
			String msg = request.getParameter("msg");
			if (msg != null) {
				if ("fail".equals(msg)) {
			%>
			<div class="alert alert-danger">아이디 또는 비밀번호가 올바르지 않습니다.</div>
			<%
			}
			}
			%>
			<form method="post"
				action="/blog/mem/loginpro.do">
				<input type="hidden" name="returnUrl"
					value="<%=request.getParameter("returnUrl") != null ? request.getParameter("returnUrl")
		: (request.getHeader("referer") != null ? request.getHeader("referer") : request.getRequestURI())%>">

				<div class="form-group mb-3">
					<label for="userid">ID</label> <input type="text"
						class="form-control" id="userid" name="userid"
						placeholder="IDを入力してください" required>
				</div>

				<div class="form-group mb-4">
					<label for="password">パスワード</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="パスワードを入力してください。" required>
				</div>

				<button type="submit" class="btn btn-dark btn-block"
					style="background:#987de8; border-color:#987de8; color:#fff;">ログイン</button>
			</form>

			<div class="text-center mt-2">
				<a href="/blog/mem/join.do" class="btn btn-outline-dark signup-btn"
					style="border-radius: 8px; font-weight: 500; width: 70%; color: #987de8; border-color: #987de8;">新規登録</a>
			</div>
		</div>
	</div>
</body>
</html>