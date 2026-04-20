<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>NEXT LEVEL — 콘서트 티케팅 플랫폼</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;900&family=Bebas+Neue&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />

  <link rel="stylesheet" href="/static/css/style.css" />
</head>
<body>

  <header id="header">
    <div class="nav-inner">
      <a href="/index.jsp" class="logo">
        <span class="logo-main">NEXT LEVEL</span>
        <span class="logo-sub">넥스트 레벨</span>
      </a>
      <nav>
        <ul>
          <li><a href="/index.jsp">홈</a></li>
          <li><a href="/shows/list">공연</a></li>
          <li><a href="/ticket/confirm">예매확인</a></li>
          <li><a href="/login" class="nav-cta">로그인 / 회원가입</a></li>
        </ul>
      </nav>
      <div class="hamburger" id="hamburger" onclick="toggleMobileNav()">
        <span></span><span></span><span></span>
      </div>
    </div>
  </header>

  <div class="mobile-nav" id="mobileNav">
    <ul>
      <li><a href="/index.jsp" onclick="toggleMobileNav()">홈</a></li>
      <li><a href="/shows/list" onclick="toggleMobileNav()">공연</a></li>
      <li><a href="/ticket/confirm" onclick="toggleMobileNav()">예매확인</a></li>
      <li><a href="/login" onclick="toggleMobileNav()">로그인 / 회원가입</a></li>
    </ul>
  </div>