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
