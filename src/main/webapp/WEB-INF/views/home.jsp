<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getContextPath() %>/">
    <%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <meta charset="UTF-8">
    <title>축구 스카우팅 시스템</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
    <link href="/api/star/star-rating.css" rel="stylesheet">
    <style>
        body {
            font-family: '맑은 고딕', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.8;
        }
        .main-content {
            padding: 30px;
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .headline {
            font-size: 32px;
            color: #444;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
            border-bottom: 4px solid #ffa500;
            padding-bottom: 10px;
        }
        .article {
            margin-bottom: 25px;
            padding: 20px;
            background-color: #fff;
            border-left: 6px solid #ffa500;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .article:hover {
            transform: translateX(10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .article-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #444;
        }
        .article-content {
            font-size: 16px;
            color: #666;
        }
        .article-content span {
            font-weight: bold;
            color: #ffa500;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
            border-top: 3px solid #ffa500;
        }
    </style>
</head>
<body>

    <div class="main-content">
        <div class="headline">⚽ 축구 스카우팅 시스템</div>
        
        <div class="article">
            <div class="article-title">리그</div>
            <div class="article-content">세계의 주요 <span>리그</span>와 순위를 탐색하세요. 팀들의 최근 성적과 포인트를 한눈에 확인할 수 있습니다.</div>
        </div>

        <div class="article">
            <div class="article-title">팀</div>
            <div class="article-content">각 <span>팀</span>의 역사를 포함하여 현재 스쿼드, 감독, 그리고 주요 성적 정보를 제공합니다.</div>
        </div>

        <div class="article">
            <div class="article-title">선수</div>
            <div class="article-content">최고의 <span>선수</span>들을 분석하고 그들의 기록, 능력치 및 최근 활약상을 확인하세요.</div>
        </div>

        <div class="article">
            <div class="article-title">감독</div>
            <div class="article-content">축구계의 명장들과 그들의 <span>지도력</span>, 경력, 그리고 주요 성과를 알아보세요.</div>
        </div>

        <div class="article">
            <div class="article-title">수상</div>
            <div class="article-content">축구 역사에서 가장 권위 있는 <span>수상</span>과 이를 수상한 선수와 팀을 확인하세요.</div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/templates/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="/api/star/star-rating.js"></script>
</body>
</html>
