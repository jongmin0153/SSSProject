<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%= request.getContextPath() %>/">
	<%@ include file="/WEB-INF/views/templates/header.jsp" %>
	<meta charset="UTF-8">
	<title>리그 구단 목록</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<link href="/api/star/star-rating.css" rel="stylesheet">
	<style>
		
	
		.team-container {
		    margin: 20px auto;
		    width: 90%;
		    max-width: 1200px;
		    text-align: center;
		    flex: 1;
		    margin-top: 8px;
		}
		
		.teamBox {
		    display: none; /* 기본적으로 숨김 */
		    grid-template-columns: repeat(auto-fit, minmax(100px, 1fr)); /* 반응형 컬럼 */
		    gap: 5px !important; /* 각 셀 간의 간격 */
		    margin-top: 5px !important;
		    padding: 5px !important;
		    border: 1px solid #ddd; /* 박스 테두리 */
		    background-color: #f9f9f9; /* 박스 배경색 */
		    border-radius: 8px;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 살짝 그림자 추가 */
			/* height: 20px; */
		}
		
		.cell {
		    background-color: #ffffff;
		    color: #000000;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    padding: 15px;
		    font-size: 14px;
		    border: 1px solid #ccc; /* 얇은 회색 테두리 */
		    border-radius: 8px;
		    transition: transform 0.2s ease; /* 호버 시 부드럽게 */
		}
		
		.cell:hover {
		    transform: scale(1.05); /* 셀을 살짝 키움 */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}
		
		.cell img {
		    max-width: 80px; /* 이미지 크기 조정 */
		    height: auto;
		    margin-bottom: 10px;
		}
		
		.cell span {
		    margin-top: 5px;
		    font-size: 14px;
		    font-weight: bold;
		}
		
		.premiumleague-teamBox, .laliga-teamBox, 
		.serie-teamBox, .bundesliga-teamBox {
		    padding: 20px;
		    text-align: center;
		    border-radius: 8px;
		    margin-bottom: 30px; /* 섹션 간 여백 추가 */
		}
		
		.premiumleague-teamBox {
		    background-color: #400080;
		    margin-bottom: 0px;
		}
		
		.laliga-teamBox {
		    background-color: #FFD700;
		    margin-bottom: 0px;
		}
		
		.serie-teamBox {
			background-color: #76c76b; /* 연한 초록색 */
			 margin-bottom: 0px;
		}
		.bundesliga-teamBox {
			background-color: #FF6666;
			 margin-bottom: 0px;
		}
		.premier-toggleButton, .laliga-toggleButton, 
		.serie-toggleButton, .bundesliga-toggleButton {
		    border: none;
		    padding: 10px 20px;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		    color: white;
		    margin: 15px auto; /* 버튼 간격 조정 */
		    display: block; /* 버튼을 한 줄 차지 */
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		    transition: background-color 0.3s ease, transform 0.2s ease;
		}
		
		.premier-toggleButton {
		    background-color: #400080;
		}
		
		.laliga-toggleButton {
		    background-color: #FFD700;
		}
		.serie-toggleButton {
			background-color: #76c76b;
		}
		.bundesliga-toggleButton {
			background-color: #FF6666;
		}
		.premier-toggleButton:hover {
		    background-color: #5500aa; /* 호버 시 색상 변경 */
		    transform: scale(1.05); /* 살짝 확대 */
		}
		
		.laliga-toggleButton:hover {
		    background-color: #FFC400; /* 호버 시 색상 변경 */
		    transform: scale(1.05); /* 살짝 확대 */
		}
		.serie-toggleButton:hover {
		    background-color: #5500aa; /* 호버 시 색상 변경 */
		    transform: scale(1.05); /* 살짝 확대 */
		}
		.bundesliga-toggleButton:hover {
		    background-color: #FF9999;
		    transform: scale(1.05); /* 살짝 확대 */
		}
		
		
	</style>
