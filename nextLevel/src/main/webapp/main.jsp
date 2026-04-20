<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NEXT LEVEL — Premium Ticketing</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&family=Bebas+Neue&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
    
    <link rel="stylesheet" href="/static/css/style.css" />

    <style>
        /* main.jsp 전용 추가 스타일 */
        :root {
            --ranking-num: rgba(255, 255, 255, 0.9);
        }

        /* 1. Hero Slider Area */
        .main-slider {
            position: relative;
            padding-top: 72px; /* 헤더 높이만큼 여백 */
            background: var(--text-dark);
        }
        .slide-item {
            height: 500px;
            background-size: cover;
            background-position: center;
            position: relative;
            display: flex;
            align-items: center;
            color: white;
        }
        .slide-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(90deg, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0) 60%);
        }
        .slide-content { position: relative; z-index: 2; }
        .hot-tag { background: #ff3e3e; color: white; padding: 4px 12px; border-radius: 4px; font-weight: 700; font-size: 0.8rem; margin-bottom: 15px; display: inline-block; }

        /* 2. Ranking Section */
        .ranking-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 20px;
            margin-top: 30px;
        }
        .ranking-card {
            position: relative;
            border-radius: var(--radius-md);
            overflow: hidden;
            transition: var(--transition);
        }
        .ranking-card:hover { transform: translateY(-10px); }
        .ranking-num {
            position: absolute;
            bottom: -10px;
            left: 10px;
            font-family: var(--font-display);
            font-size: 5rem;
            color: var(--ranking-num);
            font-style: italic;
            z-index: 2;
            line-height: 1;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
            pointer-events: none;
        }
        .ranking-img {
            width: 100%;
            height: 240px;
            object-fit: cover;
            border-radius: var(--radius-md);
        }

        /* 3. Today's Pick (가로 스크롤 가능 구조) */
        .scroll-container {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 20px 0;
            scrollbar-width: none;
        }
        .scroll-container::-webkit-scrollbar { display: none; }
        .pick-card { min-width: 280px; }

        /* 4. Notice Area */
        .notice-bar {
            background: var(--lightest);
            padding: 15px 24px;
            border-radius: var(--radius-sm);
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 40px;
        }
        .notice-label { font-weight: 700; color: var(--primary); flex-shrink: 0; }
        .notice-list { flex-grow: 1; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 0.9rem; }

        @media (max-width: 768px) {
            .ranking-grid { grid-template-columns: repeat(2, 1fr); }
            .slide-item { height: 350px; }
        }
    </style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <main>
        <section class="main-slider">
            <div class="slide-item" style="background-image: url('https://images.unsplash.com/photo-1540039155733-5bb30b53aa3d?auto=format&fit=crop&w=1200&q=80');">
                <div class="slide-overlay"></div>
                <div class="container slide-content" data-aos="fade-up">
                    <span class="hot-tag">HOT OPEN</span>
                    <h2 class="hero-headline">2026 WORLD TOUR<br><em>NEXT GENERATION</em></h2>
                    <p class="hero-sub">가장 완벽한 무대, 넥스트 레벨 단독 예매 오픈</p>
                    <a href="#" class="btn btn-white">자세히 보기</a>
                </div>
            </div>
        </section>

        <section id="categories" style="padding: 60px 0;">
            <div class="container">
                <div class="category-grid" data-aos="fade-up">
                    <a href="#" class="category-card">
                        <span class="cat-icon"><i class="fas fa-microphone-alt"></i></span>
                        <span class="cat-name">콘서트</span>
                    </a>
                    <a href="#" class="category-card">
                        <span class="cat-icon"><i class="fas fa-theater-masks"></i></span>
                        <span class="cat-name">뮤지컬</span>
                    </a>
                    <a href="#" class="category-card">
                        <span class="cat-icon"><i class="fas fa-film"></i></span>
                        <span class="cat-name">연극</span>
                    </a>
                    <a href="#" class="category-card">
                        <span class="cat-icon"><i class="fas fa-violin"></i></span>
                        <span class="cat-name">클래식</span>
                    </a>
                    <a href="#" class="category-card">
                        <span class="cat-icon"><i class="fas fa-palette"></i></span>
                        <span class="cat-name">전시</span>
                    </a>
                </div>
            </div>
        </section>

        <div class="container">
            <div class="notice-bar" data-aos="fade-up">
                <span class="notice-label"><i class="fas fa-bullhorn"></i> 공지사항</span>
                <div class="notice-list">
                    <a href="#">[안내] 2026 NEXT LEVEL 멤버십 혜택 개편 안내 (3월 1일부터)</a>
                </div>
                <i class="fas fa-chevron-right" style="color: var(--text-muted); font-size: 0.8rem;"></i>
            </div>

            <section style="margin-bottom: 80px;">
                <div class="popular-header">
                    <div data-aos="fade-right">
                        <h2 class="section-title">주간 랭킹</h2>
                        <p class="section-subtitle">지금 가장 사랑받는 공연 TOP 5</p>
                    </div>
                </div>
                
                <div class="ranking-grid">
                    <%-- 실제 구현 시: <c:forEach var="rank" items="${rankingList}" varStatus="status"> --%>
                    <div class="ranking-card" data-aos="fade-up" data-aos-delay="100">
                        <span class="ranking-num">1</span>
                        <img src="https://images.unsplash.com/photo-1514525253361-bee8a4874a3b?auto=format&fit=crop&w=400&q=80" class="ranking-img" alt="Rank 1">
                        <div class="show-body" style="background: white;">
                            <div class="show-name">서울 재즈 페스티벌 2026</div>
                            <div class="show-price">₩150,000</div>
                        </div>
                    </div>
                    <%-- 중략 (2위~5위 루프) --%>
                    <div class="ranking-card" data-aos="fade-up" data-aos-delay="200">
                        <span class="ranking-num">2</span>
                        <img src="https://images.unsplash.com/photo-1507676184212-d03ab07a01bf?auto=format&fit=crop&w=400&q=80" class="ranking-img" alt="Rank 2">
                        <div class="show-body" style="background: white;">
                            <div class="show-name">뮤지컬 <지킬앤하이드></div>
                            <div class="show-price">₩170,000</div>
                        </div>
                    </div>
                    <div class="ranking-card" data-aos="fade-up" data-aos-delay="300">
                        <span class="ranking-num">3</span>
                        <img src="https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=400&q=80" class="ranking-img" alt="Rank 3">
                        <div class="show-body" style="background: white;">
                            <div class="show-name">힙합 플레이야 2026</div>
                            <div class="show-price">₩110,000</div>
                        </div>
                    </div>
                    <div class="ranking-card" data-aos="fade-up" data-aos-delay="400">
                        <span class="ranking-num">4</span>
                        <img src="https://images.unsplash.com/photo-1501386761578-eac5c94b800a?auto=format&fit=crop&w=400&q=80" class="ranking-img" alt="Rank 4">
                        <div class="show-body" style="background: white;">
                            <div class="show-name">연극 <고도를 기다리며></div>
                            <div class="show-price">₩66,000</div>
                        </div>
                    </div>
                    <div class="ranking-card" data-aos="fade-up" data-aos-delay="500">
                        <span class="ranking-num">5</span>
                        <img src="https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=400&q=80" class="ranking-img" alt="Rank 5">
                        <div class="show-body" style="background: white;">
                            <div class="show-name">쇼팽 피아노 리사이틀</div>
                            <div class="show-price">₩120,000</div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="popular" style="padding: 0 0 100px 0;">
                <div class="popular-header">
                    <div data-aos="fade-right">
                        <h2 class="section-title">Today's Pick</h2>
                        <p class="section-subtitle">회원님만을 위한 맞춤형 공연 추천</p>
                    </div>
                </div>

                <div class="shows-grid">
                    <div class="show-card" data-aos="fade-up">
                        <div class="show-img" style="background: var(--primary);">
                            <i class="fas fa-ticket-alt" style="color: white; font-size: 3rem;"></i>
                            <div class="show-badge"><span class="badge badge-concert">추천</span></div>
                        </div>
                        <div class="show-body">
                            <div class="show-name">2026 싸이 흠뻑쇼 - 서울</div>
                            <div class="show-meta"><i class="fas fa-map-marker-alt"></i> 올림픽주경기장</div>
                            <div class="show-footer">
                                <div class="show-price">₩143,000</div>
                                <button class="btn-book">예매하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="show-card" data-aos="fade-up" data-aos-delay="100">
                        <div class="show-img" style="background: var(--accent);">
                            <i class="fas fa-music" style="color: white; font-size: 3rem;"></i>
                            <div class="show-badge"><span class="badge badge-musical">HOT</span></div>
                        </div>
                        <div class="show-body">
                            <div class="show-name">뮤지컬 <레미제라블> 내한</div>
                            <div class="show-meta"><i class="fas fa-map-marker-alt"></i> 블루스퀘어</div>
                            <div class="show-footer">
                                <div class="show-price">₩180,000</div>
                                <button class="btn-book">예매하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({ duration: 800, once: true });
        
        // 추가적인 슬라이더 로직이나 버튼 클릭 핸들러 작성
        document.querySelectorAll('.btn-book').forEach(btn => {
            btn.addEventListener('click', () => {
                location.href = '/ticket/reservation'; // 상세 페이지 이동 예시
            });
        });
    </script>
</body>
</html>