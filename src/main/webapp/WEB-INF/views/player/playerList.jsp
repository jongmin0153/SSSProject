<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Player Information</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        /* 프로필과 포지션 맵 컨테이너 */
        .profile-container {
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: stretch; /* 모든 아이템의 높이를 동일하게 설정 */
            margin: 20px auto;
            max-width: 900px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 선수 프로필 */
        .player-profile {
            flex: 1;
            margin-right: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* 내부 내용 간격 균일하게 배치 */
            min-height: 450px; /* 포지션 맵과 동일한 높이 설정 */
        }
        .player-profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            display: block;
            margin: 0 auto 20px auto;
        }
        .player-profile table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .player-profile th, .player-profile td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .player-profile th {
            background-color: #f2f2f2;
        }
        .player-profile h2 {
            text-align: center;
        }

        /* 포지션 맵 컨테이너 */
        .position-map-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 450px; /* 프로필과 동일한 높이 설정 */
        }

        /* 포지션 맵 */
        .position-map {
            position: relative;
            width: 300px;
            height: 450px;
            background-image: url('/images/field.png'); /* 축구 필드 배경 이미지 */
            background-size: cover;
            background-position: center;
            border: 2px solid #ddd;
            border-radius: 10px;
        }

        /* 기본 포지션 마커 */
        .position-marker {
            position: absolute;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            border-radius: 50%;
            background-color: #ddd; /* 기본 회색 */
            color: black;
            font-size: 12px;
            font-weight: bold;
            transform: translate(-50%, -50%);
        }

        /* 주 포지션 강조 */
        .position-marker.active-main {
            background-color: #32cd32; /* 밝은 초록색 */
            width: 60px;
            height: 60px;
            line-height: 60px;
            font-size: 14px;
            border: 2px solid white;
        }

        /* 부 포지션 강조 */
        .position-marker.active-sub {
            background-color: #90ee90; /* 연한 초록색 */
            width: 30px;
            height: 30px;
            line-height: 30px;
            font-size: 10px;
            border: 1px solid white;
        }

        /* 포지션별 위치 설정 */
        .position-marker.cf { top: 8%; left: 50%; } /* CF */
        .position-marker.ss { top: 15%; left: 50%; } /* SS */
        .position-marker.lw { top: 15%; left: 20%; } /* LW */
        .position-marker.rw { top: 15%; left: 80%; } /* RW */
        .position-marker.am { top: 30%; left: 50%; } /* AM */
        .position-marker.lm { top: 42%; left: 25%; } /* LM */
        .position-marker.rm { top: 42%; left: 75%; } /* RM */
        .position-marker.cm { top: 50%; left: 50%; } /* CM */
        .position-marker.dm { top: 62%; left: 50%; } /* DM */
        .position-marker.cb-left { top: 75%; left: 40%; } /* CB Left */
        .position-marker.cb-right { top: 75%; left: 60%; } /* CB Right */
        .position-marker.rb { top: 75%; left: 80%; } /* RB */
        .position-marker.lb { top: 75%; left: 20%; } /* LB */
        .position-marker.gk { top: 90%; left: 50%; } /* GK */

    </style>
</head>
<body>

    <!-- 단일 선수의 상세 정보 표시 -->
    <c:if test="${players.size() == 1}">
        <div class="profile-container">
            <!-- 선수 프로필 -->
            <div class="player-profile">
                <img src="/playerImage?name=${players[0].playerNa}" alt="${players[0].playerNa}">
                <h2>${players[0].playerNa}</h2>
                <table>
                    <tr><th>팀</th><td>${players[0].teamNa}</td></tr>
                    <tr><th>포지션 역할</th><td>${players[0].positionCate}</td></tr>
                    <tr><th>등번호</th><td>${players[0].playerNu}</td></tr>
                    <tr><th>국적</th><td>${players[0].playerCon}</td></tr>
                    <tr><th>신장</th><td>${players[0].playerHe} cm</td></tr>
                    <tr><th>주발</th><td>${players[0].playerPreFoot}</td></tr>
                    <tr><th>출생</th><td>${fn:substring(players[0].playerBir, 0, 10)}</td></tr>
                    <tr><th>주 포지션</th><td>${players[0].playerPos}</td></tr>
                    <tr><th>부 포지션</th><td>${players[0].playerMinPos}</td></tr>
                </table>
            </div>

            <!-- 포지션 맵 -->
            <div class="position-map-container">
                <div class="position-map">
                    <!-- 기본 모든 포지션 표시 -->
                    <div class="position-marker cf">CF</div>
                    <div class="position-marker ss">SS</div>
                    <div class="position-marker lw">LW</div>
                    <div class="position-marker rw">RW</div>
                    <div class="position-marker am">AM</div>
                    <div class="position-marker lm">LM</div>
                    <div class="position-marker rm">RM</div>
                    <div class="position-marker cm">CM</div>
                    <div class="position-marker dm">DM</div>
                    <div class="position-marker cb-left">CB</div>
                    <div class="position-marker cb-right">CB</div>
                    <div class="position-marker rb">RB</div>
                    <div class="position-marker lb">LB</div>
                    <div class="position-marker gk">GK</div>

                    <!-- 주 포지션 강조 -->
                    <c:choose>
                        <c:when test="${players[0].playerPos eq 'CB'}">
                            <div class="position-marker cb-left active-main">CB</div>
                            <div class="position-marker cb-right active-main">CB</div>
                        </c:when>
                        <c:when test="${players[0].playerPos eq 'DM'}">
                            <div class="position-marker dm active-main">DM</div>
                        </c:when>
                        <c:otherwise>
                            <div class="position-marker ${players[0].playerPos.toLowerCase()} active-main">${players[0].playerPos}</div>
                        </c:otherwise>
                    </c:choose>

                    <!-- 부 포지션 강조 -->
                    <c:forEach var="minPos" items="${fn:split(players[0].playerMinPos, ',')}">
                        <c:choose>
                            <c:when test="${fn:trim(minPos) eq 'CB'}">
                                <div class="position-marker cb-left active-sub">CB</div>
                                <div class="position-marker cb-right active-sub">CB</div>
                            </c:when>
                            <c:otherwise>
                                <div class="position-marker ${fn:trim(minPos).toLowerCase()} active-sub">${fn:trim(minPos)}</div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:if>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
