<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidemenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
<title>Diary</title>


</head>


<body>
<%@ include file="/header.jsp" %>
<%@ include file="/sidemenu.jsp" %>
  <!-- 좌측 메뉴 영역 (Diary 밑에 오버레이로, 검정색 배경) -->
  <aside id="sideMenu" style="position:absolute; left:0; top:64px; width:260px; background:#fff; color:#1a7ad1; box-shadow:2px 0 8px rgba(0,0,0,0.18); padding:32px 24px 24px 24px; display:flex; flex-direction:column; align-items:flex-start; transform:translateX(-100%); transition:transform 0.35s cubic-bezier(.4,0,.2,1); z-index:20;">
    <div style="font-size:1.1em; color:#1a7ad1; font-weight:600; margin-bottom:16px;">ログインして<br>好きなチームを<br>応援しましょう！</div>
    <button style="background:#1a7ad1; color:#fff; border:none; border-radius:20px; padding:7px 24px; font-size:0.98em; font-weight:500; margin-bottom:24px; cursor:pointer;">ログイン</button>
    <hr style="width:100%; border:0; border-top:1.5px solid #e0e0e0; margin:0 0 18px 0;">
    <div style="font-size:1em; color:#888; font-weight:600; margin-bottom:12px;">おすすめチーム</div>
    <button style="background:#f5f7fa; color:#1a7ad1; border:1.5px solid #d0e3fa; border-radius:16px; padding:7px 18px; font-size:0.97em; font-weight:500; cursor:pointer;">チームを探す</button>
  </aside>
  <!-- 본문 영역: 전체적으로 오른쪽으로 이동, 메뉴와 겹치지 않게 padding-left 적용 -->
  <div id="mainContent" style="margin-left:0; padding-right:24px; transition:margin-left 0.35s cubic-bezier(.4,0,.2,1);">
    <!-- carowsel -->
<div class="container my-4">
  <div id="customCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <div class="row">
          <div class="col-md-6">
            <img src="/blog/image/T1.jpg" class="carousel-img" alt="Image 1">
          </div>
          <div class="col-md-6">
            <img src="/blog/image/DRX.jpg" class="carousel-img" alt="Image 2">
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="row">
          <div class="col-md-6">
            <img src="/blog/image/HLE.jpg" class="carousel-img" alt="Image 3">
          </div>
          <div class="col-md-6">
            <img src="/blog/image/T1.jpg" class="carousel-img" alt="Image 4">
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#customCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#customCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<!-- 응원하는 팀 영역 -->
<div style="width:100%; max-width:900px; margin:32px auto 0 auto; background:#f5f7fa; border-radius:18px; box-shadow:0 2px 8px rgba(0,0,0,0.06); padding:36px 0 48px 0; display:flex; flex-direction:column; align-items:center;">
  <div style="font-size:1.35em; font-weight:600; margin-bottom:28px; color:#1a7ad1;">応援するチームに会いに行きましょう!</div>
  <div style="display:flex; flex-wrap:wrap; gap:16px; justify-content:center;">
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/EDG_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="T1">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">T1</span>
    </button>
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/DRX_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="DRX">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">DRX</span>
    </button>
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/HLE_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="HLE">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">HLE</span>
    </button>
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/KT_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="KT">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">KT</span>
    </button>
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/DK_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="DK">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">DK</span>
    </button>
  </div>
</div>
<!-- 다른 리그의 팀 영역 -->
<div style="width:100%; max-width:900px; margin:32px auto 0 auto; background:#f5f7fa; border-radius:18px; box-shadow:0 2px 8px rgba(0,0,0,0.06); padding:36px 0 48px 0; display:flex; flex-direction:column; align-items:center;">
  <div style="font-size:1.25em; color:#1a7ad1; font-weight:600; margin-bottom:28px;">他のリーグのチームにも会いに行きましょう！!</div>
  <div style="display:flex; justify-content:center; gap:80px; width:100%;">
    <!-- 좌측 팀 프로필 버튼 -->
    <button onclick="location.href='${pageContext.request.contextPath}/bc/list.do'" class="league-team-btn">
      <div style="position:relative; width:64px; height:64px;">
        <img src="/blog/image/logo/T1_logo.png" class="league-profile-img-large" alt="T1">
        <img src="/blog/image/logo/LCK.jpg" class="league-profile-img-small" alt="LCK">
      </div>
      <span class="league-team-label">T1</span>
    </button>
    <!-- 우측 팀 프로필 버튼 -->
    <button onclick="location.href='${pageContext.request.contextPath}/bc/list.do'" class="league-team-btn">
      <div style="position:relative; width:64px; height:64px;">
        <img src="/blog/image/logo/IG_logo.png" class="league-profile-img-large" alt="DRX">
        <img src="/blog/image/logo/LPL_logo.png" class="league-profile-img-small" alt="LCK">
      </div>
      <span class="league-team-label">IG</span>
    </button>
  </div>
</div>
  </div>
  <%@ include file="/footer.jsp" %>
  
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
</script>
</html>