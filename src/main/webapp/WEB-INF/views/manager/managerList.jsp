<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<link href="/api/star/star-rating.css" rel="stylesheet">
	<style>
		.manager-container {
		    margin: 20px auto;
		    width: 90%;
		}
		
		.manager-box {
		    margin-bottom: 20px;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		    overflow: hidden;
		}
		
		.manager-content {
		    display: none; /* 기본적으로 접힌 상태 */
		    flex-wrap: wrap; /* 줄바꿈 허용 */
		    justify-content: space-around; /* 카드 간격 균등 배치 */
		    gap: 20px; /* 카드 간 간격 */
		    padding: 10px; /* 내부 여백 */
		}
		
		.manager-card {
		    flex: 0 0 calc(33.33% - 20px); /* 한 줄에 3개씩 배치 */
		    box-sizing: border-box; /* 패딩 포함 크기 계산 */
		    margin: 10px 0; /* 상하 간격 추가 */
		    background-color: white;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
		    text-align: center;
		    padding: 10px;
		}


		
		.manager-photo {
		    flex: 0 0 50px; /* 사진 영역 너비 줄임 */
		    margin-right: 10px; /* 오른쪽 여백 줄임 */
		}
		
		.manager-photo img {
		    width: 50px; /* 사진 크기 줄임 */
		    height: 50px;
		    border-radius: 50%;
		    object-fit: cover; /* 이미지 비율 유지 */
		}
		
		.manager-info {
		    flex: 1; /* 나머지 공간 차지 */
		    font-size: 12px; /* 글자 크기 줄임 */
		    line-height: 1.4; /* 줄 간격 조정 */
		    color: #333;
		    text-align: left; /* 왼쪽 정렬 */
		}

		.premier-toggleButton {
		    background-color: #400080; /* 보라색 배경 */
		    color: white; /* 텍스트 하얀색 */
		    border: none; /* 테두리 제거 */
		    padding: 5px 10px; /* 버튼 내부 여백 */
		    border-radius: 4px; /* 버튼 모서리를 둥글게 */
		    cursor: pointer; /* 마우스 커서를 클릭 모양으로 설정 */
		    font-size: 16px; /* 글자 크기 */
		    outline: none; /* 버튼 선택 시 외곽선 제거 */
		    -webkit-appearance: none; /* 브라우저 기본 스타일 제거 */
		    -moz-appearance: none; /* 브라우저 기본 스타일 제거 (Firefox) */
		    appearance: none; /* 모든 브라우저에서 기본 스타일 제거 */
		}
		
		.premier-toggleButton:hover {
		    background-color: #6a0dad; /* 호버 시 더 밝은 보라색 */
		}
		.laliga-manager {
		    background-color: #FFD700; /* 진한 노란색 */
		    color: white; /* 텍스트 하얀색 */
		    padding: 10px;
		    text-align: center;
		    border-radius: 8px 8px 0 0; /* 위쪽 둥근 모서리 */
		}
		
		.laliga-toggleButton {
		    background-color: #FFD700; /* 버튼 배경 노란색 */
		    color: white; /* 텍스트 하얀색 */
		    border: none;
		    padding: 5px 10px;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		}
		
		.laliga-toggleButton:hover {
		    background-color: #FFC107; /* 호버 시 더 밝은 노란색 */
		}
			
		.serie-manager {
		    background-color: #76c76b; /* 연한 초록색 */
		    color: white; /* 텍스트 하얀색 */
		    padding: 10px;
		    text-align: center;
		    border-radius: 8px 8px 0 0; /* 위쪽 둥근 모서리 */
		}
		
		.serie-toggleButton {
		    background-color: #76c76b;   /* 버튼 배경 연한 초록색 */
		    color: white; /* 텍스트 하얀색 */
		    border: none;
		    padding: 5px 10px;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		    transition: background-color 0.3s ease; /* 부드러운 호버 효과 */
		}
		
		.serie-toggleButton:hover {
		    background-color: #90EE90; /* 호버 시 더 진한 초록색 */
		}
		.bundes-manager {
		    background-color: #FF6666; /* 연한 빨강색 */
		    color: white; /* 텍스트 하얀색 */
		    padding: 10px;
		    text-align: center;
		    border-radius: 8px 8px 0 0; /* 위쪽 둥근 모서리 */
		}
		
		.bundes-toggleButton {
		    background-color: #FF6666; /* 버튼 배경 연한 빨강색 */
		    color: white; /* 텍스트 하얀색 */
		    border: none;
		    padding: 5px 10px;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 16px;
		    transition: background-color 0.3s ease; /* 부드러운 호버 효과 */
		}
		
		.bundes-toggleButton:hover {
		    background-color: #FF9999; /* 호버 시 더 진한 빨강색 */
		}

	</style>
