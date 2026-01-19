<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;600;700&display=swap">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/svg+xml" href="/blog/favicon.svg">
<link rel="icon" type="image/svg+xml" href="/blog/favicon.svg">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sidemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/my.css">
<title>T1 Diary</title>

</head>
<body>


	<%@ include file="/header.jsp"%>
	<%@ include file="/sidemenu.jsp"%>

	<!-- 메인 배너 이미지 -->
	<div class="main-banner"
		style="height: 420px; display: flex; align-items: center; justify-content: center;">
		<img src="/blog/image/T1.jpg" alt="T1 로고"
			style="height: 100%; object-fit: cover;">
	</div>
	<!-- 메인 컨텐츠 레이아웃 -->
	<div class="main-content-layout">
		<div class="main-left"
			style="flex: 1 1 0; min-width: 0; max-width: 850px;">
			<!-- 공지 공간 -->
			<div class="notice-bar"
				style="background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(34, 34, 34, 0.08); display: flex; align-items: center; gap: 12px; padding: 18px 20px; margin-bottom: 18px;">
				<span class="notice-title">お知らせ</span> <span class="notice-content">T1
					選手に力になる応援の人言葉を残しましょう!</span>
			</div>
			<!-- From T1 피드 공간 -->
			<section class="from-t1-section">
				<div class="from-t1-title">From T1</div>
				<div class="from-t1-feed" style="gap: 20px;">
					<c:forEach var="item" items="${list}">
						<a
							href="${pageContext.request.contextPath}/bc/diaryview.do?bno=${item.bno}"
							class="from-t1-card"
							style="display: block; text-decoration: none; color: inherit; background: #fff; border-radius: 16px; box-shadow: 0 2px 12px rgba(34, 34, 34, 0.10); padding: 24px 20px 20px 20px; margin-bottom: 20px; transition: box-shadow 0.2s;">
							<div style="display: flex; align-items: center; gap: 12px;">
								<c:if test="${not empty item.member.profile}">
									<img src="/img/${item.member.profile}" alt="프로필"
										style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; box-shadow: 0 1px 4px rgba(34, 34, 34, 0.10);">
								</c:if>
								<div
									style="display: flex; flex-direction: column; align-items: flex-start; justify-content: center;">
									<div class="from-t1-author"
										style="font-weight: 700; color: #222; font-size: 1em; line-height: 1.1;">${item.member.username}</div>
									<div class="from-t1-date"
										style="color: #888; font-size: 0.85em; line-height: 1.1; margin-top: 2px;">${item.regdate}</div>
								</div>
							</div>
							<div class="from-t1-content"
								style="font-size: 1.08em; color: #222; margin-top: 18px; margin-bottom: 2px; line-height: 1.7;">${item.content}</div>
							<c:if test="${not empty item.imgfile}">
								<img src="/img/${item.imgfile}" alt="投稿画像"
									style="width: 100%; border-radius: 12px; margin-top: 16px; margin-bottom: 2px;">
							</c:if>
						</a>
					</c:forEach>
				</div>
			</section>
		</div>
		<div class="main-right">
			<!-- T1 소개 영역 -->
			<div class="t1-info">
				<img src="/blog/image/T1.jpg" alt="T1" class="t1-info-img">
				<div class="t1-info-title">T1 紹介</div>
				<div class="t1-info-desc">T1は世界最高のeスポーツチームの一つで、様々な大会で優れた成績を収めています。ファンと一緒に成長するT1を応援してください！!</div>
			</div>
			<!-- 고정 메뉴 -->
			<div class="fixed-menu">
				<button class="write-btn" onclick="onWriteClick()"
					style="background: #987de8; color: #fff; border: none; border-radius: 16px; padding: 7px 22px; font-size: 1em; font-weight: 600; cursor: pointer;">投稿する</button>
			</div>

		</div>
	</div>
	<!-- 좌측 메뉴 영역 (Diary 밑에 오버레이로, 검정색 배경) -->
	<aside id="sideMenu"
		style="position: absolute; left: 0; top: 64px; width: 260px; background: #fff; color: #222; box-shadow: 2px 0 8px rgba(0, 0, 0, 0.18); padding: 32px 24px 24px 24px; display: flex; flex-direction: column; align-items: flex-start; transform: translateX(-100%); transition: transform 0.35s cubic-bezier(.4, 0, .2, 1); z-index: 20;">
		<div
			style="font-size: 1.1em; color: #222; font-weight: 600; margin-bottom: 16px;">
			ログインして<br>好きなチームを<br>応援しましょう！
		</div>
		<button
			style="background: #987de8; color: #fff; border: none; border-radius: 20px; padding: 7px 24px; font-size: 0.98em; font-weight: 500; margin-bottom: 24px; cursor: pointer;">로그인</button>
		<hr
			style="width: 100%; border: 0; border-top: 1.5px solid #e0e0e0; margin: 0 0 18px 0;">
		<div
			style="font-size: 1em; color: #888; font-weight: 600; margin-bottom: 12px;">추천
			팀</div>
		<button
			style="background: #f5f7fa; color: #222; border: 1.5px solid #d0e3fa; border-radius: 16px; padding: 7px 18px; font-size: 0.97em; font-weight: 500; cursor: pointer;">팀
			찾기</button>
	</aside>
	</div>

	<%@ include file="/footer.jsp"%>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// 메뉴바 토글 index.jsp와 동일하게 동작하도록 구현
		const menuBtn = document.getElementById('menuToggleBtn');
		const sideMenu = document.getElementById('sideMenu');
		const mainContent = document.getElementById('mainContent');
		let menuOpen = false;
		menuBtn.addEventListener('click', function() {
			menuOpen = !menuOpen;
			if (menuOpen) {
				sideMenu.style.transform = 'translateX(0)';
				mainContent.style.marginLeft = '260px';
			} else {
				sideMenu.style.transform = 'translateX(-100%)';
				mainContent.style.marginLeft = '0';
			}
		});
		function onWriteClick() {
  var isLogin = "${not empty sessionScope.userid}" === "true" || ${not empty sessionScope.userid};
  if (!isLogin) {
    alert('ログインしてください。');
    return;
  }
  location.href = '/blog/write.jsp';
}
	
		
	</script>
</body>
</html>