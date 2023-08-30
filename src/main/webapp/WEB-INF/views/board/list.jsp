<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시글 목록</title>
    <%@ include file="/link.jsp" %>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="sub-container">
    <h3 class="h-imcre24">게시판 목록</h3>

<form action="list" method="get">
    <select name="searchType">
        <option value="bbs_title" <c:if test="${page.searchType eq 'bbs_title'}">selected</c:if>>제목</option>
        <option value="bbs_content" <c:if test="${page.searchType eq 'bbs_content'}">selected</c:if>>내용</option>
        <option value="member_id" <c:if test="${page.searchType eq 'member_id'}">selected</c:if>>작성자</option>
    </select>

    <input type="text" name="keyword" value="${page.keyword}"/>

    <button type="button" id="searchBtn">검색</button>
    <%--  <select name="category">--%>
    <%--    <option value="question">질문게시판</option>--%>
    <%--    <option value="free">자유게시판</option>--%>
    <%--  </select>--%>
    <%--  <input type="text" name="keyword" placeholder="검색어를 입력하세요">--%>
    <%--  <button type="submit">검색</button>--%>
</form>

<table>

    <thead>
    <tr>
        <p><a href="write">글 작성하기</a></p><br>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.bbs_id}</td>
            <td>
                <a href="/board/view?bbs_id=${list.bbs_id}">${list.bbs_title}</a>
            </td>
            <td>${list.member_id}</td>
            <td>
                <fmt:formatDate value="${list.create_dt}" pattern="yyyy-MM-dd"/>
            </td>
            <td>${list.bbs_views}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div>
    <c:if test="${page.prev}">
        <span>[ <a href="/board/list?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
    </c:if>

    <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
			<c:if test="${select != num}">
                <a href="/board/list?num=${num}${page.searchTypeKeyword}">${num}</a>
            </c:if>

			<c:if test="${select == num}">
                <b>${num}</b>
            </c:if>
		</span>
    </c:forEach>

    <c:if test="${page.next}">
        <span>[ <a href="/board/list?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
    </c:if>

    <div>
        <%--    <select name="searchType">--%>
        <%--      <option value="bbs_title" <c:if test="${page.searchType eq 'bbs_title'}">selected</c:if>>제목</option>--%>
        <%--      <option value="bbs_content" <c:if test="${page.searchType eq 'bbs_content'}">selected</c:if>>내용</option>--%>
        <%--      <option value="member_id" <c:if test="${page.searchType eq 'member_id'}">selected</c:if>>작성자</option>--%>
        <%--    </select>--%>

        <%--    <input type="text" name="keyword" value="${page.keyword}"/>--%>

        <%--    <button type="button" id="searchBtn">검색</button>--%>
    </div>
</div>

<script>
    document.getElementById("searchBtn").onclick = function () {

        let searchType = document.getElementsByName("searchType")[0].value;
        let keyword =  document.getElementsByName("keyword")[0].value;

        location.href = "/board/list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
    };
</script>


<%@include file="/footer.jsp" %>


</body>
</html>
