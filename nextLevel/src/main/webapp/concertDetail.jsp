<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
    .detail-container {
        padding: 160px 0 100px;
        max-width: 1000px;
        margin: 0 auto;
    }
    .detail-top-section {
        display: flex;
        gap: 50px;
        margin-bottom: 80px;
    }
    .poster-area {
        width: 380px;
        flex-shrink: 0;
    }
    .poster-img {
        width: 100%;
        border-radius: 12px;
        box-shadow: var(--shadow-lg);
    }
    .poster-placeholder {
        width: 100%;
        aspect-ratio: 3 / 4;
        border-radius: 12px;
        background: var(--lightest);
        border: 1px solid #e7ebf3;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--text-muted);
        font-weight: 700;
    }
    .info-area {
        flex-grow: 1;
    }
    .detail-title {
        font-size: 2.4rem;
        font-weight: 900;
        color: var(--text-dark);
        margin-bottom: 24px;
        line-height: 1.2;
    }
    .info-table {
        width: 100%;
        border-top: 2px solid var(--text-dark);
        margin-bottom: 30px;
    }
    .info-row {
        display: flex;
        padding: 16px 0;
        border-bottom: 1px solid #eee;
        font-size: 1rem;
    }
    .info-label {
        width: 120px;
        font-weight: 700;
        color: var(--text-muted);
    }
    .info-value {
        color: var(--text-dark);
    }
    .booking-btn-large {
        width: 100%;
        padding: 20px;
        background: var(--text-dark);
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1.2rem;
        font-weight: 700;
        cursor: pointer;
        transition: var(--transition);
    }
    .booking-btn-large:hover:not(:disabled) {
        background: var(--primary);
        box-shadow: var(--shadow-md);
    }
    .booking-btn-large:disabled {
        background: #ccc;
        cursor: not-allowed;
    }
    
    .detail-bottom-section {
        border-top: 1px solid #ddd;
        padding-top: 50px;
    }
    .section-label {
        font-size: 1.4rem;
        font-weight: 800;
        color: var(--text-dark);
        margin-bottom: 20px;
        display: block;
    }
    .content-box {
        background: white;
        padding: 30px;
        border-radius: 12px;
        line-height: 1.8;
        color: var(--text-mid);
        margin-bottom: 40px;
        border: 1px solid #f0f3fa;
    }
    .notice-box {
        background: #fff8f8;
        padding: 24px;
        border-radius: 12px;
        border-left: 4px solid #ff4d4d;
        color: #d63031;
        font-size: 0.95rem;
    }

    @media (max-width: 768px) {
        .detail-top-section { flex-direction: column; align-items: center; }
        .poster-area { width: 100%; max-width: 320px; }
    }
</style>

<div class="container detail-container">
    <div class="detail-top-section" data-aos="fade-up">
        <div class="poster-area">
            <c:choose>
                <c:when test="${not empty concert.posterUrl}">
                    <img src="${concert.posterUrl}" alt="${concert.title}" class="poster-img">
                </c:when>
                <c:otherwise>
                    <div class="poster-placeholder">NO POSTER</div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="info-area">
            <h1 class="detail-title">${concert.title}</h1>
            
            <div class="info-table">
                <div class="info-row">
                    <span class="info-label">장소</span>
                    <span class="info-value">${concert.location}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">공연기간</span>
                    <span class="info-value">
                        <c:choose>
                            <c:when test="${not empty concert.sessions}">
                                ${concert.sessions[0].startTime.substring(0, 10)}
                                <c:if test="${concert.sessions.size() > 1}">
                                    ~ ${concert.sessions[concert.sessions.size()-1].startTime.substring(0, 10)}
                                    (${concert.sessions.size()}회차)
                                </c:if>
                            </c:when>
                            <c:otherwise>TBD</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="info-row">
                    <span class="info-label">티켓오픈</span>
                    <span class="info-value" style="color: var(--primary); font-weight: 700;">${concert.bookingDate}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">아티스트</span>
                    <span class="info-value">${concert.artistName}</span>
                </div>
                <c:if test="${not empty concert.genre}">
                    <div class="info-row">
                        <span class="info-label">장르</span>
                        <span class="info-value">${concert.genre}</span>
                    </div>
                </c:if>
            </div>
            
            <button class="booking-btn-large" ${concert.bookingStatus eq 'OPEN' ? '' : 'disabled'}
                    onclick="window.open('/ticketing?concertId=${concert.id}', 'ticketing', 'width=1250,height=850,location=no,status=no,scrollbars=yes');">
                <c:choose>
                    <c:when test="${concert.bookingStatus eq 'PREPARING'}">예매 준비 중</c:when>
                    <c:when test="${concert.bookingStatus eq 'CLOSED'}">예매 마감</c:when>
                    <c:otherwise>예매하기</c:otherwise>
                </c:choose>
            </button>
        </div>
    </div>
    
    <div class="detail-bottom-section" data-aos="fade-up">
        <span class="section-label">공연 일정</span>
        <div class="content-box">
            <ul style="list-style: none; padding: 0; margin: 0;">
                <c:forEach var="session" items="${concert.sessions}" varStatus="status">
                    <li style="padding: 10px 0; border-bottom: ${status.last ? 'none' : '1px solid #f0f3fa'}; display: flex; align-items: center;">
                        <span style="background: var(--primary); color: white; padding: 2px 10px; border-radius: 4px; font-size: 0.8rem; margin-right: 15px; font-weight: 700;">${status.count}회차</span>
                        <span style="font-weight: 600; color: var(--text-dark);">${session.startTime}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
        
        <span class="section-label">공연 상세 정보</span>
        <div class="content-box">
            ${concert.description}
        </div>
        
        <c:if test="${not empty concert.ticketNotice}">
            <span class="section-label">예매 안내 및 유의사항</span>
            <div class="notice-box">
                <i class="fas fa-exclamation-circle"></i> ${concert.ticketNotice}
            </div>
        </c:if>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
