<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <meta charset="UTF-8">
    <title>포지션 선택</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .selection-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
            color: #555;
        }

        select {
            width: 45%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: white;
        }

        .position-info {
            background: #fdfdfd;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 10px;
            font-size: 15px;
            color: #555;
        }

        .player-table-container {
            max-height: 400px;
            overflow-y: auto;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: white;
            padding: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #007bff;
            color: cornflowerblue;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #d6e9ff;
            transition: 0.3s;
        }

        .no-data {
            text-align: center;
            color: #888;
            padding: 20px;
            font-size: 16px;
        }
    </style>
    <script>
        function updateRoles() {
            var positionSelect = document.getElementById("positionSelect");
            var roleSelect = document.getElementById("roleSelect");
            var selectedPosition = positionSelect.value;

            // 모든 옵션 숨기기
            var options = roleSelect.options;
            for (var i = 1; i < options.length; i++) { // 첫 번째(기본값) 제외
                options[i].style.display = "none";
            }

            // 선택한 포지션에 맞는 역할만 표시
            <c:forEach var="role" items="${positionRoles}">
                if ("${role.positionNa}" === selectedPosition) {
                    for (var i = 1; i < options.length; i++) {
                        if (options[i].value === "${role.positionCate}") {
                            options[i].style.display = "block";
                        }
                    }
                }
            </c:forEach>

            // 첫 번째 표시된 옵션을 기본값으로 설정
            roleSelect.selectedIndex = 0;
        }

        function fetchPlayers() {
            var position = document.getElementById("positionSelect").value;
            var role = document.getElementById("roleSelect").value;

            if (position && role) {
                location.href = "position?position=" + position + "&role=" + role;
            }
        }
    </script>
</head>
<body>

	

    <div class="container">
        <h1>포지션 및 역할 선택</h1>

        <!-- 포지션 및 역할 선택 -->
        <div class="selection-box">
            <div>
                <label for="positionSelect">포지션:</label>
                <select id="positionSelect" onchange="updateRoles(); fetchPlayers();">
                    <option value="">-- 포지션 선택 --</option>
                    <c:forEach var="role" items="${positionRoles}">
                        <option value="${role.positionNa}" ${param.position == role.positionNa ? 'selected' : ''}>${role.positionNa}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label for="roleSelect">포지션 유형:</label>
                <select id="roleSelect" onchange="fetchPlayers()">
                    <option value="">-- 역할 선택 --</option>
                    <c:forEach var="role" items="${positionRoles}">
                        <option value="${role.positionCate}" ${param.role == role.positionCate ? 'selected' : ''} data-position="${role.positionNa}">${role.positionCate}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- 포지션 설명 -->
        <c:if test="${not empty positionRole.positionInf}">
            <div class="position-info">
                <strong>포지션 설명:</strong> ${positionRole.positionInf}
            </div>
        </c:if>

        <h2>선수 목록</h2>

        <div class="player-table-container">
            <c:choose>
                <c:when test="${not empty positionRole.players}">
                    <table>
                        <tr>
                            <th>등번호</th>
                            <th>이름</th>
                            <th>국적</th>
                            <th>키</th>
                            <th>주발</th>
                            <th>생년월일</th>
                            <th>소속팀</th>
                        </tr>
                        <c:forEach var="player" items="${positionRole.players}">
                            <tr>
                                <td>${empty player.playerNu ? '-' : player.playerNu}</td>
                                <td>${player.playerNa}</td>
                                <td>${player.playerCon}</td>
                                <td>${empty player.playerHe ? '-' : player.playerHe}</td>
                                <td>${empty player.playerPreFoot ? '-' : player.playerPreFoot}</td>
                                <td>${empty player.playerBir ? '-' : player.playerBir.substring(0,10)}</td>
                                <td>${player.teamNa}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="no-data">⚠️ 해당 포지션 유형의 선수가 없습니다.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
</body>
</html>
