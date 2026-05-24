<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="concert-list-page" style="padding-top: 120px; padding-bottom: 100px;">
  <div class="container">
    
    <!-- Page Header -->
    <div class="popular-header" style="margin-bottom: 60px;">
      <div data-aos="fade-right">
        <h2 class="section-title">콘서트 리스트</h2>
        <p class="section-subtitle">현재 예매 가능한 모든 콘서트를 확인하세요.</p>
      </div>
    </div>

    <!-- Minimalist Horizontal List -->
    <div class="concert-vertical-list">

      <!-- Item 1 -->
      <div class="concert-list-item" data-aos="fade-up">
        <div class="item-content-box">
          <div class="item-main-info">
            <h3 class="show-name">IU HEREH WORLD TOUR : SEOUL</h3>
            <div class="show-meta-list">
              <span class="meta-item"><i class="fas fa-calendar-alt"></i> 2025.08.15 ~ 08.17</span>
              <span class="meta-item"><i class="fas fa-map-marker-alt"></i> 잠실 올림픽주경기장</span>
            </div>
          </div>
          
          <div class="item-side-info">
            <div class="show-price">
              ₩165,000 <span>부터</span>
            </div>
            <button class="btn-book">예매하기</button>
          </div>
        </div>
      </div>

      <!-- Item 2 -->
      <div class="concert-list-item" data-aos="fade-up" data-aos-delay="100">
        <div class="item-content-box">
          <div class="item-main-info">
            <h3 class="show-name">Bruno Mars : Live in Seoul</h3>
            <div class="show-meta-list">
              <span class="meta-item"><i class="fas fa-calendar-alt"></i> 2025.09.20 ~ 09.21</span>
              <span class="meta-item"><i class="fas fa-map-marker-alt"></i> 인천 아시아드 주경기장</span>
            </div>
          </div>
          
          <div class="item-side-info">
            <div class="show-price">
              ₩187,000 <span>부터</span>
            </div>
            <button class="btn-book">예매하기</button>
          </div>
        </div>
      </div>

      <!-- Item 3 -->
      <div class="concert-list-item" data-aos="fade-up" data-aos-delay="200">
        <div class="item-content-box">
          <div class="item-main-info">
            <h3 class="show-name">Imagine Dragons : LOOM World Tour</h3>
            <div class="show-meta-list">
              <span class="meta-item"><i class="fas fa-calendar-alt"></i> 2025.11.02</span>
              <span class="meta-item"><i class="fas fa-map-marker-alt"></i> 부산 벡스코(BEXCO)</span>
            </div>
          </div>
          
          <div class="item-side-info">
            <div class="show-price">
              ₩143,000 <span>부터</span>
            </div>
            <button class="btn-book">예매하기</button>
          </div>
        </div>
      </div>

      <!-- Item 4 -->
      <div class="concert-list-item" data-aos="fade-up" data-aos-delay="300">
        <div class="item-content-box">
          <div class="item-main-info">
            <h3 class="show-name">ULTRA KOREA 2025</h3>
            <div class="show-meta-list">
              <span class="meta-item"><i class="fas fa-calendar-alt"></i> 2025.08.01 ~ 08.03</span>
              <span class="meta-item"><i class="fas fa-map-marker-alt"></i> 서울랜드</span>
            </div>
          </div>
          
          <div class="item-side-info">
            <div class="show-price">
              ₩99,000 <span>부터</span>
            </div>
            <button class="btn-book">예매하기</button>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>