</head>
<body>
	
	
	<div class="manager-container">
	    <div class="manager-box">
	        <div class="premierLeague-manager" style="background-color: #400080; 
	        color: white; padding: 10px; text-align: center; border-radius: 8px 8px 0 0;">
	            <h2 style="color: white;">Premier League</h2>
	            <h3 style="color: white;">2024-25 시즌 프리미어 리그 구단별 감독</h3>
	            <button class="premier-toggleButton" onclick="toggleContent('premierContent')"> &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기 </button>
	        </div>
	        <div class="manager-content" id="premierContent">
	            <c:forEach var="manager" items="${managerList}">
	            	<c:if test="${manager.seq >= 1 && manager.seq <= 20}">
	                <div class="manager-card">
	                    <div class="manager-photo">
	                       <%-- <img src="/images/manager/${manager.seq}.jpg" alt="${manager.manNa} 사진"/> --%>
	                    </div>
	                    <div class="manager-info">
	                        <p><strong>이&nbsp;&nbsp;&nbsp;름:</strong> ${manager.manNa}</p>
	                        <p><strong>국&nbsp;&nbsp;&nbsp;적:</strong> ${manager.manCon}</p>
	                        <p><strong>출&nbsp;&nbsp;&nbsp;생:</strong> ${manager.manBir.split(" ")[0]}</p>
	                        <p><strong>소속팀:</strong> ${manager.teamNa}</p> 
	                        <p><strong>스타일:</strong> ${manager.manSty}</p>
	                    </div>
	                </div>
	                </c:if>
	            </c:forEach>
	        </div>
	        
	        <div class="laliga-manager">
	            <h2 style="color: white;">Laliga</h2>
	            <h3 style="color: white;">2024-25 시즌 라리가 구단별 감독</h3>
	            <button class="laliga-toggleButton" onclick="toggleContent('laligaContent')"> &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기 </button>
	        </div>
	        <div class="manager-content" id="laligaContent">
	            <c:forEach var="manager" items="${managerList}">
	            	<c:if test="${manager.seq >= 21 && manager.seq <= 40}">
	                <div class="manager-card">
	                    <div class="manager-photo">
	                        <%-- <img src="/images/manager/${manager.seq}.jpg" alt="${manager.manNa} 사진"/> --%>
	                    </div>
	                    <div class="manager-info">
	                        <p><strong>이&nbsp;&nbsp;&nbsp;름:</strong> ${manager.manNa}</p>
	                        <p><strong>국&nbsp;&nbsp;&nbsp;적:</strong> ${manager.manCon}</p>
	                        <p><strong>출&nbsp;&nbsp;&nbsp;생:</strong> ${manager.manBir.split(" ")[0]}</p>
	                        <p><strong>소속팀:</strong> ${manager.teamNa}</p>
	                        <p><strong>스타일:</strong> ${manager.manSty}</p>
	                    </div>
	                </div>
	                </c:if>
	            </c:forEach>
	        </div>
	        
	        <div class="serie-manager">
	            <h2 style="color: white;">Serie A</h2>
	            <h3 style="color: white;">2024-25 시즌 세리에 A 구단별 감독</h3>
	            <button class="serie-toggleButton" onclick="toggleContent('serieContent')"> &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기 </button>
	        </div>
	        <div class="manager-content" id="serieContent">
	            <c:forEach var="manager" items="${managerList}">
	            	<c:if test="${manager.seq >= 41 && manager.seq <= 60}">
	                <div class="manager-card">
	                    <div class="manager-photo">
	                       <%-- <img src="/images/manager/${manager.seq}.jpg" alt="${manager.manNa} 사진"/> --%>
	                    </div>
	                    <div class="manager-info">
	                        <p><strong>이&nbsp;&nbsp;&nbsp;름:</strong> ${manager.manNa}</p>
	                        <p><strong>국&nbsp;&nbsp;&nbsp;적:</strong> ${manager.manCon}</p>
	                        <p><strong>출&nbsp;&nbsp;&nbsp;생:</strong> ${manager.manBir.split(" ")[0]}</p>
	                        <p><strong>소속팀:</strong> ${manager.teamNa}</p>
	                        <p><strong>스타일:</strong> ${manager.manSty}</p>
	                    </div>
	                </div>
	                </c:if>
	            </c:forEach>
	        </div>
	        
	        <div class="bundes-manager" >
	            <h2 style="color: white;">Bundesliga</h2>
	            <h3 style="color: white;">2024-25 시즌 분데스리가 구단별 감독</h3>
	            <button class="bundes-toggleButton" onclick="toggleContent('bundesContent')"> &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기 </button>
	        </div>
	        <div class="manager-content" id="bundesContent">
	            <c:forEach var="manager" items="${managerList}">
	            	<c:if test="${manager.seq >= 61 && manager.seq <= 78}">
	                <div class="manager-card">
	                    <div class="manager-photo">
	                        <%-- <img src="/images/manager/${manager.seq}.jpg" alt="${manager.manNa} 사진"/> --%>
	                    </div>
	                    <div class="manager-info">
	                        <p><strong>이&nbsp;&nbsp;&nbsp;름:</strong> ${manager.manNa}</p>
	                        <p><strong>국&nbsp;&nbsp;&nbsp;적:</strong> ${manager.manCon}</p>
	                        <p><strong>출&nbsp;&nbsp;&nbsp;생:</strong> ${manager.manBir.split(" ")[0]}</p>
	                        <p><strong>소속팀:</strong> ${manager.teamNa}</p>
	                        <p><strong>스타일:</strong> ${manager.manSty}</p>
	                    </div>
	                </div>
	                </c:if>
	            </c:forEach>
	        </div>
	        
	    </div>
	</div>
  

	
	
	<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="/api/star/star-rating.js"></script>
	
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		function toggleContent(contentId) {
		    const content = document.getElementById(contentId);
		    if (content.style.display === "none" || content.style.display === "") {
		        content.style.display = "flex"; // 펼쳐질 때 flex로 표시
		    } else {
		        content.style.display = "none"; // 접힐 때 none으로 표시
		    }
		}



	
	</script>
</body>
</html>





