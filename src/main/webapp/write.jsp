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
<link rel="icon" type="image/svg+xml" href="/blog/favicon.svg">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">

<title>T1 Diary</title>
<!-- 기존 style 그대로 -->
<style>
/* === 기존 CSS 전부 그대로 유지 === */
</style>
</head>
<body>

<!-- 🔹 HEADER INCLUDE -->
<%@ include file="/header.jsp" %>



	<!-- 사이드 메뉴 -->
<%@ include file="/sidemenu.jsp" %>

	<div class="write-feed-container">
    <div class="write-feed-card">
        <div class="write-feed-header" style="justify-content: center;">
            <h3 style="margin: 0; font-weight: 600; font-size: 1.5em;">ポストする</h3>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/bc/diarywritepro.do"
              enctype="multipart/form-data">
            <div class="form-group w-100">
                <!-- 제목 입력란 제거 가능 -->
            </div>
            <div class="form-group w-100" style="margin-top: 18px;">
                <textarea class="form-control write-content-input" id="content" name="content" 
                          rows="12" maxlength="2000" required placeholder="内容を入力してください"
                          style="font-size: 1.18em; height: 320px;"></textarea>
            </div>
            <div class="write-feed-actions">
                <label for="imageUpload" class="img-upload-label">
                    <svg width="28" height="28" fill="#888" viewBox="0 0 24 24">
                        <path d="M21 19V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2zm-2 0H5V5h14zm-7-7a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm-5 7l3.5-4.5 2.5 3 3.5-4.5L19 19z"></path>
                    </svg>
                    <input type="file" id="imageUpload" name="imgfile" accept="image/*" style="display: none;">
                </label>
                <button type="submit" class="write-btn" style="background:#987de8; color:#fff; border:none; border-radius:16px; padding:7px 22px; font-size:1em; font-weight:600; cursor:pointer;">登録する</button>
            </div>
        </form>
    </div>
</div>


<!-- 🔹 FOOTER INCLUDE -->
<%@ include file="/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
	const menuBtn = document.getElementById('menuToggleBtn');
	const sideMenu = document.getElementById('sideMenu');
	let menuOpen = false;

	menuBtn.addEventListener('click', function () {
		menuOpen = !menuOpen;
		sideMenu.style.transform = menuOpen
			? 'translateX(0)'
			: 'translateX(-100%)';
	});
</script>
</body>
</html>
