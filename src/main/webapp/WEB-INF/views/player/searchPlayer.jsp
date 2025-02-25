<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<link href="/api/star/star-rating.css" rel="stylesheet">
	<style>
		body {
		    font-family: Arial, sans-serif;
		    background-color: #f4f4f4;
		}
		
		.search-container {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-top: 50px;
		}
		
		.search-form {
		    background: white;
		    padding: 15px 20px;
		    border-radius: 10px;
		    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
		    display: flex;
		    align-items: center;
		}
		
		.search-form input[type="text"] {
		    padding: 10px;
		    width: 250px;
		    border: 2px solid #ddd;
		    border-radius: 5px;
		    font-size: 16px;
		    outline: none;
		    transition: all 0.3s ease-in-out;
		}
		
		.search-form input[type="text"]:focus {
		    border-color: #007BFF;
		    box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
		}
		
		.search-form button {
		    background: #007BFF;
		    color: white;
		    border: none;
		    padding: 10px 15px;
		    border-radius: 5px;
		    margin-left: 10px;
		    font-size: 16px;
		    cursor: pointer;
		    transition: background 0.3s ease-in-out;
		}
		
		.search-form button:hover {
		    background: #0056b3;
		}
		
		.error {
		    color: red;
		    text-align: center;
		    margin-top: 15px;
		}

		.container {
		    width: 90%;
		    margin: 0 auto;
		    background: white;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
		}

		h1 {
		    color: #333;
		    margin-bottom: 20px;
		}

		.grid-container {
		    display: grid;
		    grid-template-columns: repeat(2, 1fr);
		    gap: 30px;
		    width: 100%;
		    max-width: 1000px;
		    margin: 0 auto;
		}

		.grid-item {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: center;
		    padding: 30px;
		    background: white;
		    border-radius: 10px;
		    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
		    text-align: center;
		    position: relative;
		}

		.grid-item img {
		    width: 250px;
		    height: 250px;
		    border-radius: 15px;
		    object-fit: cover;
		    transition: transform 0.3s ease-in-out;
		}

		.grid-item:hover img {
		    transform: scale(1.1);
		}

		.player-name {
		    font-size: 20px;
		    font-weight: bold;
		    color: #333;
		    margin-top: 10px;
		}

		/* 지그재그 형태 배치 */
		.grid-item:nth-child(odd) {
		    align-self: flex-start;
		}

		.grid-item:nth-child(even) {
		    align-self: flex-end;
		}

	</style>
</head>
<body>

    <!-- 검색 폼 -->
	<%
	    String contextPath = request.getContextPath();
	%>
	<div class="search-container">
	    <form class="search-form" action="<%= contextPath %>/searchPlayer" method="get">
	        <label for="playerNa"></label>
	        <input type="text" id="playerNa" name="playerNa" placeholder="Enter player name">
	        <button type="submit">검색</button>
	    </form>
	</div>



    <!-- 에러 메시지 -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    
        <div class="container">

        <div class="grid-container">
            <!-- 왼쪽 상단 (윙어) -->
            <div class="grid-item">
                <img src="images/players/winger.jpg" alt="Winger">
                <p>비니시우스 주니오르</p>
                <p>Vinícius Júnior</p>
            </div>

            <!-- 오른쪽 상단 (미드필더) -->
            <div class="grid-item">
                <img src="images/players/midfielder.jpg" alt="Midfielder">
                <p>로드리</p>
                <p>Rodri</p>
            </div>

            <!-- 왼쪽 하단 (수비수) -->
            <div class="grid-item">
                <img src="images/players/defender.jpg" alt="Defender">
                <p>버질 반 다이크</p>
                <p>Virgil van Dijk</p>
            </div>

            <!-- 오른쪽 하단 (골키퍼) -->
            <div class="grid-item">
                <img src="images/players/goalkeeper.jpg" alt="Goalkeeper">
                <p>티보 쿠르투아</p>
                <p>Thibaut Courtois</p>
            </div>
        </div>
    </div>
    
    
	<%@ include file="/WEB-INF/views/templates/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="/api/star/star-rating.js"></script>
	
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	

	
	</script>
</body>
</html>





