<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${pageTitle}</title>
    <base href="<%= request.getContextPath() %>/">
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <link href="/api/star/star-rating.css" rel="stylesheet">
    <style>
        /* 전체 스타일 */
        .header-template {
            border: 1px solid #000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 100px;
            position: relative;
        }

        .sss-logo {
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		    justify-content: center;
		    background: linear-gradient(135deg, #1e3a8a, #3b82f6); /* 배경 색상 유지 */
		    padding: 8px; /* 패딩 줄임 */
		    border-radius: 12px;
		    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
		    gap: 3px; /* 항목 간의 간격 줄임 */
		    max-width: 100px; /* 최대 크기 줄임 */
		}
		
		.logo-item {
		    display: flex;
		    align-items: center;
		    font-family: 'Poppins', Arial, sans-serif; /* 폰트 유지 */
		    font-weight: bold;
		    font-size: 14px; /* 글꼴 크기 줄임 */
		    color: #ffffff;
		}
		
		.letter {
		    color: #ff9800; /* 강조된 첫 글자 색상 유지 */
		    font-size: 18px; /* 강조된 글자의 크기 줄임 */
		    margin-right: 4px;
		    text-shadow: 1px 1px 3px rgba(255, 152, 0, 0.7); /* 텍스트 그림자 유지 */
		}
		
		.text {
		    color: #ffffff;
		    text-transform: capitalize; /* 단어 첫 글자 대문자 유지 */
		    font-size: 12px; /* 텍스트 크기 줄임 */
		    letter-spacing: 0.5px; /* 간격 조정 */
		    transition: transform 0.3s ease-in-out;
		}
		
		.logo-item:hover .text {
		    transform: translateX(3px); /* 호버 시 이동 거리 줄임 */
		}
		
		.sss-logo:hover {
		    background: linear-gradient(135deg, #3b82f6, #1e3a8a); /* 호버 시 배경색 전환 유지 */
		}

        .sss-inputBox {
            display: flex;
            align-items: center;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .search-box {
            border: 1px solid #000;
        }
		
		.sss-favorites button {
		    background: none; /* 버튼 배경 제거 */
		    border: none; /* 버튼 테두리 제거 */
		    padding: 0; /* 내부 여백 제거 */
		    cursor: pointer;
		    width: 60px; /* 버튼 크기 */
		    height: 60px;
		    border-radius: 50%; /* 둥근 버튼 모양 */
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 버튼 그림자 효과 */
		    overflow: hidden; /* 버튼 영역 밖 잘라냄 */
		    position: relative; /* 자식 요소 위치 기준 */
		}
		
		.sss-favorites button:hover {
		    transform: scale(1.1); /* 호버 시 버튼 확대 */
		    transition: transform 0.2s ease;
		}
		
		.sss-favorites .star-icon {
		    position: absolute; /* 별 아이콘을 절대 위치로 조정 */
		    top: 50%; /* 버튼 세로 중앙 */
		    left: 50%; /* 버튼 가로 중앙 */
		    transform: translate(-50%, -50%); /* 중앙 정렬 */
		    pointer-events: none; /* 마우스 이벤트 차단 */
		}
		
		.sss-favorites .star-icon img {
		    width: 24px; /* 별 이미지 크기 */
		    height: 24px;
		    -webkit-user-drag: none; /* 이미지 드래그 방지 */
		    user-select: none; /* 텍스트 선택 방지 */
		}


        .header-menuBar {
		    background-color: #002147; /* 네비게이션 바 배경색 */
		    padding: 10px 20px;
		    display: flex;
		    align-items: center;
		    justify-content: center; /* 중앙 정렬 */
		}
		
		.headerMenu {
		    display: flex;
		    align-items: center;
		    justify-content: space-between; /* 양쪽 정렬 */
		    width: 100%;
		}
		
		.headerMenu-list {
		    display: flex; /* Flexbox를 사용 */
		    justify-content: space-evenly; /* 각 항목을 균등하게 배치 */
		    align-items: center; /* 수직 중앙 정렬 */
		    list-style: none; /* 기본 리스트 스타일 제거 */
		    padding: 0;
		    margin: 0;
		    width: 100%; /* 부모의 전체 너비 사용 */
		    gap: 10px; /* 요소 간 간격 */
		}
		
		.headerMenu-list li {
		    text-align: center; /* 텍스트 중앙 정렬 */
		    flex: 0; /* 아이템 간 고정 크기 */
		}
		
		.headerMenu-list li a {
		    color: white; /* 텍스트 색상 */
		    text-decoration: none; /* 밑줄 제거 */
		    font-weight: bold; /* 굵은 텍스트 */
		    font-size: 16px; /* 텍스트 크기 */
		    padding: 5px 10px; /* 내부 여백 */
		    border-radius: 5px; /* 둥근 모서리 */
		}
		
		.headerMenu-list li a:hover {
		    color: #1e90ff; /* 호버 시 강조 색상 */
		    background-color: #001f3f; /* 호버 시 배경색 */
		}
		
		.headerMenu-toggle {
		    display: none; /* 기본적으로 숨김 */
		    flex-direction: column;
		    cursor: pointer;
		    gap: 5px;
		}
		
		.headerMenu-toggle span {
		    display: block;
		    width: 25px;
		    height: 3px;
		    background-color: white;
		    transition: transform 0.3s ease;
		}
		
		@media screen and (max-width: 768px) {
		    .headerMenu-list {
		        display: none;
		        flex-direction: column;
		        gap: 10px;
		        background-color: #002147;
		        position: absolute;
		        top: 50px;
		        right: 20px;
		        width: 200px;
		        border-radius: 5px;
		        padding: 10px;
		    }
		
		    .headerMenu-list.open {
		        display: flex;
		    }
		
		    .headerMenu-toggle {
		        display: flex;
		    }
		
		    .headerMenu-list li a {
		        font-size: 12px; /* 작은 화면에서는 더 작은 글씨 */
		    }
		}
		
		/* 드롭다운 메뉴 스타일링 */
		.dropdown {
		  position: relative;
		}
		
		.dropdown-menu {
		  display: none; /* 기본적으로 숨김 */
		  position: absolute;
		  top: 100%; /* 부모 메뉴 바로 아래에 위치 */
		  left: 0;
		  background-color: white; /* 배경 색상 */
		  list-style: none;
		  padding: 0;
		  margin: 0;
		  border: 1px solid #ccc;
		}
		
		.dropdown-menu li {
		  padding: 5px 10px;
		}
		
		.dropdown-menu li a {
		  text-decoration: none;
		  color: black;
		}
		
		.dropdown:hover .dropdown-menu {
		  display: block; /* 호버 시 표시 */
		}
		

    </style>
</head>
<body>
    <div class="header-template">
		<a href="/sss/home">	    	
	        <div class="sss-logo">
			    <div class="logo-item">
			        <span class="letter">S</span><span class="text">occer</span>
			    </div>
			    <div class="logo-item">
			        <span class="letter">S</span><span class="text">couting</span>
			    </div>
			    <div class="logo-item">
			        <span class="letter">S</span><span class="text">ystem</span>
			    </div>
			</div>
		</a>
        <div class="sss-inputBox">
            <input type="text" class="search-box" placeholder="Search...">
            <button class="search-button">검색</button>
        </div>
        <div class="sss-favorites">
		    <button>
		        <span class="star-icon">
		            <img src="images/fonts/star.png" alt="즐겨찾기">
		        </span>
		    </button>
		</div>
    </div>

    <div class="header-menuBar">
        <nav class="headerMenu">
            <ul class="headerMenu-list">
                <li><a href="/sss/leagueList">League</a></li>
	            <li><a href="/sss/teamList">Team</a></li>
	            <li><a href="/sss/managerList">Manager</a></li>
	            <li><a href="/sss/searchPlayer">Player</a></li>
				<li><a href="/sss/managerStaticList">Static</a></li>
	            <li><a href="/sss/position">Position</a></li>
	            <li><a href="/sss/award">Award</a></li>
            </ul>
            <div class="headerMenu-toggle">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </nav>
    </div>

    <script>
        const menuToggle = document.querySelector('.headerMenu-toggle');
        const menu = document.querySelector('.headerMenu-list');

        menuToggle.addEventListener('click', () => {
            menu.classList.toggle('open');
        });
    </script>
    <script src="/api/star/star-rating.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
</body>
</html>
