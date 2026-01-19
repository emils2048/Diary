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
body {margin: 0; background: #f7f7f7; font-family: "Noto Sans JP", "Hiragino Kaku Gothic ProN", "Yu Gothic", "Meiryo", "Segoe UI", Arial, sans-serif;}
.header {background:#fff; box-shadow:0 2px 8px rgba(0,0,0,0.05); padding:0 40px; display:flex; align-items:center; height:64px;}
.header .logo {font-weight:bold; font-size:1.5em; color:#1a7ad1; text-decoration: none;}
.header nav {margin-left:auto;}
.header nav a {margin:0 16px; color:#1a7ad1; text-decoration:none; font-weight:500;}
.main-visual {background:#e9f5ff; padding:60px 0; text-align:center;}
.main-visual h1 {font-size:2.5em; margin-bottom:16px; color:#1a7ad1;}
.main-visual p {font-size:1.2em; color:#555;}
.card-list {display:flex; flex-wrap:wrap; justify-content:center; gap:32px; margin:40px 0;}
.card {background:#fff; border-radius:16px; box-shadow:0 2px 8px rgba(0,0,0,0.08); width:320px; overflow:hidden; transition:box-shadow .2s;}
.card:hover {box-shadow:0 4px 16px rgba(0,0,0,0.12);}
.card img {width:100%; height:180px; object-fit:cover;}
.card-content {padding:24px;}
.card-content h2 {margin:0 0 12px 0; font-size:1.2em; color:#222;}
.card-content p {margin:0; color:#666; font-size:1em;}
.footer {background:#f5f7fa; color:#222; text-align:center; padding:36px 0 24px 0; font-size:1em; margin-top:40px; border-top:1px solid #e0e0e0;}
/* 캐러셀 이미지 크기 고정 */
.carousel-img {
  width: 100%;
  height: 260px;          /* ← 여기서 원하는 높이 */
  object-fit: cover;      /* 비율 유지하면서 잘라서 채움 */
  border-radius: 12px;    /* 선택 */
}

/* 응원하는 팀 버튼 프로필 이미지 스타일 개선 */
.team-profile-img {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  object-fit: cover;
  background: #eee;
  margin-right: 10px;
  border: none;
}

/* 다른 리그 팀 버튼 프로필 이미지 스타일 개선 */
.league-profile-img-large {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #e0e0e0;
  background: #fff;
}
.league-profile-img-small {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #fff;
  position: absolute;
  right: -6px;
  bottom: -6px;
  background: #fff;
}
.league-team-btn {
  display: flex;
  align-items: center;
  gap: 18px;
  background: #fff;
  border: 2px solid #d0e3fa;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
  border-radius: 32px;
  padding: 10px 28px 10px 10px;
  cursor: pointer;
  transition: box-shadow .2s;
}
.league-team-label {
  display: flex;
  align-items: center;
  background: #f5f7fa;
  color: #1a7ad1;
  font-weight: 700;
  border-radius: 20px;
  padding: 10px 24px;
  font-size: 1.12em;
  margin-left: 4px;
}
</style>
</head>


<body>
<div style="position:relative; min-height:100vh;">
  <header class="header">
    <button id="menuToggleBtn" style="background:none; border:none; outline:none; margin-right:18px; cursor:pointer; display:flex; align-items:center; justify-content:center; width:38px; height:38px;">
      <span style="display:inline-block; width:28px; height:22px; position:relative;">
        <span style="display:block; position:absolute; left:0; top:0; width:100%; height:4px; background:#1a7ad1; border-radius:2px;"></span>
        <span style="display:block; position:absolute; left:0; top:9px; width:100%; height:4px; background:#1a7ad1; border-radius:2px;"></span>
        <span style="display:block; position:absolute; left:0; top:18px; width:100%; height:4px; background:#1a7ad1; border-radius:2px;"></span>
      </span>
    </button>
    <a href="/blog/index.jsp" class="logo">ダイアリー</a>
    <nav>
      <a href="http://localhost:2386/blog/member/join.jsp" style="color:#1a7ad1;">プロフィル</a>
      <a href="http://localhost:2386/blog/member/login.jsp" style="color:#1a7ad1;">ログアウト</a>
    </nav>
  </header>
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
        <img src="/blog/image/logo/T1_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="T1">
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
        <img src="/blog/image/logo/T1_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="HLE">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">HLE</span>
    </button>
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/DRX_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="KT">
      </span>
      <span style="font-size:1em; color:#1a7ad1; font-weight:600;">KT</span>
    </button>
    <button style="display:flex; align-items:center; background:#fff; border:2px solid #d0e3fa; border-radius:24px; padding:6px 16px 6px 10px; box-shadow:0 2px 8px rgba(0,0,0,0.04); cursor:pointer; font-size:0.98em; font-weight:500; transition:box-shadow .2s; min-width:70px;">
      <span style="position:relative; width:28px; height:28px; border-radius:50%; display:flex; align-items:center; justify-content:center; margin-right:10px; overflow:hidden;">
        <img src="/blog/image/logo/T1_logo.png" style="width:28px; height:28px; border-radius:50%; object-fit:cover; border:2px solid #e0e0e0; background:#fff;" alt="DK">
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
    <button onclick="location.href='T1.jsp'" class="league-team-btn">
      <div style="position:relative; width:64px; height:64px;">
        <img src="/blog/image/logo/T1_logo.png" class="league-profile-img-large" alt="T1">
        <img src="/blog/image/logo/LCK.jpg" class="league-profile-img-small" alt="LCK">
      </div>
      <span class="league-team-label">T1</span>
    </button>
    <!-- 우측 팀 프로필 버튼 -->
    <button onclick="location.href='T1.jsp'" class="league-team-btn">
      <div style="position:relative; width:64px; height:64px;">
        <img src="/blog/image/logo/DRX_logo.png" class="league-profile-img-large" alt="DRX">
        <img src="/blog/image/logo/LCK.jpg" class="league-profile-img-small" alt="LCK">
      </div>
      <span class="league-team-label">T1</span>
    </button>
  </div>
</div>
  </div>
  
  
  <!-- footer -->
  <footer class="footer" style="background:#f5f7fa; color:#222; text-align:center; padding:36px 0 24px 0; font-size:1em; margin-top:40px; border-top:1px solid #e0e0e0;">
    <div style="max-width:900px; margin:0 auto; display:flex; flex-direction:column; align-items:center; gap:12px;">
      <div style="font-size:1.15em; font-weight:600; color:#222;">ダイアリー　Diary</div>
      <div style="color:#555; font-size:0.98em;">Copyright &copy; 2026 ダイアリー Diary. All rights reserved.</div>
      <div style="display:flex; gap:18px; justify-content:center; margin-top:8px;">
        <a href="#" style="color:#222; text-decoration:none; font-size:1em;">이용약관</a>
        <a href="#" style="color:#222; text-decoration:none; font-size:1em;">개인정보처리방침</a>
        <a href="#" style="color:#222; text-decoration:none; font-size:1em;">고객센터</a>
      </div>
      <div style="margin-top:10px;">
        <a href="https://weverse.io/" target="_blank" style="color:#1a7ad1; text-decoration:none; font-size:0.97em;">Inspired by Weverse.io</a>
      </div>
    </div>
  </footer>
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
</script>
</html>