<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Highlight | Hebi</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      font-family: 'Noto Sans KR', Arial, sans-serif;
      background: #f7f7f7;
      margin: 0;
      color: #222;
    }
    .navbar {
      background: #fff;
      box-shadow: 0 2px 8px rgba(0,0,0,0.04);
      padding: 0.7rem 2rem;
    }
    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: #222 !important;
      letter-spacing: 1px;
    }
    .highlight-title {
      font-size: 2.1rem;
      font-weight: 700;
      margin: 2.5rem 0 1.5rem 0;
      text-align: center;
      letter-spacing: 1px;
    }
    .card {
      border: none;
      border-radius: 18px;
      box-shadow: 0 2px 12px rgba(0,0,0,0.07);
      transition: transform 0.15s;
      background: #fff;
    }
    .card:hover {
      transform: translateY(-6px) scale(1.02);
      box-shadow: 0 6px 24px rgba(0,0,0,0.10);
    }
    .card-img-top {
      border-top-left-radius: 18px;
      border-top-right-radius: 18px;
      height: 180px;
      object-fit: cover;
    }
    .card-title {
      font-weight: 600;
      font-size: 1.15rem;
      margin-bottom: 0.5rem;
    }
    .card-text {
      color: #555;
      font-size: 0.98rem;
    }
    @media (max-width: 767px) {
      .highlight-title { font-size: 1.3rem; }
      .navbar { padding: 0.7rem 1rem; }
      .card-img-top { height: 120px; }
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="/">Hebi</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item"><a class="nav-link" href="/highlight.jsp">Highlight</a></li>
        <li class="nav-item"><a class="nav-link" href="/mem/login.do">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="/mem/join.do">Sign Up</a></li>
      </ul>
    </div>
  </nav>
  <div class="container">
    <div class="highlight-title">Highlight</div>
    <div class="row">
      <!-- Sample highlight cards -->
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Highlight 1">
          <div class="card-body">
            <h5 class="card-title">첫 번째 하이라이트</h5>
            <p class="card-text">이곳에 하이라이트의 간단한 설명이 들어갑니다. 최신 소식, 이벤트, 혹은 인기 게시물을 소개하세요.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Highlight 2">
          <div class="card-body">
            <h5 class="card-title">두 번째 하이라이트</h5>
            <p class="card-text">이곳에 하이라이트의 간단한 설명이 들어갑니다. 커뮤니티의 주요 순간을 강조해보세요.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4 mb-4">
        <div class="card h-100">
          <img src="https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=600&q=80" class="card-img-top" alt="Highlight 3">
          <div class="card-body">
            <h5 class="card-title">세 번째 하이라이트</h5>
            <p class="card-text">이곳에 하이라이트의 간단한 설명이 들어갑니다. 멋진 사진이나 소식을 카드로 보여주세요.</p>
          </div>
        </div>
      </div>
      <!-- Add more cards as needed -->
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
