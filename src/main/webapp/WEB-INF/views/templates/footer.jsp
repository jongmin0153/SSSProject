<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <style>
        
        /* 기본 설정 */
		html, body {
		    margin: 0;
		    padding: 0;
		    height: 100%;
		}
		
		body {
		    display: flex;
		    flex-direction: column;
		    min-height: 100vh;
		}
		
		footer {
		    margin-top: auto; /* 콘텐츠 길이에 따라 유동적으로 아래로 이동 */
		    width: 100%;
		    background-color: #002147;
		    color: white;
		    padding: 10px 0;
		    font-size: 14px;
		    display: flex;
		    justify-content: space-around;
		    align-items: flex-start;
		    flex-wrap: wrap;
		}
		
		.footer-section {
		    flex: 1;
		    margin: 0 10px;
		    text-align: center;
		}
		
		.footer-section h4 {
		    margin-bottom: 8px;
		    font-size: 16px;
		    font-weight: bold;
		    color: #ffffff;
		}
		
		.footer-section ul {
		    list-style: none;
		    padding: 0;
		    margin: 0;
		    text-align: left;
		}
		
		.footer-section ul li {
		    margin: 5px 0;
		    position: relative;
		    padding-left: 20px;
		}
		
		footer ul li:before {
		    content: "▶";
		    position: absolute;
		    left: 0;
		    color: #ffffff;
		    font-size: 12px;
		}
		
		.footer-section ul li a {
		    color: #ffffff;
		    text-decoration: none;
		    font-size: 14px;
		    transition: color 0.3s;
		}
		
		.footer-section ul li a:hover {
		    color: #ffcc00;
		}
		
		.footer-bottom {
		    width: 100%;
		    text-align: center;
		    margin-top: 15px;
		    font-size: 12px;
		    color: #bbbbbb;
		}
		
		.footer-bottom span {
		    color: tomato;
		}
		
		.footer-bottom a {
		    color: #bbbbbb;
		    text-decoration: none;
		    font-weight: bold;
		}
		
		.footer-bottom a:hover {
		    color: #ffcc00;
		}
		
		hr {
		    border: 1px solid #FFFFFF;
		}

    </style>
</head>
<body>
    <footer>
	    <div class="footer-section">
	        <h4 style="text-align: left;">빠른 링크</h4>
	        <ul>
	            <li><a href="#">세계에서 가장 가치 있는 선수들</a></li>
	            <li><a href="#">최근 이적</a></li>
	            <li><a href="#">최근 소문</a></li>
	            <li><a href="#">최신 시장 가치 업데이트</a></li>
	            <li><a href="#">FIFA 세계 랭킹</a></li>
	            <li><a href="#">배팅</a></li>
	        </ul>
	    </div>
	    <div class="footer-section">
	        <h4 style="text-align: left;">참여하기</h4>
	        <ul>
	            <li><a href="#">모더레이터 & 데이터 스카우트</a></li>
	            <li><a href="#">모더레이터 또는 데이터스카우트로 지원하기</a></li>
	            <li><a href="#">11가지 규칙</a></li>
	            <li><a href="#">오류 신고</a></li>
	        </ul>
	    </div>
	    <div class="footer-section">
	        <h4 style="text-align: left;">소셜 미디어</h4>
	        <ul>
	            <li><a href="#">Instagram</a></li>
	            <li><a href="#">Facebook</a></li>
	            <li><a href="#">Twitter</a></li>
	            <li><a href="#">YouTube</a></li>
	            <li><a href="#">LinkedIn</a></li>
	        </ul>
	    </div>
	    <hr>
	    <div class="footer-bottom">
	        <p>© TRANSFERMARKT 2024</p>
	        <p>
	            <a href="#">법적 공지</a> | 
	            <a href="#">데이터 보호</a> | 
	            <a href="#">개인정보</a> | 
	            <a href="#">사이트 정책</a>
	        </p>
	        <p>J.M Choi_<span>SSSProject</span> <a href="#">copyright</a> &copy;</p>
	    </div>
	</footer>


</body>
</html>
