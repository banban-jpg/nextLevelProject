<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="concert-list-page" style="padding-top: 120px; padding-bottom: 100px;">
  <div class="container">

    <div class="popular-header" style="margin-bottom: 60px;">
      <div data-aos="fade-right">
        <h2 class="section-title">콘서트 리스트</h2>
        <p class="section-subtitle">현재 예매 가능한 모든 콘서트를 확인하세요.</p>
      </div>
    </div>

    <div class="concert-vertical-list">
      <c:choose>
        <c:when test="${empty concertList}">
          <div class="concert-list-item" data-aos="fade-up">
            <div class="item-content-box">
              <div class="item-main-info">
                <h3 class="show-name">등록된 콘서트가 없습니다.</h3>
              </div>
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach var="concert" items="${concertList}" varStatus="status">
            <div class="concert-list-item" data-aos="fade-up" data-aos-delay="${status.index * 100}">
              <div class="item-content-box">
                <div class="item-main-info">
                  <h3 class="show-name">${concert.title}</h3>
                  <div class="show-meta-list">
                    <span class="meta-item"><i class="fas fa-user"></i> ${concert.artistName}</span>
                    <span class="meta-item"><i class="fas fa-map-marker-alt"></i> ${concert.venueName}</span>
                    <c:if test="${not empty concert.bookingOpenAt}">
                      <span class="meta-item">
                        <i class="fas fa-calendar-alt"></i>
                        <fmt:formatDate value="${concert.bookingOpenAt}" pattern="yyyy.MM.dd HH:mm" />
                      </span>
                    </c:if>
                  </div>
                </div>

                <div class="item-side-info">
                  <a href="/concert/detail?id=${concert.concertId}" class="btn-book">예매하기</a>
                </div>
              </div>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
