<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 1. 공통 헤더 (head 태그, 네비게이션 포함) --%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <section id="hero">
    <div class="hero-orb hero-orb-1"></div>
    <div class="hero-orb hero-orb-2"></div>
    <div class="hero-orb hero-orb-3"></div>

    <div class="hero-content">
      <div class="hero-text">
        <div class="eyebrow"><i class="fas fa-bolt"></i> No.1 티케팅 플랫폼</div>
        <h1 class="hero-headline">모든 <em>특별한 순간</em>,<br />넥스트 레벨에서<br />예매하세요</h1>
        <p class="hero-sub">콘서트부터 연극, 팝업, 오케스트라까지<br />NEXT LEVEL과 함께하세요</p>
        <div class="hero-buttons">
          <a href="#popular" class="btn btn-white"><i class="fas fa-search"></i> 공연 보러가기</a>
          <a href="#popular" class="btn btn-outline-white"><i class="fas fa-ticket-alt"></i> 예매 바로하기</a>
        </div>
        <div class="hero-stats">
          <div class="stat-item"><span class="stat-num">2,400+</span><span class="stat-label">등록 공연 수</span></div>
          <div class="stat-item"><span class="stat-num">380만</span><span class="stat-label">누적 회원</span></div>
          <div class="stat-item"><span class="stat-num">99.9%</span><span class="stat-label">고객 만족도</span></div>
        </div>
      </div>

      <div class="hero-visual">
        <div class="hero-card-stack">
          <div class="hero-ticket-card card-back">
            <div class="ticket-img-placeholder ticket-img-concert-1">🎵</div>
            <div class="ticket-body">
              <div class="ticket-category">CONCERT</div>
              <div class="ticket-title">아이유 CONCERT TOUR</div>
              <div class="ticket-date">2025.08.15 — 잠실 올림픽주경기장</div>
              <div class="ticket-footer"><span class="ticket-price">₩165,000</span><span class="ticket-btn">예매하기</span></div>
            </div>
          </div>
          <div class="hero-ticket-card card-front">
            <div class="ticket-img-placeholder ticket-img-musical-1">🎭</div>
            <div class="ticket-body">
              <div class="ticket-category">MUSICAL</div>
              <div class="ticket-title">레미제라블 — 25주년 기념</div>
              <div class="ticket-date">2025.09.01 — 샤롯데씨어터</div>
              <div class="ticket-footer"><span class="ticket-price">₩130,000</span><span class="ticket-btn">예매하기</span></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="welcome">
    <div class="container">
      <div class="welcome-grid">
        <div class="welcome-left" data-aos="fade-right">
          <div class="overline">ABOUT NEXT LEVEL</div>
          <h2 class="section-title">NEXT LEVEL에<br />오신 것을 환영합니다</h2>
          <p class="welcome-desc">넥스트 레벨은 콘서트, 뮤지컬, 연극, 오케스트라, 팝업 이벤트까지<br />다양한 문화 공연을 빠르고 편리하게 예매할 수 있는 올인원 플랫폼입니다.</p>
        </div>
        <div class="welcome-cards" data-aos="fade-left">
          <div class="welcome-card">
            <div class="welcome-card-icon"><i class="fas fa-bolt"></i></div>
            <div class="welcome-card-text"><h4>빠른 예매</h4><p>간편한 UI로 원하는 공연을 빠르게 예매하세요.</p></div>
          </div>
          <div class="welcome-card">
            <div class="welcome-card-icon"><i class="fas fa-shield-alt"></i></div>
            <div class="welcome-card-text"><h4>안전한 결제</h4><p>결제 정보를 안전하게 보호합니다.</p></div>
          </div>
          <div class="welcome-card">
            <div class="welcome-card-icon"><i class="fas fa-map-marker-alt"></i></div>
            <div class="welcome-card-text"><h4>실시간 좌석</h4><p>실시간으로 좌석 현황을 확인하세요.</p></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="categories">
    <div class="container">
      <div class="categories-header" data-aos="fade-up">
        <h2 class="section-title">원하는 공연을 찾아보세요</h2>
      </div>
      <div class="category-grid">
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="50"><span class="cat-icon">🎵</span><span class="cat-name">콘서트</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="100"><span class="cat-icon">🎭</span><span class="cat-name">뮤지컬</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="150"><span class="cat-icon">🎬</span><span class="cat-name">연극</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="200"><span class="cat-icon">🎻</span><span class="cat-name">오케스트라</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="250"><span class="cat-icon">🛍️</span><span class="cat-name">팝업 스토어</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="300"><span class="cat-icon">🎪</span><span class="cat-name">페스티벌</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="350"><span class="cat-icon">🏟️</span><span class="cat-name">이벤트</span></a>
        <a href="#" class="category-card" data-aos="fade-up" data-aos-delay="400"><span class="cat-icon">➕</span><span class="cat-name">전체보기</span></a>
      </div>
    </div>
  </section>

  <section id="popular">
    <div class="container">
      <div class="popular-header">
        <div data-aos="fade-right">
          <h2 class="section-title">지금 인기있는 공연</h2>
        </div>
        <a href="#" class="view-all" data-aos="fade-left">전체보기 <i class="fas fa-arrow-right"></i></a>
      </div>
      <div class="shows-grid">
        <div class="show-card" data-aos="fade-up" data-aos-delay="50">
          <div class="show-img show-img-concert">🎵<div class="show-badge"><span class="badge badge-concert">콘서트</span></div></div>
          <div class="show-body">
            <div class="show-name">아이유 HEREH WORLD TOUR</div>
            <div class="show-meta"><i class="fas fa-calendar-alt"></i> 2025.08.15 ~ 08.17</div>
            <div class="show-footer"><div class="show-price">₩165,000<br /><span>부터</span></div><button class="btn-book">예매하기</button></div>
          </div>
        </div>
        <div class="show-card" data-aos="fade-up" data-aos-delay="100">
          <div class="show-img show-img-musical">🎭<div class="show-badge"><span class="badge badge-musical">뮤지컬</span></div></div>
          <div class="show-body">
            <div class="show-name">레미제라블 25주년 기념</div>
            <div class="show-meta"><i class="fas fa-calendar-alt"></i> 2025.09.01 ~ 10.30</div>
            <div class="show-footer"><div class="show-price">₩130,000<br /><span>부터</span></div><button class="btn-book">예매하기</button></div>
          </div>
        </div>
        <div class="show-card" data-aos="fade-up" data-aos-delay="150">
          <div class="show-img show-img-drama">🎬<div class="show-badge"><span class="badge badge-drama">연극</span></div></div>
          <div class="show-body">
            <div class="show-name">벚꽃동산 — 국립극단</div>
            <div class="show-meta"><i class="fas fa-calendar-alt"></i> 2025.07.10 ~ 07.27</div>
            <div class="show-footer"><div class="show-price">₩55,000<br /><span>부터</span></div><button class="btn-book">예매하기</button></div>
          </div>
        </div>
        <div class="show-card" data-aos="fade-up" data-aos-delay="200">
          <div class="show-img show-img-festival">🎪<div class="show-badge"><span class="badge badge-festival">페스티벌</span></div></div>
          <div class="show-body">
            <div class="show-name">인천 펜타포트 2025</div>
            <div class="show-meta"><i class="fas fa-calendar-alt"></i> 2025.08.01 ~ 08.03</div>
            <div class="show-footer"><div class="show-price">₩99,000<br /><span>부터</span></div><button class="btn-book">예매하기</button></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="howto">
    <div class="container">
      <div class="howto-header" data-aos="fade-up">
        <h2 class="section-title">쉽고 빠른 예매 방법</h2>
      </div>
      <div class="steps-row">
        <div class="step-item" data-aos="fade-up"><div class="step-circle"><i class="fas fa-user-plus"></i><span class="step-num">1</span></div><div class="step-title">회원가입</div></div>
        <div class="step-item" data-aos="fade-up" data-aos-delay="100"><div class="step-circle"><i class="fas fa-search"></i><span class="step-num">2</span></div><div class="step-title">공연 선택</div></div>
        <div class="step-item" data-aos="fade-up" data-aos-delay="200"><div class="step-circle"><i class="fas fa-chair"></i><span class="step-num">3</span></div><div class="step-title">좌석 선택</div></div>
        <div class="step-item" data-aos="fade-up" data-aos-delay="300"><div class="step-circle"><i class="fas fa-check-circle"></i><span class="step-num">4</span></div><div class="step-title">결제 완료</div></div>
      </div>
    </div>
  </section>

  <section id="promo" style="padding-bottom: 100px;">
    <div class="container">
      <div class="promo-header" data-aos="fade-right">
        <div class="promo-tag"><i class="fas fa-fire"></i> 놓치지 마세요</div>
        <h2 class="section-title">이런 행사도 확인해보세요</h2>
      </div>
      <div class="promo-grid">
        <div class="promo-card" data-aos="fade-up">
          <div class="promo-bg promo-bg-popup">🛍️</div><div class="promo-overlay"></div>
          <div class="promo-content">
            <div class="promo-cat">팝업 스토어</div>
            <div class="promo-title">SM 엔터테인먼트 팝업</div>
            <a href="#" class="promo-link">자세히 보기 <i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
        <div class="promo-card" data-aos="fade-up" data-aos-delay="100">
          <div class="promo-bg promo-bg-classic">🎻</div><div class="promo-overlay"></div>
          <div class="promo-content">
            <div class="promo-cat">클래식</div>
            <div class="promo-title">베를린 필하모닉 내한</div>
            <a href="#" class="promo-link">자세히 보기 <i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
        <div class="promo-card" data-aos="fade-up" data-aos-delay="200">
          <div class="promo-bg promo-bg-event">🏟️</div><div class="promo-overlay"></div>
          <div class="promo-content">
            <div class="promo-cat">행사</div>
            <div class="promo-title">서울 문화 페스타</div>
            <a href="#" class="promo-link">자세히 보기 <i class="fas fa-arrow-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </section>

<%-- 2. 공통 푸터 (footer 태그, 스크립트 포함) --%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>