<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <meta charset="UTF-8">
    <title>리그별 수상자</title>
    <style>
        .league-box {
            width: 80%;
            margin: 20px auto;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .league-title {
            font-size: 22px;
            font-weight: bold;
            padding: 10px;
            background-color: #e0e0e0;
            border-radius: 6px;
        }
        .award-container {
            display: none; /* 처음엔 숨김 */
            padding: 10px;
            transition: max-height 0.4s ease-out;
        }
        .award {
            display: flex;
            align-items: center;
            margin: 10px 0;
            padding: 10px;
            border-radius: 6px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
		.award img {
		    width: 60px; /* 기존 40px -> 60px */
		    height: 60px; /* 기존 40px -> 60px */
		    border-radius: 50%; /* 원형 유지 */
		    margin-right: 10px;
		    object-fit: cover; /* 이미지 비율 유지 */
		}
        .award-text {
            font-size: 18px;
        }
    </style>
</head>
<body>
	<h2>2023-2024시즌 수상</h2>

    <!-- 프리미어리그 -->
    <div class="league-box" onclick="toggleBox(this)">
        <div class="league-title">Premier League</div>
        <div class="award-container">
        	<div class="award">
        		<img alt="" src="images/players/Erling Haaland.jpg">
            	<div class="award-text">득점왕: Erling Haaland(엘링 홀란드) - 맨체스터 시티 FC</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Ollie Watkins.jpg">
            	<div class="award-text">도움왕: Ollie Watkins(올리 왓킨슨) - 아스톤 빌라 FC</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Phil Foden.jpg">
            	<div class="award-text">올해의 선수: Phil Foden(필 포든) - 맨체스터 시티 FC</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Pep Guardiola.jpg">
            	<div class="award-text">올해의 감독: Pep Guardiola(펩 과르디올라) - 맨체스터 시티 FC</div>
            </div>
        </div>
    </div>

    <!-- 라리가 -->
    <div class="league-box" onclick="toggleBox(this)">
        <div class="league-title">Laliga</div>
        <div class="award-container">
        	<div class="award">
        		<img alt="" src="images/players/Artem Dovbyk.jpg">
            	<div class="award-text">득점왕: Artem Dovbyk(아르템 도우비크) - 지로나 FC</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Álex Baena.jpg">
            	<div class="award-text">도움왕: Álex Baena(알렉스 바에나) - 비야레알 CF</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Jude Bellingham.jpg">
            	<div class="award-text">올해의 선수: Jude Bellingham(주드 벨링엄) - 레알 마드리드 CF</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Míchel Sánchez.jpg">
            	<div class="award-text">올해의 감독: Míchel Sánchez(미첼 산체스) - 지로나 FC</div>
            </div>
        </div>
    </div>


    <!-- 분데스리가 -->
    <div class="league-box" onclick="toggleBox(this)">
        <div class="league-title">Serie A</div>
        <div class="award-container">
        	<div class="award">
        		<img alt="" src="images/players/Lautaro Martínez.jpg">
            	<div class="award-text">득점왕: Lautaro Martínez(라우타로 마르티네스) - FC 인터밀란</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Paulo Dybala.jpg">
            	<div class="award-text">도움왕: Paulo Dybala(파울로 디발라) - AS 로마</div>
            	<hr>
            	<img alt="" src="images/players/Rafael Leão.jpg">
            	<div class="award-text">도움왕: Rafael Leão(하파엘 레앙) - AC 밀란</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Lautaro Martínez.jpg">
            	<div class="award-text">올해의 선수: Lautaro Martínez(라우타로 마르티네스) - FC 인터밀란</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Simone Inzaghi.jpg">
            	<div class="award-text">올해의 감독: Simone Inzaghi(시모네 인자기) - FC 인터밀란</div>
            </div>
        </div>
    </div>


    <!-- 세리에 A -->
    <div class="league-box" onclick="toggleBox(this)">
        <div class="league-title">Bundesliga</div>
        <div class="award-container">
        	<div class="award">
        		<img alt="" src="images/players/Harry Kane.jpg">
            	<div class="award-text">득점왕: Harry Kane(해리 케인) - FC 바이에른 뮌헨</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Alejandro Grimaldo.jpg">
            	<div class="award-text">도움왕: Alejandro Grimaldo(알레한드로 그리말도) - 바이어 04 레버쿠젠</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Florian Wirtz.jpg">
            	<div class="award-text">올해의 선수: Florian Wirtz(플로리안 비르츠) - 바이어 04 레버쿠젠</div>
            </div>
            <div class="award">
            	<img alt="" src="images/players/Xabi Alonso.jpg">
            	<div class="award-text">올해의 감독: Xabi Alonso(샤비 알론소) - 바이어 04 레버쿠젠</div>
            </div>
        </div>
    </div>


<%@ include file="/WEB-INF/views/templates/footer.jsp" %>

<script>
    function toggleBox(element) {
        var container = element.querySelector('.award-container');

        // 현재 display 상태에 따라 보이게/숨기게 변경
        if (container.style.display === "none" || container.style.display === "") {
            container.style.display = "block";
        } else {
            container.style.display = "none";
        }
    }
</script>

</body>
</html>
