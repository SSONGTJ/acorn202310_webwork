<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/fortune">오늘의 운세</a></li>
			<li><a href="${pageContext.request.contextPath}/test/fortune.jsp">테스트</a></li>
			<li><a href="${pageContext.request.contextPath}/member">회원정보</a></li>
			<li><a href="${pageContext.request.contextPath}/friend/list">친구목록</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list">회원목록</a></li>
		</ul>
	</div>
</body>
</html>











