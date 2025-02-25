<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전술 및 감독 정보</title>
    <style>
        .tab { cursor: pointer; padding: 10px; background-color: #f0f0f0; display: inline-block; }
        .tab:hover { background-color: #ddd; }
        .tab-content { display: none; }
        .active { background-color: #4CAF50; color: white; }
        .tab-content.active { display: block; }
    </style>
</head>
<body>

<h1>전술 정보</h1>
<div>
    <div class="tab" onclick="showTactic('three-back', 1)">3백</div>
    <div class="tab" onclick="showTactic('four-back', 5)">4백</div>
    <div class="tab" onclick="showTactic('five-back', 13)">5백</div>
</div>

<!-- 전술 내용 -->
<div id="three-back" class="tab-content">
    <h3>3백 전술</h3>
    <c:forEach var="staticData" items="${tacticsList}">
        <c:if test="${staticData.seq >= 1 && staticData.seq <= 4}">
            <p>${staticData.formation}: ${staticData.formInf}</p>
            <p>장점: ${staticData.formPros}</p>
            <p>단점: ${staticData.formCons}</p>
        </c:if>
    </c:forEach>
</div>

<div id="four-back" class="tab-content">
    <h3>4백 전술</h3>
    <c:forEach var="staticData" items="${tacticsList}">
        <c:if test="${staticData.seq >= 5 && staticData.seq <= 12}">
            <p>${staticData.formation}: ${staticData.formInf}</p>
            <p>장점: ${staticData.formPros}</p>
            <p>단점: ${staticData.formCons}</p>
        </c:if>
    </c:forEach>
</div>

<div id="five-back" class="tab-content">
    <h3>5백 전술</h3>
    <c:forEach var="staticData" items="${tacticsList}">
        <c:if test="${staticData.seq == 13 || staticData.seq == 14}">
            <p>${staticData.formation}: ${staticData.formInf}</p>
            <p>장점: ${staticData.formPros}</p>
            <p>단점: ${staticData.formCons}</p>
        </c:if>
    </c:forEach>
</div>

<!-- 감독 정보 (선택한 전술의 감독만 표시) -->
<h1>감독 정보</h1>
<div id="manager-list">
    <c:forEach var="manager" items="${managersList}">
        <p>이름: ${manager.manNa}</p>
        <p>생년월일: ${manager.manBir}</p>
        <p>국적: ${manager.manCon}</p>
    </c:forEach>
</div>

<%@ include file="/WEB-INF/views/templates/footer.jsp" %>

<script>
    function showTactic(id, tacticSeq) {
        // 모든 전술 콘텐츠 숨기기
        var contents = document.querySelectorAll('.tab-content');
        contents.forEach(function(content) {
            content.classList.remove('active');
        });

        // 선택한 전술 콘텐츠 표시
        document.getElementById(id).classList.add('active');

        // 해당 전술을 사용하는 감독 리스트 요청 (AJAX)
        fetch('/staticList?tacticSeq=' + tacticSeq)
            .then(response => {
                if (!response.ok) {
                    throw new Error("HTTP 오류: " + response.status);
                }
                return response.json(); // JSON 응답으로 변환
            })
            .then(data => {
                let managerListHtml = "";
                if (data.length > 0) {
                    data.forEach(manager => {
                        managerListHtml += `
                            <p>이름: ${manager.manNa}</p>
                            <p>생년월일: ${manager.manBir}</p>
                            <p>국적: ${manager.manCon}</p>
                            <hr>
                        `;
                    });
                } else {
                    managerListHtml = "<p>해당 전술을 사용하는 감독 정보가 없습니다.</p>";
                }
                document.getElementById("manager-list").innerHTML = managerListHtml;
            })
            .catch(error => {
                console.error('감독 정보를 불러오지 못했습니다:', error);
                document.getElementById("manager-list").innerHTML = "<p>감독 정보를 가져오는 중 오류가 발생했습니다.</p>";
            });
    }
</script>

</body>
</html>
