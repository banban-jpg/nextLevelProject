<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <footer>
    <div class="footer-inner">
      <div class="footer-top">

        <div class="footer-brand">
          <div class="logo">
            <span class="logo-main">NEXT LEVEL</span>
            <span class="logo-sub">넥스트 레벨</span>
          </div>
          <p class="footer-desc">
            콘서트, 뮤지컬, 연극, 오케스트라, 팝업 이벤트까지<br />
            모든 문화 공연을 한 곳에서 빠르고 편리하게 예매하세요.
          </p>
          <div class="footer-social">
            <a href="#" class="social-btn"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-btn"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-btn"><i class="fab fa-youtube"></i></a>
            <a href="#" class="social-btn"><i class="fab fa-facebook-f"></i></a>
          </div>
        </div>

        <div class="footer-col">
          <h5>서비스</h5>
          <ul>
            <li><a href="#">공연 목록</a></li>
            <li><a href="#">카테고리</a></li>
            <li><a href="#">예매확인</a></li>
            <li><a href="#">취소/환불</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h5>회사</h5>
          <ul>
            <li><a href="#">회사소개</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">채용</a></li>
            <li><a href="#">파트너십</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h5>고객지원</h5>
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">1:1 문의</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보처리방침</a></li>
          </ul>
        </div>

      </div>
      <div class="footer-bottom">
        <span>© 2025 NEXT LEVEL. All rights reserved.</span>
        <span>사업자등록번호: 123-45-67890 | 대표: 홍길동 | 서울특별시 강남구</span>
      </div>
    </div>
  </footer>

  <button id="scrollTop" onclick="window.scrollTo({top:0,behavior:'smooth'})">
    <i class="fas fa-arrow-up"></i>
  </button>


  <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

  <script>
    /* AOS 초기화 */
    AOS.init({ duration: 700, easing: 'ease-out-cubic', once: true, offset: 60 });

    /* 스크롤 시 헤더 블러 + 맨 위로 버튼 표시 */
    const header       = document.getElementById('header');
    const scrollTopBtn = document.getElementById('scrollTop');

    window.addEventListener('scroll', function () {
      if(header && scrollTopBtn) {
        const scrolled = window.scrollY > 60;
        header.classList.toggle('scrolled', scrolled);
        scrollTopBtn.classList.toggle('show', scrolled);
      }
    });

    /* 모바일 네비게이션 토글 */
    function toggleMobileNav() {
      const nav = document.getElementById('mobileNav');
      if(nav) nav.classList.toggle('open');
    }

    /* 외부 클릭 시 모바일 nav 닫기 */
    document.addEventListener('click', function (e) {
      const nav       = document.getElementById('mobileNav');
      const hamburger = document.getElementById('hamburger');
      if (nav && hamburger && !nav.contains(e.target) && !hamburger.contains(e.target)) {
        nav.classList.remove('open');
      }
    });

    /* 앵커 스크롤 (sticky 헤더 오프셋 보정) */
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
      anchor.addEventListener('click', function (e) {
        const targetStr = this.getAttribute('href');
        if(targetStr === '#') return;
        
        const target = document.querySelector(targetStr);
        if (target) {
          e.preventDefault();
          window.scrollTo({ top: target.getBoundingClientRect().top + window.scrollY - 80, behavior: 'smooth' });
        }
      });
    });
  </script>
</body>
</html>