<%--
  Created by IntelliJ IDEA.
  User: ohlocal
  Date: 2023-08-04
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="header">
    <h1 class="logo">
        <a href="/index.jsp">
            <img src="/resources/img/logo.svg" alt="로고">
        </a>
    </h1>
    <ul class="gnb">
        <li>
            <a class="p-medium" href="/snack/snackWiki.jsp">쿠키 위키</a>
            <ul class="depth2">
                <li><a class="p-medium" href="/snack/snackWiki.jsp">과자 DB</a></li>
                <li><a class="p-medium" href="/snack/snackWiki.jsp">새로 나온 과자</a></li>
            </ul>
        </li>
        <li>
            <a class="p-medium" href="#">쿠키마스터</a>
            <ul class="depth2">
                <li><a class="p-medium" href="/entertainment/ideal.jsp">과자 이상형 월드컵</a></li>
                <li><a class="p-medium" href="#">오늘의 과자</a></li>
            </ul>
        </li>
        <li>
            <a class="p-medium" href="#">쿠키랭킹</a>
            <ul class="depth2">
                <li><a class="p-medium" href="#">나이별 랭킹</a></li>
                <li><a class="p-medium" href="#">성분별 랭킹</a></li>
                <li><a class="p-medium" href="#">브랜드별 랭킹</a></li>
            </ul>
        </li>
        <li>
            <a class="p-medium" href="#">전과자 이벤트</a>
            <ul class="depth2">
                <li><a class="p-medium" href="#">포인트 상점</a></li>
                <li><a class="p-medium" href="#">출석체크</a></li>
            </ul>
        </li>
        <li>
            <a class="p-medium" href="#">작당모의</a>
            <ul class="depth2">
                <li><a class="p-medium" href="#">공지사항</a></li>
                <li><a class="p-medium" href="/review/reviewList?num=1">리뷰 게시판</a></li>
                <li><a class="p-medium" href="/board/list">자유 게시판</a></li>
            </ul>
        </li>
    </ul>
    <div class="user-menu">
        <ul class="user-left">
            <c:if test="${sessionScope.memberId == null}">
                <li><a class="p-medium" href="/login">로그인</a></li>
                <li><a class="p-medium" href="/member/sign.jsp">회원가입</a></li>
            </c:if>
            <c:if test="${sessionScope.memberId != null}">
                <li><a class="p-medium" href="/logout">로그아웃</a></li>
                <li><div class="p-medium">${sessionScope.memberNickName}님 어서오세요</div></li>
            </c:if>
        </ul>
        <ul class="user-right">
            <li><a href="/member/mypage.jsp">
                <img src="/resources/img/icon/user.svg" alt="유저메뉴">
            </a></li>
<%--            <c:if test="${sessionScope.authInfo != null}">--%>
<%--                <li><a href="/member/mypage.jsp">--%>
<%--                    <img src="/resources/img/icon/user.svg" alt="유저메뉴">--%>
<%--                </a></li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${sessionScope.authInfo == null}">--%>
<%--                <li><a href="/login">--%>
<%--                    <img src="/resources/img/icon/user.svg" alt="유저메뉴">--%>
<%--                </a></li>--%>
<%--            </c:if>--%>
            <li><a href="#">
                <img src="/resources/img/icon/bell.svg" alt="알림">
            </a></li>
        </ul>
    </div>
</div>