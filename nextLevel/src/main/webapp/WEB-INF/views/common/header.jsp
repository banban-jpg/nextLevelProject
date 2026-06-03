<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <a href="${pageContext.request.contextPath}/index" class="logo">
        <span class="logo-main">NEXT LEVEL</span>
        <span class="logo-sub">넥스트 레벨</span>
      </a>
      <nav>
        <ul>
          <li><a href="${pageContext.request.contextPath}/index">홈</a></li>
          <li><a href="${pageContext.request.contextPath}/shows/list">공연</a></li>
          <li><a href="${pageContext.request.contextPath}/ticket/confirm">예매확인</a></li>
          
          <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
              <li class="nav-welcome"><span><i class="fas fa-user-circle"></i> ${sessionScope.loginUser.name}님</span></li>
              <li><a href="${pageContext.request.contextPath}/logout" class="nav-cta" style="background: #ff4757 !important;">로그아웃</a></li>
            </c:when>
            <c:otherwise>
              <li><a href="${pageContext.request.contextPath}/login" class="nav-cta">로그인 / 회원가입</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </nav>
    </div>
  </header>