</head>
<body>
	<div class="team-container">
	    <div class="premiumleague-teamBox">
	        <h2 style="color: white;">Premier League</h2>
	        <h3 style="color: white;">2024-25 시즌 프리미어 리그 구단 목록</h3>
	        <button class="premier-toggleButton" onclick="toggleContent('premierBox')">
	            &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기
	        </button>
	        <div id="premierBox" class="teamBox">
	            <!-- 박스 내용 -->
	            <div class="cell">
	            	노팅엄 포레스트 FC
	            	<img src="images/team/team01.svg">
	            </div>
	            <div class="cell">
	            	뉴캐슬 유나이티드 FC
	            	<img src="images/team/team02.svg">
	            </div>
				<div class="cell">
					레스터 시티 FC
					<img src="images/team/team03.svg">
				</div>
				<div class="cell">
					리버풀 FC
					<img src="images/team/team04.svg">
				</div>
				<div class="cell">
					맨체스터 시티 FC
					<img src="images/team/team05.svg">
				</div>
				<div class="cell">
					맨체스터 유나이티드 FC
					<img src="images/team/team06.svg">
				</div>
	            <div class="cell">
	            	AFC 본머스
	            	<img src="images/team/team07.svg">
	            </div>
	            <div class="cell">
					브라이튼 앤 호브 알비온 FC
					<img src="images/team/team08.svg">
				</div>
				<div class="cell">
					브렌트포드 FC
					<img src="images/team/team09.svg">
				</div>
				<div class="cell">
					사우스햄튼 FC
					<img src="images/team/team10.svg">
				</div>
				<div class="cell">
					아스날 FC
					<img src="images/team/team11.svg">
				</div>
				<div class="cell">
					아스톤 빌라 FC
					<img src="images/team/team12.svg">
				</div>
				<div class="cell">
					에버튼 FC
					<img src="images/team/team13.svg">
				</div>
				<div class="cell">
					울버햄튼 원더러스 FC
					<img src="images/team/team14.svg">
				</div>				          
	            <div class="cell">
					웨스트햄 유나이티드 FC
					<img src="images/team/team15.svg">
				</div>
	            <div class="cell">
					입스위치 타운 FC
					<img src="images/team/team16.svg">
				</div>
	            <div class="cell">
					첼시 FC
					<img src="images/team/team17.svg">
				</div>
	            <div class="cell">
					토트넘 홋스퍼 FC
					<img src="images/team/team18.svg">
				</div>
	            <div class="cell">
					크리스탈 팰리스 FC
					<img src="images/team/team19.svg">
				</div>
	            <div class="cell">
					풀럼 FC
					<img src="images/team/team20.svg">
				</div>
	        </div>
	    </div>
	    
    <div class="laliga-teamBox">
        <h2 style="color: white;">Laliga</h2>
        <h3 style="color: white;">2024-25 시즌 라리가 구단 목록</h3>
        <button class="laliga-toggleButton" onclick="toggleContent('laligaBox')">
            &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기
        </button>
	    <div id="laligaBox" class="teamBox">
	            <!-- 박스 내용 -->
	            <div class="cell">
	            	UD 라스팔마스
	            	<img src="images/team/team21.svg">
	            </div>
	            <div class="cell">
	            	라요 바예카노
	            	<img src="images/team/team22.svg">
	            </div>
				<div class="cell">
					CD 레가네스
					<img src="images/team/team23.svg">
				</div>
				<div class="cell">
					레알 마드리드 CF
					<img src="images/team/team24.svg">
				</div>
				<div class="cell">
					RCD 마요르카
					<img src="images/team/team25.svg">
				</div>
				<div class="cell">
					FC 바르셀로나
					<img src="images/team/team26.svg">
				</div>
	            <div class="cell">
	            	레알 바야돌리드 CF
	            	<img src="images/team/team27.svg">
	            </div>
	            <div class="cell">
					발렌시아 CF
					<img src="images/team/team28.svg">
				</div>
				<div class="cell">
					레알 베티스 발롬피에
					<img src="images/team/team29.svg">
				</div>
				<div class="cell">
					비야레알 CF
					<img src="images/team/team30.svg">
				</div>
				<div class="cell">
					세비야 FC
					<img src="images/team/team31.svg">
				</div>
				<div class="cell">
					RC 셀타 데 비고
					<img src="images/team/team32.svg">
				</div>
				<div class="cell">
					레알 소시에다드
					<img src="images/team/team33.svg">
				</div>
				<div class="cell">
					아틀레티코 마드리드
					<img src="images/team/team34.svg">
				</div>				          
	            <div class="cell">
					아틀레틱 빌바오
					<img src="images/team/team35.svg">
				</div>
	            <div class="cell">
					데포르티보 알라베스
					<img src="images/team/team36.svg">
				</div>
	            <div class="cell">
					RCD 에스파뇰 바르셀로나
					<img src="images/team/team37.svg">
				</div>
	            <div class="cell">
					CA 오사수나
					<img src="images/team/team38.svg">
				</div>
	            <div class="cell">
					지로나 FC
					<img src="images/team/team39.svg">
				</div>
	            <div class="cell">
					헤타페 CF
					<img src="images/team/team40.svg">
				</div>
	        </div>
	    </div>
	    
	    
    <div class="serie-teamBox">
       <h2 style="color: white;">Serie A</h2>
       <h3 style="color: white;">2024-25 시즌 세리에 A 구단 목록</h3>
       <button class="serie-toggleButton" onclick="toggleContent('serieBox')">
           &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기
       </button>
   	   <div id="serieBox" class="teamBox">
	            <!-- 박스 내용 -->
	            <div class="cell">
	            	SSC 나폴리
	            	<img src="images/team/team41.svg">
	            </div>
	            <div class="cell">
	            	SS 라치오
	            	<img src="images/team/team42.svg">
	            </div>
				<div class="cell">
					US 레체
					<img src="images/team/team43.svg">
				</div>
				<div class="cell">
					AS 로마
					<img src="images/team/team44.svg">
				</div>
				<div class="cell">
					AC 몬차
					<img src="images/team/team45.svg">
				</div>
				<div class="cell">
					AC 밀란
					<img src="images/team/team46.svg">
				</div>
	            <div class="cell">
	            	베네치아 FC
	            	<img src="images/team/team47.svg">
	            </div>
	            <div class="cell">
					엘라스 베로나 FC
					<img src="images/team/team48.svg">
				</div>
				<div class="cell">
					볼로냐 FC 1909
					<img src="images/team/team49.svg">
				</div>
				<div class="cell">
					아탈란타 BC
					<img src="images/team/team50.svg">
				</div>
				<div class="cell">
					엠폴리 FC
					<img src="images/team/team51.svg">
				</div>
				<div class="cell">
					우디네세 칼초
					<img src="images/team/team52.svg">
				</div>
				<div class="cell">
					유벤투스 FC
					<img src="images/team/team53.svg">
				</div>
				<div class="cell">
					FC 인테르나치오날레 밀라노
					<img src="images/team/team54.svg">
				</div>				          
	            <div class="cell">
					제노아 CFC
					<img src="images/team/team55.svg">
				</div>
	            <div class="cell">
					칼리아리 칼초
					<img src="images/team/team56.svg">
				</div>
	            <div class="cell">
					코모 1907
					<img src="images/team/team57.svg">
				</div>
	            <div class="cell">
					토리노 FC
					<img src="images/team/team58.svg">
				</div>
	            <div class="cell">
					파르마 칼초 1913
					<img src="images/team/team59.svg">
				</div>
	            <div class="cell">
					ACF 피오렌티나
					<img src="images/team/team60.svg">
				</div>
	        </div>
	    </div>
	    
	   
	    
	    <div class="bundesliga-teamBox">
        <h2 style="color: white;">Bundesliga</h2>
        <h3 style="color: white;">2024-25 시즌 분데스리가 구단 목록</h3>
        <button class="bundesliga-toggleButton" onclick="toggleContent('bundesligaBox')">
            &nbsp;&nbsp;&nbsp;&nbsp;펼치기 · 접기
        </button>
	    <div id="bundesligaBox" class="teamBox">
	            <!-- 박스 내용 -->
	            <div class="cell">
	            	보루시아 도르트문트
	            	<img src="images/team/team61.svg">
	            </div>
	            <div class="cell">
	            	RB 라이프치히
	            	<img src="images/team/team62.svg">
	            </div>
				<div class="cell">
					바이어 04 레버쿠젠
					<img src="images/team/team63.svg">
				</div>
				<div class="cell">
					FSV 마인츠 05
					<img src="images/team/team64.svg">
				</div>
				<div class="cell">
					보루시아 묀헨글라트바흐
					<img src="images/team/team65.svg">
				</div>
				<div class="cell">
					FC 바이에른 뮌헨
					<img src="images/team/team66.svg">
				</div>
	            <div class="cell">
	            	SV 베르더 브레멘
	            	<img src="images/team/team67.svg">
	            </div>
	            <div class="cell">
					VfL 보훔
					<img src="images/team/team68.svg">
				</div>
				<div class="cell">
					VfL 볼프스부르크
					<img src="images/team/team69.svg">
				</div>
				<div class="cell">
					VfB 슈투트가르트
					<img src="images/team/team70.svg">
				</div>
				<div class="cell">
					FC 아우크스부르크
					<img src="images/team/team71.svg">
				</div>
				<div class="cell">
					우니온 베를린
					<img src="images/team/team72.svg">
				</div>
				<div class="cell">
					FC St.파울리
					<img src="images/team/team73.svg">
				</div>
				<div class="cell">
					홀슈타인 킬
					<img src="images/team/team74.svg">
				</div>				          
	            <div class="cell">
					SC 프라이부르크
					<img src="images/team/team75.svg">
				</div>
	            <div class="cell">
					아인트라흐트 프랑크푸르트
					<img src="images/team/team76.svg">
				</div>
	            <div class="cell">
					FC 하이덴하임 1846
					<img src="images/team/team77.svg">
				</div>
	            <div class="cell">
					TSG 1899 호펜하임
					<img src="images/team/team78.svg">
				</div>
	        </div>
	    </div>
	    
	    
	</div> 

	<%@ include file="/WEB-INF/views/templates/footer.jsp" %>

	<script>
		// 상태 추적 객체
		const boxStates = {
		    premierBox: false, // 프리미어 리그
		    laligaBox: false   // 라리가
		};

		function toggleContent(contentId) {
		    const content = document.getElementById(contentId);
		    if (!content) {
		        console.error(`Element with id '${contentId}' not found.`);
		        return;
		    }

		    // 현재 상태에 따라 열기/닫기
		    const isVisible = boxStates[contentId];
		    content.style.display = isVisible ? "none" : "grid";
		    boxStates[contentId] = !isVisible;
		}
	</script>
</body>
</html>
