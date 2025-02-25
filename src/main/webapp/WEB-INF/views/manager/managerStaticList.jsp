<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전술 및 감독 정보</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* 탭 스타일 */
        .tab-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .tab {
            cursor: pointer;
            padding: 12px 18px;
            background-color: #e0e0e0;
            display: inline-block;
            border-radius: 20px;
            margin: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .tab:hover {
            background-color: #c8c8c8;
        }

        .active {
            background-color: #ffd700;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .formation-buttons {
            display: none;
            margin-top: 10px;
            text-align: center;
        }

        .formation-buttons.active {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: center;
        }

        /* 포메이션 선택 버튼 스타일 */
        .formation-option {
            cursor: pointer;
            padding: 10px 15px;
            background-color: #f0f0f0;
            border-radius: 20px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .formation-option:hover {
            background-color: #ddd;
        }

        /* 전술 정보 스타일 */
        #tactic-info {
            background-color: #fffbe5;
            color: #333;
            padding: 20px;
            border-radius: 10px;
            max-width: 900px;
            margin: 20px auto;
            text-align: left;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
            border: 1px solid #ddd;
        }

        #tactic-info h3 {
            text-align: center;
            margin-bottom: 15px;
            color: #222;
            font-size: 22px;
        }

        /* 장점/단점 스타일 */
        .tactic-details {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .tactic-section {
            width: 48%;
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .tactic-section h4 {
            text-align: center;
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        .tactic-section ul {
            padding-left: 0;
            list-style-type: none;
        }

        .tactic-section li {
            font-size: 16px;
        }

        /* 감독 정보 스타일 */
        .manager-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .manager-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            width: 250px;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.15);
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .manager-card:hover {
            transform: translateY(-5px);
            box-shadow: 4px 6px 15px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<h1>전술 정보</h1>

<!-- 전술 선택 버튼 -->
<div class="tab-container">
    <div class="tab" onclick="showFormationButtons('three-back', 'formations-three-back')">3백</div>
    <div class="tab" onclick="showFormationButtons('four-back', 'formations-four-back')">4백</div>
    <div class="tab" onclick="showFormationButtons('five-back', 'formations-five-back')">5백</div>
</div>

<!-- 포메이션 버튼 -->
<div id="formations-three-back" class="formation-buttons">
    <div class="formation-option" onclick="loadTacticData('343')">343</div>
    <div class="formation-option" onclick="loadTacticData('3331')">3331</div>
    <div class="formation-option" onclick="loadTacticData('352')">352</div>
    <div class="formation-option" onclick="loadTacticData('3241')">3241</div>
</div>

<div id="formations-four-back" class="formation-buttons">
    <div class="formation-option" onclick="loadTacticData('433')">433</div>
    <div class="formation-option" onclick="loadTacticData('442')">442</div>
</div>

<div id="formations-five-back" class="formation-buttons">
    <div class="formation-option" onclick="loadTacticData('532')">532</div>
    <div class="formation-option" onclick="loadTacticData('541')">541</div>
</div>

<!-- 전술 정보 -->
<c:if test="${not empty managerList}">
    <div id="tactic-info" class="tab-content active">
        <p style="text-align: center; font-size: 20px; font-weight: bold;">
		    <strong>포메이션:</strong> ${managerList[0][1]}
		</p>
        <p><strong>설명:</strong> ${managerList[0][2]}</p>

        <div class="tactic-details">
		    <div class="tactic-section">
		        <h4>장점</h4>
		        <ul>
		            <c:forEach var="adv" items="${fn:split(managerList[0][3], '.')}" varStatus="status">
		                <c:if test="${not empty adv}">
		                    <li>${adv}</li>
		                </c:if>
		            </c:forEach>
		        </ul>
		    </div>
		
		    <div class="tactic-section">
		        <h4>단점</h4>
		        <ul>
		            <c:forEach var="disadv" items="${fn:split(managerList[0][4], '.')}" varStatus="status">
		                <c:if test="${not empty disadv}">
		                    <li>${disadv}</li>
		                </c:if>
		            </c:forEach>
		        </ul>
		    </div>
		</div>
    </div>
</c:if>

<h1>감독 정보</h1>
<div class="manager-container">
    <c:forEach var="manager" items="${managerList}">
        <div class="manager-card">
            <h3>${manager[5]}</h3>
            <p><strong>국적:</strong> ${manager[7]}</p>
            <p><strong>생년월일:</strong> ${fn:substring(manager[6], 0, 10)}</p>
        </div>
    </c:forEach>
</div>

<%@ include file="/WEB-INF/views/templates/footer.jsp" %>

<script>
function showFormationButtons(tabId, formationId) {
    document.querySelectorAll('.formation-buttons').forEach(el => el.classList.remove('active'));
    document.getElementById(formationId).classList.add('active');
}

function loadTacticData(formation) {
    window.location.href = "/sss/managerStaticList?formation=" + formation;
}
</script>

</body>
</html>
