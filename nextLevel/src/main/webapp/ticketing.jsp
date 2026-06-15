<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>티켓 예매 - ${concertTitle}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #8e44ad;
            --secondary: #2ecc71;
            --danger: #e74c3c;
            --dark: #2c3e50;
            --light: #ecf0f1;
            --unavailable: #dcdde1;
            --available: #8e44ad;
        }
        body {
            font-family: 'Pretendard', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7f6;
            color: var(--dark);
        }
        .header {
            background: var(--dark);
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            gap: 20px;
            padding: 0 20px;
        }
        .seat-map-section {
            flex: 2;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
        }
        .info-section {
            flex: 1;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .screen {
            width: 80%;
            height: 10px;
            background: #ddd;
            margin: 0 auto 50px;
            border-radius: 0 0 50% 50%;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            position: relative;
        }
        .screen::after {
            content: 'STAGE';
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 0.8rem;
            color: #999;
            font-weight: 700;
        }
        .stage-sections {
            display: flex;
            flex-direction: column;
            gap: 30px;
            align-items: center;
        }
        .section-group {
            border: 1px solid #eee;
            padding: 15px;
            border-radius: 8px;
            position: relative;
        }
        .section-label {
            position: absolute;
            top: -10px;
            left: 10px;
            background: white;
            padding: 0 5px;
            font-size: 0.75rem;
            font-weight: 700;
            color: var(--primary);
        }
        .seat-grid {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            gap: 8px;
        }
        .seat {
            width: 24px;
            height: 24px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.6rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.2s;
        }
        .seat.available {
            background: var(--available);
            color: white;
            border-color: var(--available);
        }
        .seat.available:hover {
            background: #9b59b6;
            border-color: #9b59b6;
        }
        .seat.sold, .seat.locked {
            background: var(--unavailable);
            cursor: not-allowed;
            color: #999;
            border-color: #ccc;
        }
        .seat.selected {
            background: var(--secondary) !important;
            color: white;
            border-color: var(--secondary);
        }

        .session-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .session-item {
            padding: 15px;
            border: 1px solid #eee;
            margin-bottom: 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s;
        }
        .session-item:hover {
            border-color: var(--primary);
        }
        .session-item.active {
            border-color: var(--primary);
            background: #f0f7ff;
            font-weight: 700;
        }

        .legend {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background: #fafafa;
            border-radius: 8px;
            font-size: 0.85rem;
        }
        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .dot {
            width: 12px;
            height: 12px;
            border-radius: 2px;
            border: 1px solid #ddd;
        }
        
        .btn-booking {
            width: 100%;
            padding: 15px;
            background: var(--dark);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            font-size: 1rem;
        }
        .btn-booking:hover {
            background: var(--primary);
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>${concertTitle}</h1>
        <p style="margin-top: 10px; opacity: 0.8; font-weight: 500;">
            <i class="fas fa-map-marker-alt"></i> ${venueName}
        </p>
    </div>

    <div class="container">
        <!-- Seat Map -->
        <div class="seat-map-section">
            <div class="screen"></div>
            
            <div class="stage-sections">
                <c:forEach var="sectionName" items="${['A', 'B', 'C']}">
                    <div class="section-group">
                        <span class="section-label">SECTION ${sectionName}</span>
                        <div class="seat-grid">
                            <c:forEach var="seat" items="${seats}">
                                <c:if test="${seat.section eq sectionName}">
                                    <div class="seat ${seat.status.toLowerCase()}" 
                                         data-id="${seat.seatId}" 
                                         title="${seat.section}-${seat.seatNo}">
                                        ${seat.seatNo}
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Info & Sessions -->
        <div class="info-section">
            <h3>날짜 선택</h3>
            <ul class="session-list">
                <c:forEach var="session" items="${sessions}">
                    <li class="session-item ${session.sessionId eq selectedSessionId ? 'active' : ''}"
                        onclick="location.href='/ticketing?concertId=${concertId}&sessionId=${session.sessionId}'">
                        <i class="far fa-calendar-alt"></i> ${session.startTime}
                    </li>
                </c:forEach>
            </ul>

            <div class="legend">
                <div class="legend-item"><div class="dot" style="background: var(--available);"></div> 선택가능</div>
                <div class="legend-item"><div class="dot" style="background: var(--unavailable);"></div> 매진 / 점유중</div>
            </div>

            <div id="selected-info" style="padding: 20px; background: #f8f9fa; border-radius: 8px; display: none;">
                <p style="margin: 0; font-size: 0.9rem; color: #666;">선택한 좌석</p>
                <p id="seat-display" style="font-size: 1.2rem; font-weight: 700; margin: 5px 0 0; color: var(--primary);"></p>
            </div>

            <button class="btn-booking" id="booking-btn" disabled>좌석을 선택해주세요</button>
        </div>
    </div>

    <script>
        let selectedSeatId = null;

        document.querySelectorAll('.seat.available').forEach(seat => {
            seat.addEventListener('click', function() {
                const isSelected = this.classList.contains('selected');
                document.querySelectorAll('.seat.selected').forEach(s => s.classList.remove('selected'));
                
                if(!isSelected) {
                    this.classList.add('selected');
                    selectedSeatId = this.getAttribute('data-id');
                    document.getElementById('selected-info').style.display = 'block';
                    document.getElementById('seat-display').innerText = this.title;
                    document.getElementById('booking-btn').innerText = this.title + ' 예매하기';
                    document.getElementById('booking-btn').disabled = false;
                } else {
                    selectedSeatId = null;
                    document.getElementById('selected-info').style.display = 'none';
                    document.getElementById('booking-btn').innerText = '좌석을 선택해주세요';
                    document.getElementById('booking-btn').disabled = true;
                }
            });
        });

        document.getElementById('booking-btn').addEventListener('click', function() {
            if (!selectedSeatId) return;

            const params = new URLSearchParams();
            params.append('sessionId', '${selectedSessionId}');
            params.append('seatId', selectedSeatId);

            fetch('/ticketing', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params
            })
            .then(response => {
                if (response.status === 200) {
                    alert('좌석이 선택되었습니다.');
                    location.reload();
                } else if (response.status === 409) {
                    alert('이미 선택된 좌석입니다.');
                    location.reload();
                } else if (response.status === 403) {
                    alert('1인당 1좌석만 예매 가능합니다.');
                    location.reload();
                } else if (response.status === 401) {
                    alert('로그인이 필요합니다.');
                } else {
                    alert('예매 처리 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('네트워크 오류가 발생했습니다.');
            });
        });
    </script>
</body>
</html>
