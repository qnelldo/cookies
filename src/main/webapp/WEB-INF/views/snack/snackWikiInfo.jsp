<%--
  Created by IntelliJ IDEA.
  User: 고물오빠
  Date: 2023-08-16
  Time: 오전 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>전과자</title>
    <%@ include file="/link.jsp" %>
    <style>
        body {
            font-family: Pretendard, sans-serif;
            font-size: 16px;
            font-weight: 400; /* weight 다름 */
            line-height: 28px;
        }

        .detail-container {
            display: flex;
            width: 100%;
            gap: 4%;
            justify-content: space-between;
        }

        .modal-detail-content {
            height: 50vh;
            overflow-y: auto;
        }

        .detail-content {
            width: 100%;
        }

        .detail-row {
            margin-bottom: 10px;
        }

        #modal-close {
            position: absolute;
            top: 24px;
            right: 24px;
        }

        .custom-table {
            border: 1px solid #E9E2D9;
            border-collapse: collapse;
        }

        .custom-table tr {
            border-bottom: 1px solid #E9E2D9;
        }

        .td-left {
            font-family: Pretendard, sans-serif;
            font-size: 16px;
            font-weight: 400;
            line-height: 28px;
            background-color: #F9F5F2;
            color: #5C492C;
            text-align: center;
            vertical-align: middle;
        }

        .td-right {
            font-family: Pretendard, sans-serif;
            font-size: 16px;
            font-weight: 400;
            line-height: 28px;
            margin-left: 10%;
            width: 80%;
            color: #5C492C;
        }
        .modal-box{
            width: 800px;
        }
    </style>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="modal-overlay">
    <div class="modal-box">
        <div class="mdl-text">
            <button type="button" id="modal-close" class="btn-close" aria-label="Close"></button>
            <div class="s-h-imcre24">${searchDTO.snack_name}</div>
            <div class="modal-detail-content p-regular">
                <table class="custom-table">
                    <tr>
                        <td class="td-left">원재료</td>
                        <td class="td-right">${searchDTO.snack_ingredients}</td>
                    </tr>
                    <tr>
                        <td class="td-left">열량</td>
                        <td class="td-right">${searchDTO.kcal}kcal</td>
                    </tr>
                    <tr>
                        <td class="td-left">나트륨</td>
                        <td class="td-right">${searchDTO.sodium}mg</td>
                    </tr>
                    <tr>
                        <td class="td-left">탄수화물</td>
                        <td class="td-right">${searchDTO.carb}g</td>
                    </tr>
                    <tr>
                        <td class="td-left">당류</td>
                        <td class="td-right">${searchDTO.sugars}g</td>
                    </tr>
                    <tr>
                        <td class="td-left">단백질</td>
                        <td class="td-right">${searchDTO.protein}g</td>
                    </tr>
                    <tr>
                        <td class="td-left">콜레스테롤</td>
                        <td class="td-right">${searchDTO.cholesterol}mg</td>
                    </tr>
                    <tr>
                        <td class="td-left">지방</td>
                        <td class="td-right">${searchDTO.fat}g</td>
                    </tr>
                    <tr>
                        <td class="td-left">포화지방</td>
                        <td class="td-right">${searchDTO.saturated_fat}g</td>
                    </tr>
                    <tr>
                        <td class="td-left">트랜스지방</td>
                        <td class="td-right">${searchDTO.trans_fat}g</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="sub-container">
    <div class="detail-container">
        <div class="thumbnail detail-thumbnail" style="background-image: url(${searchDTO.snack_img})"></div>
        <div class="detail-content">
            <p style="color: #B48D69;">${searchDTO.company}</p>
            <div class="detail-row">
                <span class="h-imcre24">${searchDTO.snack_name} </span>
                <span style="color: #B48D69;">(${searchDTO.netwt}g / ${searchDTO.kcal}kcal)</span>
                <c:choose>
                    <c:when test="${searchDTO.avg_score >= 1 && searchDTO.avg_score < 1.5}">
                        <c:set var="scoreImg" value="<img src='/resources/img/score/score01.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 1.5 && searchDTO.avg_score < 2}">
                        <c:set var="scoreImg"
                               value="<img src='/resources/img/score/score_01_half.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 2 && searchDTO.avg_score < 2.5}">
                        <c:set var="scoreImg" value="<img src='/resources/img/score/score02.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 2.5 && searchDTO.avg_score < 3}">
                        <c:set var="scoreImg"
                               value="<img src='/resources/img/score/score_02_half.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 3 && searchDTO.avg_score < 3.5}">
                        <c:set var="scoreImg" value="<img src='/resources/img/score/score03.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 3.5 && searchDTO.avg_score < 4}">
                        <c:set var="scoreImg"
                               value="<img src='/resources/img/score/score_03_half.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 4 && searchDTO.avg_score < 4.5}">
                        <c:set var="scoreImg" value="<img src='/resources/img/score/score04.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score >= 4.5 && searchDTO.avg_score < 5}">
                        <c:set var="scoreImg"
                               value="<img src='/resources/img/score/score_04_half.png' height='24'>"/>
                    </c:when>
                    <c:when test="${searchDTO.avg_score == 5}">
                        <c:set var="scoreImg" value="<img src='/resources/img/score/score05.png' height='24'>"/>
                    </c:when>
                    <c:otherwise/>
                </c:choose>
                <p style="color: #B48D69; margin-top:5px">${scoreImg} 리뷰 (${searchDTO.avg_score}
                    / ${searchDTO.review_count}개)</p>
            </div>
            <div style="margin: 20px 0 30px 0;">
                <div class="detail-row">탄수화물 : ${searchDTO.carb}g</div>
                <div class="detail-row">당류 : ${searchDTO.sugars}g</div>
                <div class="detail-row">나트륨 : ${searchDTO.sodium}mg</div>
                <div class="detail-row">단백질 : ${searchDTO.protein}g</div>
                <div class="detail-row">알러지 : ${searchDTO.allergy}</div>
                <div class="detail-row">
                </div>
            </div>
            <div class="btn-wrap-row">
                <button class="fill-btn" id="detailInfo">상세보기</button>
                <button type="button" id="goToSearchList" class="light-fill-btn">돌아가기</button>
            </div>
        </div>
    </div>
    <%--<a href="<c:url value='snackWikiSearch.jsp?keyword=${keyword}'/>" id="goToSearchList">돌아가기</a>--%>
