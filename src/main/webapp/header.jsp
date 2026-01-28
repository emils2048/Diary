<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="top_right">
	<ul>
		<c:choose>
			<c:when test="${empty sessionScope.userid}">
				<li class="first"><a href="/blog/mem/login.do" style="background:#987de8; color:#fff; border:none; border-radius:24px; padding:7px 18px; font-size:1em; font-weight:600;">ログイン</a></li>
				<li><a href="/blog/mem/join.do" style="background:#987de8; color:#fff; border:none; border-radius:24px; padding:7px 18px; font-size:1em; font-weight:600;">新規登録</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/blog/mem/logout.do" style="background:#987de8; color:#fff; border:none; border-radius:24px; padding:7px 18px; font-size:1em; font-weight:600;">ログアウト</a></li>
				<li><a href="/member/mypage.jsp" style="background:#987de8; color:#fff; border:none; border-radius:24px; padding:7px 18px; font-size:1em; font-weight:600;">マイページ</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>

<header class="header">
	<button id="menuToggleBtn" class="menu-btn">
		<span class="menu-icon">
			<span></span>
			<span></span>
			<span></span>
		</span>
	</button>
	<a href="/blog/index.jsp" class="logo">ダイアリー</a>
</header>