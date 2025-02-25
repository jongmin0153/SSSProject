<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- fn:split 사용 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리그 정보</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .leagueList-box {
            margin: 20px auto;
            max-width: 90%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .league-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 14px;
            color: #333;
        }

        .league-table th, .league-table td {
            border: 1px solid #ddd;
            padding: 10px 15px;
            text-align: left;
        }

        .league-table th {
            background-color: #002147;
            color: #ffffff;
            text-transform: uppercase;
            font-weight: bold;
        }

        .league-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .league-table tr:hover {
            background-color: #f0f8ff;
        }

        .league-table td {
            vertical-align: top;
        }

        .league-table td:last-child {
            line-height: 1.6;
        }

        h1 {
            text-align: center;
            color: #002147;
            margin-bottom: 20px;
        }

        footer {
            margin-top: 30px;
        }
        
        .league-item {
		    display: flex; /* 이미지와 텍스트를 가로로 정렬 */
		    align-items: center; /* 이미지와 텍스트를 세로 중앙 정렬 */
		    gap: 10px; /* 이미지와 텍스트 간의 간격 */
		}
		
		.small-img {
		    width: 50px; /* 이미지 너비 */
		    height: 50px; /* 이미지 높이 */
		    object-fit: contain; /* 이미지 비율 유지 */
		    border-radius: 5px; /* 이미지 모서리 둥글게 (선택 사항) */
		}
		
		.league-name {
		    font-weight: bold; /* 텍스트를 굵게 */
		    color: #333; /* 텍스트 색상 */
		    font-size: 14px; /* 텍스트 크기 */
		}
        
    </style>
</head>
<body>
    <div class="leagueList-box">
        <table class="league-table">
            <tr>
                <th>이름</th>
                <th>국가</th>
                <th>창설 년도</th>
                <th>역대 기록</th>
            </tr>
            <c:forEach var="league" items="${leagueList}">
            <tr>
                <td>
				    <div class="league-item">
				        <img alt="${league.leagueNa}" src="<c:choose>
				            <c:when test="${league.seq == 1}">images/league/premierleague.png</c:when>
				            <c:when test="${league.seq == 2}">images/league/laliga.jpg</c:when>
				            <c:when test="${league.seq == 3}">images/league/serieA.jpg</c:when>
				            <c:when test="${league.seq == 4}">images/league/bundesliga.png</c:when>
				        </c:choose>" class="small-img">
				        <span class="league-name">${league.leagueNa}</span>
				    </div>
				</td>
                <td>
                	<div class="league-item">
                		<img alt="${league.leagueCo}" src="<c:choose>
                			<c:when test="${league.seq == 1}">images/country/england.svg</c:when>
                			<c:when test="${league.seq == 2}">images/country/spain.png</c:when>
                			<c:when test="${league.seq == 3}">images/country/italy.png</c:when>
                			<c:when test="${league.seq == 4}">images/country/germany.svg</c:when>
                		</c:choose>" class="small-img">
                	</div>
                </td>
                <td>${league.leagueEs.substring(0, 10)}</td>
                <!-- leagueRec 수정 -->
                <td>
                    <c:forEach var="detail" items="${fn:split(league.leagueRec, ',')}">
                        ${detail}<br>
                    </c:forEach>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
    
    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</body>
</html>