</div>
<script>
    $(document).ready(function () {
        $('#goToSearchList').click(function (event) {
            event.preventDefault(); // 기본 동작을 취소합니다.
            let urlParams = new URL(location.href).searchParams;
            let pageNum = urlParams.get('page');
            let keyword = urlParams.get('keyword');
            let category = urlParams.get('category');
            let sortName = urlParams.get('sortName');
            let selectedAllergies = urlParams.get('selectedAllergies');
            if (pageNum === null) {
                window.location.href = 'snackWikiSearch?category=' + encodeURIComponent(category) + '&keyword=' + encodeURIComponent(keyword) + '&sortName=' + encodeURIComponent(sortName) + '&selectedAllergies=' + encodeURIComponent(selectedAllergies);
            } else {
                window.location.href = 'snackWikiSearch?category=' + encodeURIComponent(category) + '&keyword=' + encodeURIComponent(keyword) + '&sortName=' + encodeURIComponent(sortName) + '&selectedAllergies=' + encodeURIComponent(selectedAllergies) + '&page=' + encodeURIComponent(pageNum);
            }
        });
    });
    $("#detailInfo").click(function () {
        modalShow();
    });
    $("#modal-close").click(function () {
        modalHide();
    });
</script>
<%@include file="/footer.jsp" %>
</body>
</html>
