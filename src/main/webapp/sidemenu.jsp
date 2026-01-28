<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside id="sideMenu" class="side-menu">
	<div class="side-title">
		ログインして<br>好きなチームを<br>
		<%-- If username is available in session, show it --%>
		<% String username = (String) session.getAttribute("username"); %>
		<%= (username != null) ? (username + "さんを応援しよう!") : "応援しましょう!" %>
	</div>
	<%
		String userid = (String) session.getAttribute("userid");
		if(userid != null) {
	%>
		<button class="side-login-btn" onclick="location.href='<%=request.getContextPath()%>/mem/logout.do'">ログアウト</button>
	<% } else { %>
		<button class="side-login-btn" onclick="location.href='<%=request.getContextPath()%>/mem/login.do'">ログイン</button>
	<% } %>
	<hr>
	<div class="side-subtitle">おすすめチーム</div>
	<button class="side-team-btn">チームを探す</button>
</aside>